<h1 align="center"> Coffee Review Project(In Progress) </h1>

## Overview
As an avid coffee drinker, I was excitied to see a data set on Kaggle with Reviews associate to coffee types and brands. I noticied the data set was scraped from the [Coffee Review Site](https://www.coffeereview.com) and started reviewing the details. 

Majority of the time was cleaning the data and updating details to make the data more manageable. Such as nulls, formatting, and missing data. After completing the data clean up, I created a view to start looking into my next batch of coffee to try next! [Bird Rock Coffee Roasters](https://www.coffeereview.com/review/suyusama-program-colombia/)

## Changes Made to Data
- Updated review_date with date. Used to removed the 00:00:00 format in the standard mm/dd/yyyy.
- Standardized NA values, found 'NA', 'Na/', '/', 'NA/NA'. Used NA to declare no value given.
- Added Coffee Type based on url and description. As there were variations as expresso, bottled, whole bean, cold brew selection in the data. 
- Updated Null values in coffee characteristics. Scale used in the review were based on 1 to 10 values. Used 0 to indicate no value given.
- Updated Slug column to end of sheet as review_url for easier read of data. 
- [Created view to use in an excel sheet.](https://docs.google.com/spreadsheets/d/1fMiXi-mO4mJiwWeSofErObLrrNKJE_p7UloDIFC5suM/edit?usp=sharing)

## Definitions
[Categories for Interpretation](https://www.coffeereview.com/interpret-coffee/)

[Types of Roasts](https://www.coffeereview.com/roast-definitions/)

[Scale of Review Ratings](https://www.coffeereview.com/how-coffee-review-works/)



## Data Set
[Kaggle - Coffee Data Review](https://www.kaggle.com/datasets/hanifalirsyad/coffee-scrap-coffeereview)

[Coffee Review Site](https://www.coffeereview.com)
