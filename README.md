# Retail Sales Dashboard

A live Power BI dashboard connected to a SQL Server database, showing retail sales performance across 5 simulated stores in New Zealand, with real-time data streaming and an automated low-sales alert. Built as a portfolio project to demonstrate SQL, data modeling, DAX, and dashboard design skills.

**Status: complete.**

## What this shows

- Total revenue, transaction count, Average Transaction Value (ATV), and Units Per Transaction (UPT)
- Revenue broken down by store, product category, and top products
- Daily revenue trend
- Revenue by hour of day, to identify peak trading times
- A store-by-category revenue matrix
- Interactive Store and City slicers to filter the whole report
- **Live data streaming**: the report connects via DirectQuery, so it updates automatically as new transactions arrive
- **An automated drop alert**: flags any store whose sales in the current hour have dropped sharply (40%+) compared to that store's typical performance in the same hour, tested by simulating a store outage

## About the data

The data is **simulated, not real sales data**. A Python script generates realistic but fake transactions across 5 NZ stores and 10 products, with patterns like busier lunchtime and after-work hours, and stronger weekend sales. A second script streams new transactions continuously to simulate live trading.

## Tech stack

- **SQL Server** — database, schema design, KPI queries, DirectQuery live connection
- **Power BI Desktop** — report building, DAX measures, data modeling, conditional formatting
- **Python** — data generation and live-streaming scripts (pyodbc, Jupyter notebooks)

## How it was built

1. Generated 30 days of simulated transaction data with a Python script
2. Designed a star schema in SQL Server: `transactions` as the fact table, `stores` and `products` as dimension tables
3. Wrote SQL queries for headline KPIs, store/category breakdowns, and time-based trends
4. Connected Power BI to SQL Server and built the report using DAX measures
5. Added interactive slicers for filtering by store and city
6. Switched the report to DirectQuery for live data
7. Built a Python script to stream new transactions continuously
8. Built and tested an automated alert that flags unusual sales drops per store

## Data model

`stores` and `products` connect to `transactions` through foreign keys (`store_id`, `product_id`). This is a standard star schema layout, used to keep sales events separate from descriptive lookup data.

## The drop alert, how it works

For each store, the report compares its revenue in the current hour today to its average revenue during that same hour across the full data history (excluding today). If revenue is down 40% or more, the store is flagged "Low Sales" and highlighted in the report. This was tested by simulating a store outage and confirming the alert correctly fired.

