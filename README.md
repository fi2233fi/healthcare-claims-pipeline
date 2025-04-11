# 🩺 Healthcare Claims Pipeline

A complete end-to-end data pipeline using **Amazon S3**, **Redshift Serverless**, **dbt**, and a dashboard layer — transforming raw patient claim data into clean, tested, and business-ready insights.

---

## 💡 Project Overview

This project simulates a real-world healthcare scenario by analyzing patient insurance claims. It walks through:

✅ Cleaning + structuring raw data with **Python**  
✅ Storing data in **Amazon S3**  
✅ Loading and transforming data in **Redshift** using **dbt**  
✅ Defining quality checks with dbt tests  
✅ Exposing a **dashboard** powered by transformed data

---

## 🛠️ Tech Stack

| Layer         | Tool/Service             |
|---------------|--------------------------|
| 🧊 Storage     | Amazon S3                |
| 🏢 Warehouse   | Amazon Redshift Serverless |
| 🛠️ Transform   | dbt                      |
| 📊 Dashboard   | Power BI or Streamlit   |
| 🐍 Language    | Python (Pandas)          |
| 💻 Versioning  | Git + GitHub             |

---

## 📂 Project Structure

dbt_healthcare/ │ ├── models/ │ ├── stg_insurance.sql # staging model │ ├── dim_patient_spending.sql # final model │ └── sources.yml # source config │ ├── tests/ # dbt test placeholders ├── snapshots/ # (optional future use) ├── seeds/ # (optional seed files) ├── macros/ # custom macros (default) ├── analyses/ # additional dbt logic │ ├── dbt_project.yml # dbt config └── README.md # you’re here!

---

## 📊 Key Models

### `stg_insurance`
Cleans and stages the raw insurance claims dataset. Applies basic standardization and formatting.

### `dim_patient_spending`
Transforms staged data to categorize patients into spending brackets (`Low`, `Medium`, `High`) based on medical charges. Supports demographic analysis across:
- Gender
- Region
- Smoking status

---

## ✅ Data Quality Tests

| Test Type         | Field              | Description                              |
|------------------|--------------------|------------------------------------------|
| `not_null`       | `spending_bracket` | Ensures no missing classifications       |
| `accepted_values`| `spending_bracket` | Confirms only `Low`, `Medium`, or `High` |

---

## 📎 Lineage (via `dbt docs`)

```text
insurance_raw (S3 → Redshift)
        ↓
stg_insurance
        ↓
dim_patient_spending
        ↓
📊 Patient Spending Dashboard
🧾 Sample Input Data
age	gender	bmi	children	smoker	region	charges
19	female	27.9	0	yes	southwest	16884.92
18	male	33.77	1	no	southeast	1725.55
28	male	33.0	3	no	southeast	4449.46
33	male	22.705	0	no	northwest	21984.47
32	male	28.88	0	no	northwest	3866.85
31	female	25.74	0	no	southeast	3756.62
