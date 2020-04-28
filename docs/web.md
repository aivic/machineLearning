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
