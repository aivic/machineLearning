## Introduction
You finished watching a Sci-Fi movie in which the protogonist develops a humanoid robot that hold a conversation with people and even express its feelings just like humans do. You got excited and now want to build your own. But wait! Did I tell you that intelligence is built on information? From where can you attain this information?

From many ways out there, web scraping provides one of the path to get such information. To get you started - let us learn different angles of fetching data from the web using R. 

## Fetching Data from a Single Table or Multiple Tables Available on a HTML Webpage
[Yahoo! Finance](https://finance.yahoo.com/) consists of stock market data of equities, commodities, futures, etc. Once you land on this webpage, search for `PluralSight` or `PS` in the search box available on the right hand side of the webpage. This will open up the webpage dedicated to the stock market data for PS. Since the webpage provides you an upfront option to download the historical data; there is no need to scrape it. But, what about the company holders? 

Click on the **Holders** tab which will list out three sections:
1. Major Holders
2. Top Institutional Holders
3. Top Mutual Fund Holders

Each of these section consists of a tablular data. Let's scrape these tables. We use `rvest` and `xml2` libraries to get the task done.

The given code gets the task done. Go through the comments to understand how each command works:

```r
# --
# Importing the rvest library 
# It internally imports xml2 library too 
# --
library(rvest)


# --
# Load the link of Holders tab in a variable, here link
# --
link <- "https://finance.yahoo.com/quote/PS/holders?p=PS"


# --
# Read the HTML webpage using the xml2 package function read_html()
# --
driver <- read_html(link)


# --
# Since we know there is a tabular data on the webpage, we pass "table" as the CSS selector
# The variable "allTables" will hold all three tables in it
# --
allTables <- html_nodes(driver, css = "table")


# --
# Fetch any of the three tables based on their index
# 1. Major Holders
# --
majorHolders <- html_table(allTables)[[1]]
majorHolders

#       X1                                    X2
# 1   5.47%       % of Shares Held by All Insider
# 2 110.24%      % of Shares Held by Institutions
# 3 116.62%       % of Float Held by Institutions
# 4     275 Number of Institutions Holding Shares


# --
# 2. Top Institutional Holders
# --
topInstHolders <- html_table(allTables)[[2]]
topInstHolders

#                             Holder     Shares Date Reported  % Out       Value
# 1      Insight Holdings Group, Llc 18,962,692  Dec 30, 2019 17.99% 326,347,929
# 2                         FMR, LLC 10,093,850  Dec 30, 2019  9.58% 173,715,158
# 3       Vanguard Group, Inc. (The)  7,468,146  Dec 30, 2019  7.09% 128,526,792
# 4  Mackenzie Financial Corporation  4,837,441  Dec 30, 2019  4.59%  83,252,359
# 5               Crewe Advisors LLC  4,761,680  Dec 30, 2019  4.52%  81,948,512
# 6        Ensign Peak Advisors, Inc  4,461,122  Dec 30, 2019  4.23%  76,775,909
# 7         Riverbridge Partners LLC  4,021,869  Mar 30, 2020  3.82%  44,160,121
# 8          First Trust Advisors LP  3,970,327  Dec 30, 2019  3.77%  68,329,327
# 9       Fred Alger Management, LLC  3,875,827  Dec 30, 2019  3.68%  66,702,982
# 10 ArrowMark Colorado Holdings LLC  3,864,321  Dec 30, 2019  3.67%  66,504,964


# --
# 3. Top Mutual Fund Holders
# --
topMutualFundHolders <- html_table(allTables)[[3]]
topMutualFundHolders

#                                                           Holder    Shares Date Reported % Out      Value
# 1                 First Trust Dow Jones Internet Index (SM) Fund 3,964,962  Dec 30, 2019 3.76% 68,236,996
# 2                                     Alger Small Cap Focus Fund 3,527,274  Oct 30, 2019 3.35% 63,773,113
# 3  Fidelity Select Portfolios - Software & IT Services Portfolio 3,297,900  Jan 30, 2020 3.13% 63,946,281
# 4                         Vanguard Total Stock Market Index Fund 2,264,398  Dec 30, 2019 2.15% 38,970,289
# 5                                  Vanguard Small-Cap Index Fund 2,094,866  Dec 30, 2019 1.99% 36,052,643
# 6                                      Ivy Small Cap Growth Fund 1,302,887  Sep 29, 2019 1.24% 21,881,987
# 7                            Vanguard Small Cap Value Index Fund 1,278,504  Dec 30, 2019 1.21% 22,003,053
# 8                            Vanguard Extended Market Index Fund 1,186,015  Dec 30, 2019 1.13% 20,411,318
# 9       Franklin Strategic Series-Franklin Small Cap Growth Fund 1,134,200  Oct 30, 2019 1.08% 20,506,336
# 10                          Fidelity Stock Selector All Cap Fund 1,018,833  Jan 30, 2020 0.97% 19,755,171
```

## Fetching Different Nodes from a Webpage Using CSS Selector
In the above example, you didn't put any CSS or XPATH element to get the node's value. Now, let us learn this new concept with an example from [Pluralsight Machine Learning Skills](https://www.pluralsight.com/browse/machine-learning) webpage. When you visit this webpage, scroll down a bit and you will see **Top Machine Learning courses** as visible in the image below:

![Imgur](https://i.imgur.com/K23Zc4E.png)

Each course consists of the following entities:
1. Course's name
2. Author's name
3. Difficulty level
4. Duration

So let us scrape these four entity details using R. But before we jump into the code, understand what all information can be gathered from the DevTools. You can visit [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools) for a quick overview.

When you are comfortable in using DevTools, press `Ctrl+Shift+I` or right-click and select `Inspect Element`. Once the DevTools dialog box opens, you can again right-click on any of the element available in the image provided above. This will take you to a screen similar to this:

![Imgur](https://i.imgur.com/NoDGrqV.png)

In the above image, you can observe two red rectangles:
1. **The left red rectangle**: It depicts the CSS for course name
2. **The right red rectangle**: It depicts the CSS for all these four entities

Notice that you need to put selector which is visible in the L.H.S. rectangle. There is only a slight difference between the both rectangle contents. The R.H.S has spaces and no `div.` initially. So if you replace all the spaces with a period and prefix the selector with `div.`, you get the content which is present in your L.H.S and the one which is required in the code.

Now, let us code with these CSS selectors:


```r
library(rvest)

link <- "https://www.pluralsight.com/browse/machine-learning"

driver <- read_html(link)

# Course Title
titles <- html_nodes(driver, "div.course-item__title") %>% html_text()

# Removing first two titles which are added from the 
# Top Machine Learning Paths (a section just above Top Machine Learning courses)
titles <- titles[3:32]

# Course Authors
authors <- html_nodes(driver, "div.course--item__list.course-item__author") %>% html_text()

# Course Level
level <- html_nodes(driver, "div.course--item__list.course-item__level") %>% html_text()

# Course Duration
duration <- html_nodes(driver, "div.course--item__list.course-item__duration") %>% html_text()

# Creating a final DataFrame
courses <- data.frame(titles, authors, level, duration)

# First 10 rows
# titles									authors			level		duration
# 1	Understanding Machine Learning						David Chappell		Beginner	43m
# 2	Understanding Machine Learning with R					Jerry Kurata		Beginner	1h 25m
# 3	Scalable Machine Learning with the Microsoft Machine Learning Server	Shawn Hainsworth	Advanced	2h 21m
# 4	Preparing Data for Machine Learning					Janani Ravi		Beginner	3h 24m
# 5	Understanding Machine Learning with Python				Jerry Kurata		Beginner	1h 54m
# 6	Production Machine Learning Systems					Google Cloud		Advanced	3h 18m
# 7	Machine Learning: Executive Briefing					Simon Allardice		Beginner	40m
# 8	Designing a Machine Learning Model					Janani Ravi		Intermediate	3h 25m
# 9	Machine Learning for Business Professionals				Google Cloud		Beginner	5h 24m
# 10	How Machine Learning Works						Paolo Perrotta		Beginner	2h 23m
```

Before you move on to the next section, notice that initially the image depicted only six courses and a **Show more** button. However, our method scraped all of the available courses which are even present inside the **Show more** button.  











