<div align="center">

# 🎬 Netflix Content Analysis Using SQL

### 📊 An End-to-End Data Analysis Project Using MySQL

<p>
  <a href="https://github.com/karansandul2004-stack/Netflix_SQL_Project/blob/main/netflix_Projects.sql">
    <img src="https://img.shields.io/badge/🔗%20View%20SQL%20Queries-1F6FEB?style=for-the-badge" alt="View SQL Queries"/>
  </a>
  <a href="https://github.com/karansandul2004-stack/Netflix_SQL_Project/blob/main/Netflix_Dashboard.html">
    <img src="https://img.shields.io/badge/📊%20View%20Dashboard-238636?style=for-the-badge" alt="View Dashboard"/>
  </a>
  <a href="https://github.com/karansandul2004-stack/Netflix_SQL_Project/blob/main/Netflix_SQL_Report_Karandeep.pdf">
    <img src="https://img.shields.io/badge/📄%20View%20Project%20Report-8250DF?style=for-the-badge" alt="View Project Report"/>
  </a>
  <a href="https://github.com/karansandul2004-stack/Netflix_SQL_Project/blob/main/netflix.csv">
    <img src="https://img.shields.io/badge/📁%20View%20Dataset-D97706?style=for-the-badge" alt="View Dataset"/>
  </a>
</p>

<br>

<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
<img src="https://img.shields.io/badge/SQL-Data%20Analysis-0F766E?style=for-the-badge" alt="SQL"/>
<img src="https://img.shields.io/badge/Data%20Cleaning-FF6B35?style=for-the-badge" alt="Data Cleaning"/>
<img src="https://img.shields.io/badge/Project%20Status-Completed-2EA043?style=for-the-badge" alt="Project Status"/>

</div>

---

## 📌 Project Overview

This project analyzes the **Netflix Movies and TV Shows dataset** using **MySQL** to uncover patterns and insights within Netflix's content library.

The project demonstrates how raw data can be cleaned, transformed, explored, and analyzed using SQL to answer practical, business-oriented questions.

The analysis covers **Movies vs. TV Shows, ratings, release years, countries, genres, directors, duration, and content trends**.

---

## 🎯 Project Objectives

* Understand and explore the Netflix dataset
* Perform data cleaning and preparation
* Analyze Movies and TV Shows
* Analyze content ratings
* Explore release-year trends
* Analyze countries contributing content
* Explore genres and categories
* Analyze movie durations
* Analyze TV Show seasons
* Answer business-oriented questions using SQL
* Practice advanced SQL techniques

---

## 🛠️ Tools & Technologies

| Tool / Technology     | Purpose                       |
| --------------------- | ----------------------------- |
| 🗄️ MySQL             | Database & SQL analysis       |
| 📊 SQL                | Data querying and analysis    |
| 🧹 Data Cleaning      | Preparing raw data            |
| 📈 Data Visualization | Presenting analytical results |
| 📄 PDF Report         | Documenting project findings  |
| 🌐 HTML               | Dashboard presentation        |

---

## 🗂️ Dataset

The project uses a Netflix Movies and TV Shows dataset containing information such as:

| Column         | Description                         |
| -------------- | ----------------------------------- |
| `show_id`      | Unique identifier for each title    |
| `type`         | Movie or TV Show                    |
| `title`        | Name of the content                 |
| `director`     | Director of the content             |
| `cast`         | Main cast members                   |
| `country`      | Country associated with the content |
| `date_added`   | Date content was added to Netflix   |
| `release_year` | Original release year               |
| `rating`       | Content rating                      |
| `duration`     | Movie duration / number of seasons  |
| `listed_in`    | Genre or category                   |
| `description`  | Description of the content          |

---

# 🧹 Data Cleaning

Before beginning the analysis, the dataset was inspected and prepared for analysis.

The cleaning process included:

* Checking data types
* Identifying NULL values
* Identifying empty values
* Handling missing information
* Checking inconsistent values
* Standardizing data where required
* Preparing columns for analysis

---

# 📊 Analysis Performed

## 🎬 Content Type Analysis

Analyzed:

* Number of Movies
* Number of TV Shows
* Distribution of Movies vs. TV Shows
* Content type trends

---

## ⭐ Rating Analysis

Analyzed:

* Available Netflix ratings
* Most frequently occurring ratings
* Rating distribution
* Ratings across Movies and TV Shows

---

## 📅 Release Year Analysis

Analyzed:

* Content released by year
* Distribution of titles across different release years
* Recent vs. older content
* Trends in Netflix's content library

---

## 🌍 Country Analysis

Analyzed:

* Countries contributing Netflix content
* Content distribution by country
* Countries with high numbers of titles

---

## 🎭 Genre Analysis

