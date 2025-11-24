# semantic-analytics-agent

An agentic analytics framework that uses **semantic views** to turn raw data into intelligent insights.  
This project builds **autonomous data agents** capable of interpreting business logic, querying analytical models, and generating human-ready insights using a semantic layer.

---

## 🚀 What I’ll Build

An end-to-end **Agentic Analytics** solution that includes:

- **Data Foundation**
  - 13 dimension tables, 4 fact tables
  - Salesforce CRM integration (accounts, opportunities, contacts)
- **Semantic Views**
  - Business-friendly views for **Sales, Marketing, Finance & HR**
  - Consistent metric definitions across teams
- **AI Enhancement**
  - Auto-generate semantic views using **Semantic View Autopilot**
- **Natural Language Querying**
  - Ask questions in plain English and get answers powered by **Cortex Analyst** (or your LLM of choice)
- **Interactive Apps**
  - Streamlit visualizations and chat interfaces
- **Intelligent Agents**
  - Cross-functional AI agents that orchestrate queries, validate results, and explain insights

---

## 🧱 Data Foundation

This project creates a compact but realistic data warehouse that supports cross-functional analytics across **Sales, Marketing, Finance, and HR** domains.

### Dimension Tables (13)

- `product_category_dim`
- `product_dim`
- `vendor_dim`
- `customer_dim`
- `account_dim`
- `department_dim`
- `region_dim`
- `sales_rep_dim`
- `campaign_dim`
- `channel_dim`
- `employee_dim`
- `job_dim`
- `location_dim`

### Fact Tables (4)

- `sales_fact`  
  Sales transactions with amounts and units (**~12,000 records**).

- `finance_transactions`  
  General ledger–style financial transactions across departments.

- `marketing_campaign_fact`  
  Campaign performance metrics (spend, impressions, clicks, conversions) with product targeting.

- `hr_employee_fact`  
  Employee history with salary, department, region and **attrition** flags (**~5,640 records**).

### Salesforce CRM Tables (3)

- `sf_accounts`  
  Customer accounts linked to `customer_dim` / `account_dim` (**~1,000 records**).

- `sf_opportunities`  
  Sales pipeline, stages and revenue forecasts (**~25,000 records**).

- `sf_contacts`  
  Contacts with campaign attribution and basic profile info (**~37,563 records**).

Together these tables power unified analytics such as:

- Revenue by product / region / channel
- CAC vs LTV by campaign
- Pipeline coverage and win-rates by rep & segment
- Headcount, salary, and attrition by department / location
- P&L–style reporting by department

---

## 🧠 Semantic Views & Agentic Layer

On top of the base tables, the project defines **semantic views** that encode business logic:

- **Sales Semantic Views**
  - e.g. `sales_summary_vw`, `customer_ltv_vw`, `pipeline_health_vw`
- **Marketing Semantic Views**
  - e.g. `campaign_performance_vw`, `channel_roi_vw`
- **Finance Semantic Views**
  - e.g. `department_pnl_vw`, `spend_vs_budget_vw`
- **HR Semantic Views**
  - e.g. `attrition_risk_vw`, `headcount_summary_vw`

These views:

- Hide raw warehouse complexity
- Expose **business-friendly columns and metrics**
- Become the **primary interface** for LLMs, agents, BI tools, and apps

### Semantic View Autopilot

The repo includes a **Semantic View Autopilot** component that can:

- Read table schemas & relationship metadata
- Propose semantic views for a given domain (e.g. “Marketing Funnel”)
- Generate SQL for the views
- Optionally write those views back to your warehouse

---

## 🤖 Intelligent Analytics Agents

The “agentic” part of this project comes from AI agents that:

1. **Understand the semantic layer**
   - Know which views to use for Sales vs Marketing vs HR questions
2. **Generate & execute queries**
   - Translate natural language to SQL against semantic views
3. **Validate and refine**
   - Check results for obvious issues (e.g. empty sets, suspicious totals)
4. **Explain insights**
   - Summarize results in human language, with context and caveats

Example use cases:

- “Show me net new pipeline created last quarter by region and segment.”
- “Which campaigns drive the highest LTV for subscription products?”
- “Where is attrition highest, and what is the average tenure there?”
- “What’s our year-to-date P&L by department vs budget?”

---

## 🏗️ High-Level Architecture

```text
          ┌────────────────────┐
          │   Source Systems    │
          │  (CSV, Salesforce)  │
          └────────┬────────────┘
                   │
                   ▼
          ┌────────────────────┐
          │   Data Loading &    │
          │   Base Warehouse    │
          └────────┬────────────┘
                   │  (13 dims, 4 facts, 3 SF tables)
                   ▼
          ┌────────────────────┐
          │   Semantic Views    │
          │ (Sales, Mktg, Fin,  │
          │        HR)          │
          └────────┬────────────┘
                   │
          ┌────────▼────────────┐
          │  LLM / Cortex Layer │
          │  + Semantic Autopilot│
          └────────┬────────────┘
                   │
     ┌─────────────▼─────────────┐
     │   Apps & Agents           │
     │ - Streamlit dashboards    │
     │ - Chat-style NL querying  │
     │ - Cross-functional agents │
     └───────────────────────────┘
