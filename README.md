
# About the Big picture (And big dream) of the Data universe on Clever! 

Draw the slide with the data pipeline overview

Before start,
My highligh and opinion:
For all decisions about wich tool we need use, we need understand the moment of the company. My first mindset is open source tools like:

1. Using Data Contracts project from spotify (To make a contract of data between the cloud storage and raw layer)

2. Data Hub from Linkedin (to catalog our data)

3. dbt as the open source transformation tool,

etc.

As an example, no make sense use a Databricks that is a expansive tool, if the company is in a Seed/Series A funding. It`s like drive a rocket in the moment that we need drive a bike and prepare the company for the next step! 

# About the extractions 

![image](https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/2610258a-651d-4a9c-98f8-7343197647d7)

Stitch and Rivery are two data integration and extraction platforms designed to streamline and automate the flow of data between different sources and destinations.
They are similar, but we can analyze the __cost, rows per month allowed to be collected, and the number of connectors__

<details>
  
<summary>Click to expand and look at the comparison </summary>

`Stitch:`

__Cost:__ Premium plan billed annually at $2,500. - Offers advanced security features, compliance, and extensive support options.

__Rows per Month:__ Allowed to be Collected - Supports up to 1 billion rows per month.

__Quantity of Connectors (Native Connectors):__  140+ native connectors.

__Situation:__ Ideal for organizations needing best-in-class security and compliance, suitable for enterprises with high data volumes.

`Rivery:`

__Cost:__ Charges based on RPU (Rivery Processing Unit) credits at $1.20 per RPU credit. - Offers scalability with options for advanced features and integration capabilities.

__Rows per Month:__ Allowed to be Collected

__Pricing based on data transferred:__ charges vary based on the amount of data processed, not strictly by row count.

__Quantity of Connectors (Native Connectors):__ 200+ native connectors.

__Situation:__ Targeted at advanced data teams with engineering capabilities, offering scalability, flexibility in data processing, and advanced integration options via API and CLI access.

</details>

# About the Orchestration

<img width="404" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/7e1449d9-75fe-4389-b72c-6ab0d09e8dbd">

### CI/CD

In another option, for some orchestration(Here, we are using an example dbt-core setup), we can use [GitHub Actions.](.github/workflows) With this way, it is possible to make the orchestration in GitHub and using dbt-core (open source and free). In the link, there are some examples of how we can create the CI/CD pipeline.

### Orchestration Tools Decisions

`Decisions:`

Evaluating the pros and cons of each tool, with the criteria __(Community, Documentation, Ease of use, Experience with the implementation, Code organization)__, we have opted to integrate Airflow into our current data stack. Key factors influencing this decision include the team's understanding of the importance of their prior exposure to some tools across the previous different companies(We need to understand the inside of the team). This familiarity promises to expedite our ability to initiate and scale its deployment within our workflows.

Moreover, considering the team's learning curve, our choice is Airflow, which lacks familiarity with either tool, the abundance of resources and the robust, active community were pivotal. These aspects facilitate rapid learning and troubleshooting through diverse discussion forums, significantly enhancing our adaptation process.

An additional noteworthy aspect is Dagster's capability to import Airflow projects, offering a streamlined pathway for potential future enhancements to our stack. This flexibility contrasts starkly with the potential complexities associated with migrating from Dagster to Airflow.

<details>
  
<summary>Click to expand and look at the comparison </summary>

`Airflow`

__Community:__ 34.8k stars and 13.6k forks on GitHub.

__Documentation:__ Excellent, detailed documentation allows for local setup in minutes. Airflow Documentation

__Ease of Use:__ High ease of use due to extensive online resources and community support.

__Scalability:__ No significant differences found compared to other tools.

__Experience with Use/Implementation:__ We need understand the team and the previous experience

__Code Organization:__ Notable for good code organization.

`Luigi`

__Community:__ 17.4k stars and 2.4k forks on GitHub.

__Documentation:__ Documentation is somewhat outdated and unclear. Luigi Documentation

__Ease of Use:__ Moderate ease of use, but less supported by online resources compared to Airflow and Dagster.

__Scalability:__ Despite some materials highlighting Luigi's advantages, no significant differences were found.

__Experience with Use/Implementation:__ We need understand the team and the previous experience

__Code Organization:__ Less emphasis on code organization compared to Airflow and Dagster.

`Dagster`

__Community:__ 10.4k stars and 1.3k forks on GitHub.

__Documentation:__ Excellent, detailed documentation allows for local setup in minutes. Dagster Documentation

__Ease of Use:__ High ease of use due to extensive online resources and community support.

__Scalability:__ No significant differences found compared to other tools.

__Experience with Use/Implementation:__ We need understand the team and the previous experience

__Code Organization:__ Excels in code organization, requiring fewer library imports and resulting in clear, well-organized code divided into multiple project folders.

</details>

# About the Data Catalog

Speak about Data Hub/Data Catalog

# About the Project - Creating & Populating SQL Database with Two Provided Datasets

<img width="800" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/e049cf94-ce0d-4535-a681-3fe5253e6fee">

# About the Data Cloud

I've used the Big Query, it`s an efficient storage to complement our open source tools.

