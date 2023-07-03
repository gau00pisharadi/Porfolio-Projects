# [Marketing Campaign Results](https://platform.stratascratch.com/data-projects/marketing-campaign-results)

## Assignment
Imagine that Freedom ran a recent marketing campaign to promote the value proposition of how the debt relief program helps people achieve financial freedom. Assume the cost of this campaign was $5 million. There are five months of data in the datasets provided. Let’s say campaign took place over the course of the third month. You now want to show the marketing, sales and operations teams just how successful this campaign was.

Using the three datasets given:

1. Provide a quantitative assessment of whether the marketing campaign was successful. How and why did you choose your specific success metric(s)?
2. Based on the provided data, how would you recommend campaign strategy be adjusted in the future to improve performance?
3. How do you think campaign performance would have changed if we did not run the campaign in Month 3, but instead postponed it until month 6? Provide an incremental number versus your result in Question #1.

## Data Description

- **client_data.csv**: You will find data specific to fictional clients
    - client_id: Randomly generated unique surrogate identifier for a client
    - client_geographical_region: Client geographical location in relation to U.S. Census definitions
    - client_residence_status: Client residence status in relation to whether they rent or own
    - client_age: Client age in relation to date of birth

- **deposit_data.csv**: You will find data specific to the client deposit behavior
    - client_id: Randomly generated unique surrogate identifier for a client
    - deposit_type: Delineates whether a client deposit is the scheduled record or actual record
    - deposit_amount: Client deposit amount to the dedicated bank account with Freedom
    - deposit_cadence: Timing and pattern of client deposit activity
    - deposit_date: Deposit date for deposit type

- **calendar_data.csv**: This is a calendar reference table
    - gregorian_date: This date aligns with the Gregorian calendar
    - month_name: These are the designated months in the case study
        - Month 1 and 2 are pre-campaign
        - Month 3 is the campaign
        - Month 4 and 5 are post-campaign
