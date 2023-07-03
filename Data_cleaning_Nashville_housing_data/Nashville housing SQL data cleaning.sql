/*DATA CLEANING USING SQL QUERIES*/


-- Standardize Date Format

ALTER TABLE housing
ALTER COLUMN saledate TYPE date
USING saledate::date;


-- Populating the Null property address data

SELECT A.parcelid, B.propertyaddress, COALESCE(A.propertyaddress,B.propertyaddress)
FROM housing AS A
JOIN housing AS B
ON A.parcelid = B.parcelid AND A.uniqueid != B.uniqueid
WHERE A.propertyaddress IS NULL;

UPDATE housing 
SET propertyaddress = COALESCE(A.propertyaddress,B.propertyaddress)
FROM housing AS A
JOIN housing AS B
ON A.parcelid = B.parcelid AND A.uniqueid != B.uniqueid
WHERE A.propertyaddress IS NULL;



--Splitting up the address columns into individual columns (address, city, state)

--1. Adding address, city, and state columns for Property address
ALTER TABLE housing
ADD COLUMN propertysplitaddress VARCHAR(300),
ADD COLUMN propertysplitcity VARCHAR(300),
ADD COLUMN propertysplitstate VARCHAR(300);

--2. Splitting Property address into parts using the SUBSTRING() function
UPDATE housing
SET propertysplitaddress = SUBSTRING(propertyaddress,1,13),
    propertysplitcity = SUBSTRING(propertyaddress,18,15),
    propertysplitstate = SUBSTRING(propertyaddress,14,3)
WHERE propertysplitaddress IS NULL AND propertysplitcity IS NULL AND propertysplitstate IS NULL;

--3. Adding address, city, and state columns for Owner address	  
ALTER TABLE housing
ADD COLUMN ownersplitaddress VARCHAR(300),
ADD COLUMN ownersplitcity VARCHAR(300),
ADD COLUMN ownersplitstate VARCHAR(300);

--4. Splitting Property address into parts using the SPLIT_PART() function
UPDATE housing
SET ownersplitaddress = SPLIT_PART(owneraddress,',',1),
    ownersplitcity = SPLIT_PART(owneraddress,',',2),
    ownersplitstate = SPLIT_PART(owneraddress,',',3);
    



-- Replacing the 'Y' and 'N' values in the sold as vacant column to Yes and No 

UPDATE housing
SET soldasvacant = CASE WHEN soldasvacant = 'Y' THEN 'Yes'
                   WHEN soldasvacant = 'N' THEN 'No'
                   ELSE soldasvacant
                   END
                   
                   
                   


/*Remove Duplicates(Assuming that entries with same parcelid,
propertyaddress,saleprice,saledata and legal reference are duplicate entries
despite having same different uniqueid)*/

WITH rownumCTE AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY parcelid,
                                                             propertyaddress,
                                                             saleprice,
                                                             saledate,
                                                             legalreference
                                                             ORDER BY uniqueid) AS rownum
                                                             FROM housing)
   
DELETE FROM housing
WHERE parcelid IN (SELECT parcelid FROM rownumCTE WHERE rownum >1)





-- Delete Unused Columns

ALTER TABLE housing
DROP COLUMN taxdistrict, 
DROP COLUMN acreage, 
DROP COLUMN landvalue, 
DROP COLUMN yearbuilt, 
DROP COLUMN bedrooms, 
DROP COLUMN fullbath, 
DROP COLUMN halfbath 