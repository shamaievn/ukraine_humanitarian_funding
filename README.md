# Ukraine Mine Action Funding Analysis

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-success)

SQL Queries preparing data and Power BI dashboard analyzing Mine Action and all humanitarian clusters funding in Ukraine (2014-2026) using OCHA FTS data.

---

## What I Built

Interactive dashboard with two pages:
- **Page 1:** Mine Action funding trends (requirements vs actual funding)
- **Page 2:** All humanitarian sectors comparison (where Mine Action fits in)

**Tools:** Power BI, PostgreSQL, SQL  
**Data:** OCHA Financial Tracking Service

---

## Preview

### Page 1: Mine Action Analysis
![Page 1](./images/page1_mine_action_funding_analysis_2022.png)
![Page 1](./images/page1_mine_action_funding_analysis_2025.png)

### Page 2: All Sectors Overview
![Page 2](./images/page2_humanitarian_clusters_overview_2025.png)

---

## Key Findings

**1. Mine Action funding grew 25× from 2021 to 2025**
- 2021: $4M (33% of requirements)
- 2022: $22M (25% - emergency collapse)
- 2025: $111M (128% - now overfunded)

**2. Most sectors remain underfunded**
- Food Security: 31% of requirements
- Emergency Shelter: 36%
- Mine Action is one of few exceeding plan

**3. Donor fatigue visible**
- 2022 peak: $1.86 billion
- 2025: $1.20 billion (-36%)

---

## Files

- **[`dashboard.pbix`](./dashboard.pbix)** — Interactive Power BI dashboard
- **[`sql/`](./sql/)** — Data preparation queries (PostgreSQL)
  - [`02_share_analysis.sql`](./sql/02_share_analysis.sql) — Mine Action share trends
  - [`03_growth_analysis.sql`](./sql/03_growth_analysis.sql) — Top 5 clusters by absolute funding growth
  - [`04_funding_gap.sql`](./sql/04_funding_gap.sql) — Funding adequacy analysis
  - [`05_all_clusters_summary.sql`](./sql/05_all_clusters_summary.sql) — Aggregate statistics
- **[`images/`](./images/)** — Dashboard screenshots (Page 1, Page 2)

---

## How to View

**Download** [dashboard.pbix](./dashboard.pbix) and open with free [Power BI Desktop](https://aka.ms/pbidesktop)

**Features:**
- Year slicer (2014-2026)
- Dynamic KPIs
- Conditional formatting

---

## What I Learned

- SQL queries (CTEs, JOINs, aggregations)
- Power BI dashboards (DAX measures, slicers, formatting)
- Working with humanitarian data
- Data storytelling

---

### Data Pipeline
HDX Dataset
→
PostgreSQL Database
→
SQL Queries (aggregation, filtering, calculations)
→
CSV Exports
→
Power BI Desktop (data modeling, DAX measures, visualizations)

---

## Data Source

[OCHA FTS via HDX](https://data.humdata.org/dataset/ukr-requirements-and-funding-data)

**Note:** FTS tracks UN-coordinated appeals. Additional funding may flow through bilateral programs not shown here.

---

## Contact

Nikita Shamaiev  
[LinkedIn](https://linkedin.com/in/nikita-shamaiev)
