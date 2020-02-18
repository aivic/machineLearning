## Introduction
In today's world, we have seen a lot of use cases of Excel in almost all the industries be it Financial Services, IT Services, Automobile, Manufacturing, etc. Excel deals with a large amount of data and finding insights from the data without summarising the information on a chart becomes quite hectic and therefore a need for visualization tools is undeniable in Excel. 

In the previous [guide](/guides/exploring-data-with-pivottables), you have learned about various aspects of PivotTables with very little emphasis on pivot charts. In this series of two guides (beginner and advanced) on Pivot Charts, we will further explore the topic and visualize data from the PivotTable using Pivot charts.

In this beginner guide, you will cover the following plots:
- Bar Chart
- Line Chart
- Scatter Plot

## Describing Data
We will be using a dummy data set consisting of data related to colleges situated in various countries, their fee structure and their minimum acceptable test scores (GRE and GMAT). Given below is the original data set which holds eight columns and 10 rows:

|         Country          |                College                |     Program     |  Tuition Fee  | Accommodation Fee | Misc Charges | Min GMAT Score | Min GRE Score |
|--------------------------|---------------------------------------|-----------------|---------------|------------------|--------------|----------------|---------------|
| United States of America | California Institute of Technology    | Master's (Engg) | $80,000.00    | $20,000.00       | $5,000.00    |                |           315 |
| United States of America | Brown University                      | Master's (Engg) | $72,000.00    | $22,000.00       | $3,000.00    |                |           317 |
| United States of America | Massachusetts Institute of Technology | Master's (Engg) | $99,555.00    | $34,000.00       | $9,000.00    |                |           324 |
| United States of America | Harvard University                    | Master's (Biz)  | $10,10,000.00 | $42,000.00       | $18,000.00   |            770 |               |
| England                  | University of Cambridge               | Ph.D.           | $86,000.00    | $56,000.00       | $12,000.00   |                |           317 |
| England                  | London School of Economics            | Master's (Biz)  | $85,000.00    | $18,000.00       | $9,000.00    |            720 |               |
| England                  | London Business School                | Master's (Biz)  | $72,000.00    | $20,000.00       | $8,000.00    |            700 |               |
| India                    | Indian Institute of Technology        | Master's (Engg) | $40,000.00    | $15,000.00       | $2,000.00    |                |           321 |
| Japan                    | The University of Tokyo               | Ph.D.           | $68,000.00    | $55,000.00       | $6,000.00    |                |           314 |
| Japan                    | Kyoto University                      | Master's (Biz)  | $56,000.00    | $32,000.00       | $8,000.00    |            715 |               |

We will be building various pivot charts based on the given data set. 

>> The above data set doesn't relate to the actual figures of the mentioned colleges. Please refer to the respective college websites for original information.

## Pivot Chart Basics
To build a pivot chart, the very first thing you need to do is to construct a PivotTable. Here we have constructed a PivotTable using column names **Country** and **Program** under the `Rows` section and the sum of tuition fee, accommodation fee and miscellaneous charges under the `Values` section.

|        Row Labels        | Sum of Tuition Fee | Sum of Accommodation Fee | Sum of Misc Charges |
|--------------------------|--------------------|-------------------------|---------------------|
| **England**                  |             243000 |                   94000 |               29000 |
| Master's (Biz)           |             157000 |                   38000 |               17000 |
| Ph.D.                    |              86000 |                   56000 |               12000 |
| **India**                    |              40000 |                   15000 |                2000 |
| Master's (Engg)          |              40000 |                   15000 |                2000 |
| **Japan**                    |             124000 |                   87000 |               14000 |
| Master's (Biz)           |              56000 |                   32000 |                8000 |
| Ph.D.                    |              68000 |                   55000 |                6000 |
| **United States of America** |            1261555 |                  118000 |               35000 |
| Master's (Biz)           |            1010000 |                   42000 |               18000 |
| Master's (Engg)          |             251555 |                   76000 |               17000 |
| **Grand Total**              |            1668555 |                  314000 |               80000 |

Next, to build any of the pivot charts on the given PivotTable, you first need to select those columns which you need to visualize and then in the menu bar click on `Insert` and then click on the **PivotChart** icon. This will popup a new dialog box with the name `Insert Chart`. Now, you can select any of the given charts to plot your selected data.

