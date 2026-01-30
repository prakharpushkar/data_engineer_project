# dbt Analytics Engineering Mini Project

## Project Overview
This project aimed to clean and transform raw data into analytics-ready table with the help of data build tool (dbt), which is a python based tool.

## Setup Instructions
1. Install python and a code editor.
2. Create a virtual environment.
3. Install dbt,Duckdb & other dependencies.
4. Load the csv files.
5. Run and test dbt models with 'dbt run' and 'dbt test' respectively.

## Transformations Applied
1. Raw data was cleaned and standardized in staging models by renaming columns, normalizing text fields, handling null values, and deriving business-friendly flags such as is_refunded. 
2. An intermediate model joins users, orders, and payments to create a unified order-level dataset
3. A final model aggregates this data by date and city to produce analytics-ready metrics such as order counts, revenue excluding refunds, and refund volumes.

## Assumptions
1. one payment per order.
2. refunded orders are exclided from revenue.
3. one order associated with only one user. 

## Challenges Faced
1. Initial dbt setup.
2. making profile configuration.
3. Writing SQL queries.

## Improvements With More Time
1. Writing more efficient queries.
2. add more tests and models.

## Time Spent
Time spent is around 10-12 hours over 2 days.