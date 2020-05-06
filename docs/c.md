## Introduction
You finished watching a Sci-Fi movie in which the protogonist develops a humanoid robot that hold a conversation with people and even express its feelings just like humans do. You got excited and now want to build your own. But wait! Did I tell you that intelligence is built on information? From where can you attain this information?

From many ways out there, web scraping provides one of the path to get such information. To get you started - let us learn different angles of fetching data from the web using R. 

## Fetching Data from a Single Table or Multiple Tables Available on a HTML Webpage
[Yahoo! Finance](https://finance.yahoo.com/) consists of stock market data of equities, commodities, futures, etc. Once you land on this webpage, search for `Pluralsight` or `PS` in the search box available on the right hand side of the webpage. This will open up the webpage dedicated to the stock market data for PS. Since the webpage provides you an upfront option to download the historical data; there is no need to scrape it. But, what about the company holders? 

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
You can learn about fetching data using CSS selector from my [blog](https://github.com/chhayawagmi/blogs/blob/master/R-CSS-Selector.md) available at GitHub.

## Automatic Navigation to Multiple Pages and Fetching Entities 
The above section helps us in understanding how we can get entities if we have only one webpage devoted to Skills. But Pluralsight has a lot more Skills than just Machine Learning. Look in the image below for major skills taken from this [URL](https://www.pluralsight.com/browse):

![Imgur](https://i.imgur.com/JqCL45O.png)

You can observe there are a total of 10 major skills and each has a distinct URL. Ignore the **Browse all courses** section as it redirects back to the same webpage.

Our objective is to provide only one URL to the R program, here *https://www.pluralsight.com/browse* and let the program automatically navigate to each of those 10 skill webpages and extract all course details as shown:


```r
library(rvest)
library(stringr) # For data cleaning

link <- "https://www.pluralsight.com/browse"

driver <- read_html(link)

# Extracting sub URLs
# Here, tile-box is a parent class which holds the content in the nested class.
# We first go inside the sub-class using html_children() and then fetch the URLs to each Skill page
subURLs <- html_nodes(driver,'div.tile-box') %>% 
            html_children() %>% 
            html_attr('href')

# Removing NA values and last `/browse` URL
subURLs <- subURLs[!is.na(subURLs)][1:10]

# Main URL - to complete the above URLs
mainURL <- "https://www.pluralsight.com"

# This function fetch the those four entities as we have learned in the previous section of this guide
entity <- function(s){
  
  # Course Title
  # Since Number of Courses may differ from Skill to Skill, therefore,
  # we have done dynamic fetching of the course names
  
  v <- html_nodes(s, "div.course-item__info") %>%
    html_children() 
  
  titles <- gsub("<|>", "", str_extract(v[!is.na(str_match(v, "course-item__title"))], ">.*<"))
  
  # Course Authors
  authors <- html_nodes(s, "div.course--item__list.course-item__author") %>% html_text()
  
  # Course Level
  level <- html_nodes(s, "div.course--item__list.course-item__level") %>% html_text()
  
  # Course Duration
  duration <- html_nodes(s, "div.course--item__list.course-item__duration") %>% html_text()
  
  # Creating a final DataFrame
  courses <- data.frame(titles, authors, level, duration)
  
  return(courses)
}


# A for loop which goes through all the URLs, fetch the entities and display them on the screen 
i = 1
for (i in 1:10) {
  subDriver <- read_html(paste(mainURL, subURLs[i], sep = ""))
  print(entity(subDriver))
}
```

In the above code, understand the significane of `html_children()` and `html_attr()`. The code has elaborated comments to brief what each command is doing. The output of the above code will be similar to the previous section output and available for each skill.

## Controlling Browser from R and Scraping Data 
Consider you want to scrape the latest Google News about Pluralsight. Manually, you would open *www.google.com* and search for the keyword *Pluralsight* and later click on *News* section. This would deliver you a page like this:

![Imgur](https://i.imgur.com/I5T3hWl.png)

What if I tell you all these steps can be automated and you can fetch the latest news just by a small R sript! 

**Note** - Before proceeding with R code, make sure you follow the given steps to establish Docker in your system.
1. Download and install [Docker](https://download.docker.com/win/stable/DockerToolbox.exe)
2. Open Docker Terminal and run `docker pull selenium/standalone-chrome`, replace `chrome` with `firefox` if you're a Firefox user
3. Then `docker run -d -p 4445:4444 selenium/standalone-chrome` 
4. If above two codes are successful, run `docker-machine ip` and note the IP address to be used in the R code

Given below is an elaborated code using **RSelenium** library:


```r
library(RSelenium)

# Initiate the connection, remember remoteServerAddr needs to be replaced with the IP address you have 
# received from the Docker Terminal
driver <- remoteDriver(browserName = "chrome", remoteServerAddr = "192.168.99.100", port = 4445L)
driver$open()


# Provide the URL and let the driver load it for you
driver$navigate("https://www.google.com/")


# The search textarea of the Google falls under the name=q. Call this element.
init <- driver$findElement(using = 'name', "q")

# Enter the search keyword and hit Enter key
init$sendKeysToElement(list("Pluralsight", key = "enter"))


# Now, we have landed on the page with Pluralsight "All" results. Select the XPATH of the News tab and click it.
News_tab <- driver$findElement(using = 'xpath', "//*[@id=\"hdtb-msb-vis\"]/div[2]/a")
News_tab$clickElement()


# We are now on the News results. Select the CSS selector for all the news (here, a.l)
# Don't ignore that we have to use findElements (with s) not findElement. The latter gives only one result.
res <- driver$findElements(using = 'css selector', 'a.l')

# List out the latest headlines
headlines <- unlist(lapply(res, function(x){x$getElementText()}))
headlines

# [1] "Pluralsight has free courses to help you learn Microsoft Azure ..."
# [2] "Pluralsight offers free access to full portfolio of skill ..."     
# [3] "Will Pluralsight Continue to Surge Higher?"                        
# [4] "The CEO of Pluralsight explains why the online tech skills ..."    
# [5] "Pluralsight Is Free For the Month of April"                        
# [6] "This Pluralsight deal lets you learn some new skills from home ..."
# [7] "Pluralsight One Commits Over $1 Million to Strategic Nonprofit ..."
# [8] "Pluralsight Announces First Quarter 2020 Results"                  
# [9] "Pluralsight Announces Date for its First Quarter 2020 Earnings ..."
# [10] "Learn Adobe Photoshop, Microsoft Excel, Python for free with ..."
```

## Conclusion
You have learned how to fetch data directly from table(s), with CSS selector, automatically navigating to multiple pages to retrieve information and finally controlling web-browser from a script and fetching data using the **RSelenium** library.