<img width="800" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/86ccf997-2cfc-45b5-b29d-1b63d0314094">

# About the Model architecture

All tables are possibly found [here](models).

I am using the [Medallion Architecture](https://www.databricks.com/glossary/medallion-architecture), and I split the layers using `bronze`, `silver`, and `gold`. 

## Transformation Tools Decisions

`Decisions:`

In searching for a tool that meets our established criteria __(Integration and Compatibility, Cost and Licensing (Cloud), Community, Technical)__, we evaluated various options and concluded that Data Factory and Dataform should be the first to be discarded. These tools, developed by Google and Microsoft, are excellent for integrated stacks in their respective environments but are not ideal for the open-source and "plug and play" stack we seek at the company. We aim to avoid dependency on a single company, and with dbt being open-source, it offers greater freedom and independence. Additionally, dbt's extensive documentation, active community, and flexibility make it a simpler, more economical solution for our data modeling needs compared to Databricks.

<details>
  
<summary>Click to expand and look at the comparison </summary>

`Databricks:`

__Integration and Compatibility:__ It`s not for modeling purposes, but can do it.

__Cost and Licensing (Cloud):__ Could use existing environments without additional costs.

__Community:__ Lacks a specific community for data modeling.

__Technical:__ Requires development of testing and CI/CD functionalities. Code versioning, branch creation, and team development are underexplored, causing more questions than solutions.

`dbt (Data Build Tool):`

__Integration and Compatibility:__ Integrates with various cloud platforms; supports SQL and Python.

__Cost and Licensing (Cloud):__ $100 per developer per month + cluster costs.

__Community:__ Active on GitHub with over 1,500 forks and 8,700 stars.

__Technical:__ Supports data lineage, logging (metadata), local testing, and data quality assurance.

`Dataform:`

__Integration and Compatibility:__ Fully cloud-based; supports JavaScript for transformation definitions.

__Cost and Licensing:__ Available in free and paid plans (but expensive).

__Community:__ Relatively active with good documentation; over 141 forks and 781 stars.

__Technical:__ Supports data lineage, logging (metadata), local testing, and data quality assurance.

`Data Factory:`

__Integration and Compatibility:__ Primarily integrates with Azure, but also supports other systems.

__Cost and Licensing:__ Must be consulted with Microsoft.

__Community:__ Active support from Microsoft Azure, but lacks an active community.

__Technical:__ Supports data lineage, logging (metadata), local testing, and data quality assurance.

</details>

## Bronze

The bronze layer is the data ingestion and I don't modify the data. There is a [staging layer](models/sources/stg_real_estate_property_transactions_informations.sql), where we can make an initial transformation like switching the typo or creating tables using the incremental method. 

Some examples about configurations in dbt that is good to do in Real Estate Data Set:
  `materialized='incremental'`,
  `unique_key='id'`,
  `strategy='timestamp'`,
  `updated_at='date'`

## Silver

The Property schema is above:

<img width="800" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/47f03856-1c19-4faa-8811-d0239c377c22">

The Rental schema is above:

<img width="800" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/0b06ccac-83c5-441d-b844-603c8e44bac1">

> [!IMPORTANT]
> There are a lot of modes to represent the silver layer, using Star Schema or Snowflake methods.
> In this case, I am using Star Schema because the main motivation is to organize the data. I talked more about that in my article about [Performance of Different Data Modeling Approaches in Modern Storage Architecture](https://github.com/geanpannellini/MBA_final_project)

> Some characteristic of the silver layer is the Data Catalog can use these tables to incentive a data-driven mindset to the company
> Every dimension is here making "easy" access.

## Gold

The gold is the business layer and can be used for business queries and platform data views(Lightdash, Looker, Metabase).

## Lineage graphs - Using only property as an example

<img width="800" alt="image" src="https://github.com/geanpannellini/real_estate_property_transactions/assets/70926945/26840c85-11a8-40f8-abea-0060bf5279c9">

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
