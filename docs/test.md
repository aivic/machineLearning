## Introduction
In today's world, we have seen a lot of use cases of Excel in almost all the industries be it Financial Services, IT Services, Automobile, Manufacturing, etc. Excel deals with a large amount of data and finding insights from the data without summarising the information on a chart becomes quite hectic and therefore we require visualization tools in Excel. 

In the previous [guide](/guides/exploring-data-with-pivottables), you have learned about various aspects of PivotTables with very little emphasis on pivot charts. In this guide, we will further explore the topic and visualize data from the PivotTable using Pivot charts.

## Describing Data
We will be using a data set consisting of data related to colleges situated in various countries, their fee structure and their minimum acceptable test scores (GRE and GMAT). Given below is the original data set which holds eight columns and 10 rows:

|         Country          |                College                |     Program     |  Tuition Fee  | Accomodation Fee | Misc Charges | Min GMAT Score | Min GRE Score |
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