## 1. Bar Chart
If you are dealing with numerical data then bar charts are the very first visualization tool that comes to mind. There are a variety of bar charts that can help you summarise numerical data and further let you know their relative importance. To get a brief understanding of how bar charts work, you can visit the bar chart [webpage](https://www.investopedia.com/terms/b/barchart.asp) on the Investopedia website. 

We will now learn how to make a variety of bar charts on the pivot table described in the above section. 
If you are in the `Insert Chart` popup dialog box you can click on the `Bar` tab which will show you six types of bar charts. Mainly there are only three kinds of these charts namely clustered, stacked and 3D; the remaining are merely the combination of these three charts with the inclusion of a hundred percent stacked theme.

### Clustered
![Imgur](https://i.imgur.com/hFMzd0O.png)

### 100% Stacked Column
![Imgur](https://i.imgur.com/KRFTVpK.png)

### 3-D 100% Stacked Column
![Imgur](https://i.imgur.com/1ELyGX2.png)

You can use any of the above three charts or the remaining three charts to analyze the given PivotTable data. As you can observe the bar charts have made it very clear as to which program in which country has the highest and the lowest fee structure in terms of tuition, accommodation and miscellaneous charges.

You can also control the **Chart Elements** Axes, Axis Title, Chart Title, Data Labels, Data Table, Gridlines and Legend using the **`+`** sign available outside the chart.

## 2. Line Chart
A line chart can be used to plot either a single or multiple numerical data columns. You can explore more about line chart and its use on the Investopedia line chart [web page](https://www.investopedia.com/terms/l/linechart.asp).

To learn how to make a line chart in excel's PivotTable, we will be using the same PivotTable as listed above and all of the three numerical data i.e., tuition fee, accommodation fee, and miscellaneous charges.

To create multiple numerical data columns line chart you need to first select the data, here the complete PivotTable and follow the similar procedure as we have done during the bar chart creation. The only change would be you need to select `line` instead of `bar` inside the `Insert chart` dialogue box. Inside the line section, you will observe seven types of line charts available. In this section, we will present you a line chart with markers as shown below:

![Imgur](https://i.imgur.com/g3MP4mj.png)

## 3. Scatter Plot
A Scatter plot can be used to show a relationship between two numerical quantities or one numerical and one non-numerical quantity. For a brief overview you can visit this [webpage](https://www.statisticshowto.datasciencecentral.com/probability-and-statistics/regression-analysis/scatter-plot-chart/) on the Statisticshowto website. 

Sadly we cannot create a scatter plot on a PivotTable directly using its data, however, there is no restriction in copying the data from a PivotTable and then using it to create a scatter plot. In this section, we will learn how to create a basic scatter plot based on one numerical quantity and one non-numerical quantity. 

First of all, we create a new pivot table using **College** column under the `Rows` section, **Min GMAT Score** column under the **Values** section and filtering out the result based on the **Program** column and further selecting only the **Master's (Biz)**. Once you are done with this process, you will have a PivotTable as shown below:

**Program	Master's (Biz)**

|         Row Labels         | Sum of Min GMAT Score |
|----------------------------|-----------------------|
| Harvard University         |                   770 |
| Kyoto University           |                   715 |
| London Business School     |                   700 |
| London School of Economics |                   720 |
| Grand Total                |                  2905 |

The follow the given steps to create a scatter plot on this PivotTable data: 
1. Copy the text and the GMAT score data of these four Universities and paste them in two new blank columns somewhere in the same sheet.

|  |  |
| --- | --- |
| Harvard University         |                   770 |
| Kyoto University           |                   715 |
| London Business School     |                   700 |
| London School of Economics |                   720 |

2. Next, click on a new empty cell and go to `Insert` tab under the menu bar, locate the `Charts` section which is available just before the `PivotChart` section. Click on the scatter plot icon. This will bring an empty scatter plot on the worksheet.

3. Moving ahead, right-click on the empty scatter plot and click on `Select Data...`. This will open up a new dialogue box as shown below:

![Imgur](https://i.imgur.com/L83rXYA.png)

4. Click on the `Add` button which opens up a new dialog box where you can input the series name and its X and Y data values. I have used `Master's (Biz)` as the series names, you can select anything you want. Now select the college names in the series X data and select the GMAT score as part of the Y data. For me, the completed dialog box looks like this:

![Imgur](https://i.imgur.com/zRzTEFu.png)

5. Now press a few times `OK` and after a bit of change to the `Chart Elements` you can have a scatter plot like this:

![Imgur](https://i.imgur.com/0k0BYWx.png)

## Conclusion
In this guide, you have learned how to take your first step in building a Pivot Chart. You have observed that there are some restrictions to build specific charts directly using PivotTable data, however, you also learned a bypass way to still visualize such data. In the next guide, we will learn some of the advanced charts like Stock, Treemap, Histogram, Box & Whisker, Combo etc. 

## More on Excel
- [Calculating Cell Values With Formulas](/guides/calculating-cell-values-formulas)
- [Working with Statistics Functions in Excel](/guides/working-statistics-function-excel)
- [Working with Finance Functions in Excel](/guides/working-finance-function-excel)
