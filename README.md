# Retail Sales Dashboard

A Power BI dashboard built on a SQL Server database, showing retail sales performance across 5 simulated stores in New Zealand. Built as a portfolio project to demonstrate SQL, data modeling, and dashboard design skills.

**Status: work in progress.** Core dashboard is complete. Live streaming and automated alerts are being added next.

## What this shows

- Total revenue, transaction count, Average Transaction Value (ATV), and Units Per Transaction (UPT)
- Revenue broken down by store, product category, and top products
- Daily revenue trend over a 30-day period
- Revenue by hour of day, to identify peak trading times
- A store-by-category revenue matrix
- Interactive Store and City slicers to filter the whole report

## About the data

The data is **simulated, not real sales data**. A Python script generates realistic but fake transactions across 5 NZ stores and 10 products, with patterns like busier lunchtime and after-work hours, and stronger weekend sales.

## Tech stack

- **SQL Server** — database, schema design, KPI queries
- **Power BI Desktop** — report building, DAX measures, data modeling
- **Python** — data generation script

## Project structure
