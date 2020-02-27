## Introduction
In our previous [guide](), we learned basic charts which can be drawn using the PivotTable data. In this guide, we will continue where we left and learn to build the following charts:
1. Histogram
2. Box and Whisker
3. Treemap
4. Combo

## 1. Histogram
According to [Investopedia](https://www.investopedia.com/terms/h/histogram.asp):

>> A histogram is a graphical representation that organizes a group of data points into user-specified ranges. It is similar in appearance to a bar graph. The histogram condenses a data series into an easily interpreted visual by taking many data points and grouping them into logical ranges or bins.

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
As per the [Seaborn](https://seaborn.pydata.org/generated/seaborn.boxplot.html) documentation:

>> A box plot (or box-and-whisker plot) shows the distribution of quantitative data in a way that facilitates comparisons between variables or across levels of a categorical variable. The box shows the quartiles of the dataset while the whiskers extend to show the rest of the distribution, except for points that are determined to be “outliers” using a method that is a function of the inter-quartile range.

Before we proceed with the creation of a Box plot from the College data, let us understand how can we interpret its result. Here is box plot's layout taken from [Michael Galarnyk's article on Understanding Boxplots](https://towardsdatascience.com/understanding-boxplots-5e2df7bcbd51):

![Imgur](https://i.imgur.com/Tii8mc8.png)

From the above figure, we can interpret a lot of charateristics about the data as listed below:
1. Outliers (minimum and maximum)
2. Minimum (Q1 - 1.5\*IQR)
3. Maximum (Q1 + 1.5\*IQR)
4. First Quartile, Q1
5. Second Quartile, also Median
6. Third Quartile, Q3

Note - An Inter-Quartile Range (IQR) is the difference between Q1 and Q3.

We can also understand the data distribution by visualizing how a box plot is formed. It is said to be:
1. **Symmetric**: If the length of the box (or whiskers) when seen from the median is (almost) equal at both ends.
2. **Skew-Symmetric**: If the length of the box (or whiskers) when seen from the median is unequal at both ends.

To clear this concept numerically, consider the following dummy data and its box plot:


```
20
40
60
150
-220
-800
-1200
900
-2500
3000
```

![Imgur](https://i.imgur.com/nX7eJEZ.png)

Here, the box plot reveals its data only on Y-axis which makes X-axis of no use to us. 

**Takeaways from the above plot:**
- It has one positive outlier (3000) shown as the point.
- The median lies almost at zero.
- The data is skewed towards negative.

Since now we have a working knowledge of boxplot, let us quickly create box plot of Misc charges values which are copied in a different column than the PivotTable table.

![Imgur](https://i.imgur.com/JFlb4PB.png)

**The key takeaways from the above plot are:**
- The data is skewed towards higher positive numbers.
- The median lies around 15000.
- There are no outliers in the data.

### Working with Multiple Box Plots
So far in the guide, you have built charts where there is only one numerical column (Misc Charges). Now, we will consider a case where we will have two numerical columns (Misc Charges and Tuition Fee) in our PivotTable as shown:

|   Row Labels    | Sum of Misc Charges | Sum of Tuition Fee |
|-----------------|---------------------|--------------------|
| Master's (Biz)  |               43000 |            1223000 |
| Master's (Engg) |               19000 |             291555 |
| Ph.D.           |                6000 |              68000 |
| Ph.D.           |               12000 |              86000 |
| Grand Total     |               80000 |            1668555 |

When you copy the values of these two columns (Sum of Misc Charges and Sum of Tuition Fee) in separate columns, and create a box plot on them, you may receive a plot like this:

![Imgur](https://i.imgur.com/cMlW5r9.png)

**Can you observe the problem in the above plot?**
Since the range of Misc Charges is way lesser than Tuition Fee, therefore we cannot observe the actual Misc Charges boxplot. To overcome such problem, we can go for Min-Max Normalization.

A **Min-Max Normalization** always brings the result in a defined range [0, 1]. So if you normalize both of these columns and then create their box plot, you will have both of these box plots in the range of [0, 1]. 

Mathematically,

`X_i = (X_i - X_min)/(X_max - X_min)`

If you have a dummy data with values `5, 2, 8, 6, 12`, then the normalized value of 5 is calculated as `(5-2)/(12-2) = 0.3`.

The normalized values of the Misc Charges and Tuition Fee along with the final box plot is shown below:

|          Normalized Misc Charges           |             Normalized Tuition Fee              |
|--------------------------------------------|-------------------------------------------------|
| (43000 - 6000) / (43000 - 6000) = 1        | (1223000 - 68000) / (1223000 - 68000) = 1       |
| (19000 - 6000) / (43000 - 6000) = 0.351351 | (291555 - 68000) / (1223000 - 68000) = 0.193554 |
| (6000 - 6000/ (43000 - 6000) = 0           | (68000 - 68000/ (1223000 - 68000) = 0           |
| (12000 - 6000/ (43000 - 6000) = 0.162162   | (86000 - 68000/ (1223000 - 68000) = 0.015584    |

![Imgur](https://i.imgur.com/5zf6782.png)

As we can observe, normalization has made it easy to understand the data distribution in each of the numerical column. 

Note - A grouped box plot can alter the actual data distribution a bit. It is suggested to use grouped box plot only for a general overview.
