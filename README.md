
# About the Big picture of Data Pipeline

Draw the slide with the data pipeline overview

# About the extractions 

Speak about the tools: rivery, stitch

# About the Orchestration

Speak about Luigi/Airflow

# About the Data Catalog

Speak about Data Hub/Data Catalog

# Pipeline Design

<img width="800" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/3b71da99-fa8d-4125-87c1-c56dfd4394cd">

# About the Data Pipeline - Model architecture

All tables are possibly found [here](models). 

I am using the [Medallion Architecture](https://www.databricks.com/glossary/medallion-architecture), and I split the layers using `bronze`, `silver`, and `gold`. 

## Bronze

The bronze layer is the data ingestion and I don't modify the data. There is a [staging layer](models/sources/stg_real_estate_property_transactions_informations.sql), where we can make an initial transformation like switching the typo or creating tables using the incremental method. 

Some examples about configurations in dbt that is good to do in Real Estate Data Set:
  `materialized='incremental'`,
  `unique_key='id'`,
  `strategy='timestamp'`,
  `updated_at='date'`

## Silver
The Rental schema is above:

<img width="800" alt="image" src="XX">

The Property schema is above:

<img width="800" alt="image" src="XXX">

> [!IMPORTANT]
> There are a lot of modes to represent the silver layer, using Star Schema or Snowflake methods.
> In this case, I am using Star Schema because the main motivation is to organize the data. I talked more about that in my article about [Performance of Different Data Modeling Approaches in Modern Storage Architecture](https://github.com/geanpannellini/MBA_final_project)

> Some characteristic of the silver layer is the Data Catalog can use these tables to incentive a data-driven mindset to the company
> Every dimension is here making "easy" access.

## Gold

The gold is the business layer and can be used for business queries and platform data views(Lightdash, Looker, Metabase).

## CI/CD

Speak about github actions

## Lineage graphs

<img width="800" alt="image" src="xx">

## Tips around macros, data validation, and documentation

> :point_right: [Macros] I created a simple "dates macro" to help with monthly, quarterly, semiannually. To check a case, [click here.](macros/dates.sql) To check an application, [click here.](analyses/total_transactions_by_quarter.sql)

> :point_right: [Data Validation] In all tables, tests are implemented on the primary key and important columns. To check a case, [click here.](models/sources/sources.yml)

> :point_right: [Documentation] In all tables, the implemented tables and columns are described, and the schema can be integrated with the Data Catalog. To check a case, [click here.](models/silver/schema.yml)

# About Business Questions

You can utilize the gold area to address business inquiries effectively and you can access the [dashboard](https://app.lightdash.cloud/projects/3c4ef3e0-74c8-4710-9e00-9ec3bb1726ce/dashboards/fe196871-20c2-4da6-bf92-4a0f1fa660d9/edit) in `Lightdash` using the gold layer. As an example, I am using here "the rental all listings".

<img width="800" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/9ae888aa-a64a-4190-8ff1-35fc2e804961">

The primary model, [All Listings for Rental](models/gold/rental_all_listings.sql), provides the means to answer all the previous questions asked for the operational business.

In some situations is possible create a [Analyses](analyses/price_average.sql) area to create the top of questions.

 `Example: What is the average rent for each type of housing in different regions?` 


## Additional information: Stack

<img width="447" alt="image" src="https://github.com/geanpannellini/iowa_liquor_retail_sales/assets/70926945/5b6f6caf-9209-4bd7-a36c-bd2bbcfc04d8">
