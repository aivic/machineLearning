## Introduction
In our previous [guide](), we learned basic charts which can be drawn using the PivotTable data. In this guide, we will continue where we left and learn to build the following charts:
1. Histogram
2. Box and Whisker
3. Treemap
4. Combo

## 1. Histogram
As per [Investopedia](https://www.investopedia.com/terms/h/histogram.asp) website, a histogram is defined as:

>> A graphical representation that organizes a group of data points into user-specified ranges. It is similar in appearance to a bar graph. The histogram condenses a data series into an easily interpreted visual by taking many data points and grouping them into logical ranges or bins.

You can control the number of bins that can be represented on a histogram. When you pass data directly to any statistical software (Excel, R, MATLAB, etc.), they create a defined number of bins based on how the data is distributed. However, we can always control the final output. Let us learn with an example.

Create a PivotTable with **Program** under the `Rows` section and **Misc Charges** under the `Values` section. This will result in the following PivotTable:


|   Row Labels    | Sum of Misc Charges |
|-----------------|---------------------|
| Master's (Biz)  |               43000 |
| Master's (Engg) |               19000 |
| Ph.D.           |                6000 |
| Ph.D.           |               12000 |
| Grand Total     |               80000 |

If you try to build a histogram on the numerical column, Excel will show the following message:

>> You can't create this chart type with data inside a PivotTable. Please select a different chart type, or copy the data outside the PivotTable.

Therefore, we copy the values 43000, 19000, 6000 and 12000 in a separate column and select them. Once selected, click on `Insert Statistics Chart` icon under `Charts` section and select the histogram icon as shown below:

![Imgur](https://i.imgur.com/ziuc26g.png)

Right after you click on the Histogram icon, you will receive the following chart (the chart title has been renamed to **Misc Charges**):

![Imgur](https://i.imgur.com/ho8hugD.png)

You may observe that Excel has automatically created two bins with ranges `[6000, 42000]` and `[42000, 78000]`. Here the first bin has a bar which has a value three meaning that there are three items in this range. The next bin has a value one which means that it consists of only one value in its range.

To modify the range of bins, click on `Chart Elements > Axes > More Axis Options...` as shown below:

![Imgur](https://i.imgur.com/C04l07C.png)

This opens up the `Format Axis` sidebar. To change the bin size, you can either go with the `Number of bins`, or `Bin width`. Here, we choose 6000 as the parameter for `Bin width`.

![Imgur](https://i.imgur.com/0YKcuTx.png)

Once you enter the value, press `Enter` and the changes will reflect in the chart as shown below:

![Imgur](https://i.imgur.com/wXYE0Vh.png)

As you can observe, this time there are only two values which lie in the range of `[6000, 12000]`. Moving ahead, in our current case we have only four values and three bars which makes it easy to analyze the skewness (to be discussed thoroughly in the next section) in the data. However, when we have hundreds of bars in a histogram it is recommended to draw a `Pareto Line` over the bars which can provide a general idea about how data is distributed. To draw a histogram with a Pareto Line, choose the following icon:

![Imgur](https://i.imgur.com/HDJ6pya.png)


## 2. Box and Whisker