Analyzed:

* Most common genres
* Genre distribution
* Content categories
* Genre patterns across Netflix titles

---

## 🎥 Movie Analysis

Analyzed:

* Movie duration
* Longest movies
* Movie release trends
* Movie ratings
* Movie categories

---

## 📺 TV Show Analysis

Analyzed:

* Number of seasons
* TV Show ratings
* Release-year trends
* TV Show categories

---

# 🧠 SQL Concepts Used

### Basic SQL

* `SELECT`
* `WHERE`
* `DISTINCT`
* `ORDER BY`
* `GROUP BY`
* `HAVING`

### Aggregate Functions

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

### Intermediate SQL

* `CASE`
* `IFNULL()`
* `COALESCE()`
* String Functions
* Date Functions
* Subqueries
* Joins

### Advanced SQL

* Common Table Expressions (CTEs)
* Window Functions
* Ranking
* Conditional Analysis
* Complex filtering
* Multi-step analytical queries

---

# 🔍 Example SQL Analysis

### Content Type Distribution

```sql
SELECT
    type,
    COUNT(*) AS total_titles
FROM netflix
GROUP BY type
ORDER BY total_titles DESC;
```

### Ranking Content by Release Year

```sql
SELECT
    title,
    release_year,
    RANK() OVER (
        ORDER BY release_year DESC
    ) AS ranking
FROM netflix;
```

### Conditional Categorization

```sql
SELECT
    title,
    type,
    CASE
        WHEN type = 'Movie' THEN 'Movie Content'
        WHEN type = 'TV Show' THEN 'Series Content'
        ELSE 'Other'
    END AS content_category
FROM netflix;
```

---

# 📈 Project Deliverables

### 🔗 SQL Queries

The complete SQL analysis is available in:

**`netflix_Projects.sql`**

Contains queries for:

* Data cleaning
* Data exploration
* Content analysis
* Rating analysis
* Country analysis
* Genre analysis
* Advanced SQL analysis

### 📊 Dashboard

**`Netflix_Dashboard.html`**

Contains visual representation of the analyzed Netflix data.

### 📄 Project Report

**`Netflix_SQL_Report_Karandeep.pdf`**

Documents the project analysis and findings.

### 📁 Dataset

**`netflix.csv`**

The dataset used for the analysis.

---

# 📂 Project Structure

```text
Netflix_SQL_Project/
│
├── Query Outputs/
│
├── Netflix Content Analysis Using SQL(Project).txt
│
├── Netflix_Dashboard.html
│
├── Netflix_SQL_Report_Karandeep.pdf
│
├── netflix.csv
│
├── netflix_Projects.sql
│
└── README.md
```

---

# ▶️ How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/karansandul2004-stack/Netflix_SQL_Project.git
```

### 2️⃣ Open MySQL Workbench

Open:

```text
netflix_Projects.sql
```

### 3️⃣ Import the Dataset

Import:

```text
netflix.csv
```

into your MySQL database.

### 4️⃣ Execute the SQL Queries

Run the queries from:

```text
netflix_Projects.sql
```

to reproduce the analysis.

---

# 💼 Business Questions Explored

This project uses SQL to answer questions such as:

* What is the distribution of Movies and TV Shows?
* Which ratings are most common?
* Which years contain the most content?
* Which countries contribute the most content?
* Which genres occur most frequently?
* What are the longest movies?
* Which TV Shows have the highest number of seasons?
* How has Netflix's content library changed over time?

---

# 🎓 Key Learning Outcomes

Through this project, I strengthened my practical understanding of:

* SQL querying
* Data cleaning
* Exploratory Data Analysis
* Aggregation
* Joins
* Subqueries
* CTEs
* Window Functions
* Ranking
* Date and string functions
* Business-oriented problem solving
* Data interpretation
* Presenting analytical results

---

# 🚀 Future Improvements

Planned improvements include:

* 🐍 Python-based exploratory analysis
* 📊 Power BI dashboard
* 📈 Additional business KPIs
* 🔎 Deeper genre analysis
* 🌍 Geographic content analysis
* 📅 Advanced time-series analysis
* 🤖 AI-assisted analytical insights

---

# 👨‍💻 About Me

### Karandeep Singh

**Fresher Data Analyst | SQL | Python | Power BI | Excel**

I am building my Data Analytics portfolio through hands-on projects focused on **SQL, Excel, Python, Power BI, data cleaning, visualization, and business analysis**.

This Netflix project demonstrates my ability to work with a real-world dataset and use SQL to transform raw data into meaningful analytical insights.

---

<div align="center">

### ⭐ Thank You for Visiting!

If you found this project useful, feel free to explore the repository and review the SQL analysis.

**Happy Analyzing! 📊**

</div>
