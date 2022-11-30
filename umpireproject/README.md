<p align="center">
<img src="https://media.giphy.com/media/3otOKsqHz8cLLzD7JC/giphy.gif" width="400" height="250">
</p>

<h1 align="center"> Umpire Accuracy Exploratory Project</h1>

## Purpose
As an avid baseball fan, Go Dodgers!, I wanted to expolore some statistical data for umpires behind the plate. I used data on Kaggle from the [UmpScoreCard](https://umpscorecards.com/) and explored into the data to see if any recent MLB rule changes have impacted the overall performance of umpire calls. A great way to improve my querying skills, at the same time review some baseball data. 

## Interesting Findings
### High and Low Accuracy Games
- 1 Perfect game with a 100% accuracy
- 32 Total games that were above or equal to 99% accuracy. (19 in 2022 and 14 for all years before)
- 183 Total games below or equal to 85% accuracy. (Large Majority are before 2020)

### Yearly Metrics
- Starting in 2019 we start to see an increase in overall accuracy and a drop in incorrect calls. 
- 2022 Playoff Statics were the best for the data points captured
- 2017 Season had a sudden increase in accuracy and drop in incorrect calls when compared to 2 year before and after. 

### Does Home Field also Impact Umpires (Theory) 
- For the total data we see 9753 wins for Home Teams and 8459 Away Teams
- We see generally the away team on average has a higher number of incorrect calls and correct calls. Accuracy remains the same. 
- Games with a 1 score difference we see the away team reciving on average 12.00 incorrect calls to 11.59 for the home team and 146.16 correct calls to 141.65 for the home team.
- Games with both teams scoring more than 10 runs saw the same story. With the away team reciving on average 14.27 incorrect calls to 13.56 and 193.07 to 180.00. 

### Rule Changes
- MLB altered baseballs in use for 2021 season. The league required all baseballs to have a coefficient of restituion (bounce of the ball) to be in a new range. To increase drag on baseball. In attempt to reduce home run rate. 
- MLB enforced rule on illegal use of foreign substance on the baseball. Pitchers will have more mandatory checks per game. 

## Conclusions
- With the more recent crack down on illegal substance that pitches are using in game also caused their overall [spin rate to drop](https://www.nytimes.com/interactive/2021/07/19/upshot/major-league-baseball-spin-rate-shift.html). Most major league pitches utilize a variation of fastballs, breaking balls, and changeups that all visually appear differently to batters. The overall rotation of the baseball seems to also impact how umpires are able to track the baseball into the strike zone. 
- As the MLB is looking to incoporate AI systems to improve the overall correct balls and strikes in a game. We could also see the catcher position alter as well. Catchers also have an important role in ["framing runs"](https://theanalyst.com/na/2022/08/will-some-catchers-be-pushed-out-of-baseball-when-the-robot-umpires-arrive)  in which they are awarded a pitch outside of the strike zone with their glove placement during the catch of a pitch. Having a system that will automatically call the ball might also alter catchers into a more traditional on base position.


## Materials Used
[MLB Baseball Umpire Scorecards 2015 - 2022](https://www.kaggle.com/datasets/mattop/mlb-baseball-umpire-scorecards-2015-2022)

[UmpScoreCard](https://umpscorecards.us/)

[MLB Article - Rule Enforcement](https://www.mlb.com/news/faq-sticky-stuff-and-new-rule-enforcement)

[MLB to alter baseballs for '21 season](https://www.mlb.com/news/mlb-to-alter-baseballs-for-2021)

[Spin Rate Drop - NY Times](https://www.nytimes.com/interactive/2021/07/19/upshot/major-league-baseball-spin-rate-shift.html)

[AI TakeOver](https://theanalyst.com/na/2022/08/will-some-catchers-be-pushed-out-of-baseball-when-the-robot-umpires-arrive/)
