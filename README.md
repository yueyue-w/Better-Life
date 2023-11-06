# UN Datathon Team Better Life

## Team member

Yueyue Wang: Graduate CS Student @UChicago
Qi Zhao: Graduate CS Student @UChicago
Qilin Zhou: Graduate CS Student @UChicago
Jiamu Xie: Graduate CS Student @UCSD
Shanchuan Hong: Graduate CS Student @UCSD

## Our Scope

Analysis focusing on Tanzania at province level with following three key transitions:

1. Education
2. Digital Connectivity
3. Energy Access and Affordability

## Our Objective

Understanding education gap, limitations in digital connectivity, and imbalanced resource allocations in Tanzania:

SDG:

1. Quality Education (Education Gap)
2. Affordable and Clean Energy (Limitations in Digital and Energy Connectivity)
3. Decent Work and Economic Growth (Imbalanced Resource Allocation)

## Data Source
World Bank Group Country Survey 2014:
https://microdata.worldbank.org/index.php/catalog/2237/
National Panel Survey in Tanzania Wave 1-5:
Wave 1 https://microdata.worldbank.org/index.php/catalog/76
Wave 2 https://microdata.worldbank.org/index.php/catalog/1050
Wave 3 https://microdata.worldbank.org/index.php/catalog/2252
Wave 4 https://microdata.worldbank.org/index.php/catalog/2863
Wave 5 https://microdata.worldbank.org/index.php/catalog/5639
National Panel Survey 2019-2020 - Extended Panel with Sex Disaggregated Data:
https://microdata.worldbank.org/index.php/catalog/3885

## Methodology

- Data Collection:

    - Methods of data collection (surveys, online datasets, etc.)

    - Combining a time-series dataset from five waves, which includes a total of 23,593 households

- Data Visualization:

    - Maps showing the geographical education gap

    - Maps showing educational institutions, enrollment rates, dropout rates, etc.

- Data Analysis:

  - Tools used (ArcGIS & Jupyter Notebook)

  - Techniques applied (statistical analysis, geospatial analysis, machine learning, etc.)

    - Applied KNN, Decision Tree, and Random Forest models, achieved F-1 at 90% and accuracy at 86% for predicting passing the Primary School Leaving Exam

## Solution

1. Solution Statement

Different measures for different groups

- To address the issue of regional resource mismatches: on one hand, we need to strengthen the educational expectations for the urban population, enhancing their willingness to pursue education. On the other hand, we need to provide more educational facilities for the rural population, improve infrastructure to reduce the difficulty they face in accessing education, and so on.

- To integrate family and regional educational beliefs in policy construction and implementation: from the household survey, we see that parents’ educational beliefs were major factors that prevented their children’s school enrollment across regions. Two top predictors in passing a primary school leaving exam were also highly correlated with family’s decisions: students who did not pass this exam usually have a family with lower education expenditure and later enrollment date.

2. Web App

An Interactive Web App for Policy Development

https://experience.arcgis.com/experience/67f3c5be15e04f859b269f6d159f25f2
