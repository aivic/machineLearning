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
