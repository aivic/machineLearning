## Introduction
In today's world, we have seen a lot of use cases of Excel in almost all the industries be it Financial Services, IT Services, Automobile, Manufacturing, etc. Excel deals with a large amount of data and finding insights from the data without summarising the information on a chart becomes quite hectic and therefore we require visualization tools in Excel. 

In the previous [guide](/guides/exploring-data-with-pivottables), you have learned about various aspects of PivotTables with very little emphasis on pivot charts. In this guide, we will further explore the topic and visualize data from the PivotTable using Pivot charts.

## Describing Data
We will be using a data set consisting of data related to colleges situated in various countries, their fee structure and their minimum acceptable test scores (GRE and GMAT). Given below is the original data set which holds eight columns and 10 rows:

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

Next, to build any of the pivot charts on the given PivotTable, you first need to select those columns which you need to visualize and then in the menu bar click on `Insert` and then click on the **PivotChart** icon. This will popup a new dialogue box with the name `Insert Chart`. Now, you can select any of the given charts to plot your selected data.

## Bar Chart
If you are dealing with numerical data then bar charts are the very first visualization tool that comes to mind. There are a variety of bar charts that can help you summarise numerical data and further let you know their relative importance. To get a brief understanding of how bar charts work you can visit the bar chart [webpage](https://www.investopedia.com/terms/b/barchart.asp) on the Investopedia website. 

We will now learn how to make a variety of bar charts on the pivot table described in the above section. 
If you are in the `Insert Chart` popup dialogue box you can click on the `Bar` tab which will show you six types of bar charts. Mainly there are only three kinds of these charts namely clustered, stacked and 3D; the remaining are merely the combination of these three charts with the inclusion of a hundred percent stacked theme.

### Clustered
![Imgur](https://i.imgur.com/hFMzd0O.png)

### 100% Stacked Column
![Imgur](https://i.imgur.com/KRFTVpK.png)

### 3-D 100% Stacked Column
![Imgur](https://i.imgur.com/1ELyGX2.png)

You can use any of the above three charts or the remaining three charts to analyze the given PivotTable data. As you can observe the bar charts have made it very clear as to which program in which country has the highest and the lowest fee structure in terms of tuition, accommodation and miscellaneous charges.

You can also control the **Chart Elements** Axes, Axis Title, Chart Title, Data Labels, Data Table, Gridlines and Legend using the **`+`** sign available outside the chart.
