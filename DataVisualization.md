---
title: "Data Visualization"
author: "Maria Leticia"
date: "2023-02-27"
output:
  html_document:
    keep_md: yes
  word_document: default
---

## Ex.1

### a. What is a geom? 
A 'geom' (geometric object) is used within ggplot to create layers. For example, you can use geom to create scatter plot, box plots, and line diagrams.

### b. What is a facet? 
A facet partitions a plot into a matrix of panels. Faceting separate the data up into subsets, according to a categorical variable, then generates separate plots for each subset.

### c. Explain the concept of layering. 
The 'ggplot' works in layers. A layer is a combination of data, stat and/or geom. Layering is the act of adding layers in a graph.  The '+' is used to add layers and it is placed at the end of each line containing a layer.

### d. Where do you add x and y variables and map different shapes, colors, and other attributes to the data? 
We use aesthetic mapping (aes) to add x and y variables and map different shapes, colors, and other attributes to the data.

### e. Explain what ‘jittering’ does and why it’s important.
The 'jitter' option is a tool to help better visualize the data. By 'jittering' we add random variation to the observations before generating the scatter plot. It is a useful way of handling overplotting, resulting in a better visual sense of how many observations have each pair of x and y values. 

## Ex.2

```r
library (ggplot2)

mycotoxin <- read.csv ("MycotoxinData.csv", na.string = "NA")

str (mycotoxin)
```

```
## 'data.frame':	375 obs. of  6 variables:
##  $ Treatment     : chr  "Fg" "Fg" "Fg" "Fg" ...
##  $ Cultivar      : chr  "Wheaton" "Wheaton" "Wheaton" "Wheaton" ...
##  $ BioRep        : int  2 2 2 2 2 2 2 2 2 3 ...
##  $ MassperSeed_mg: chr  "10.29130435" "12.80322581" "2.846666667" "6.5" ...
##  $ DON           : chr  "107.3" "32.6" "416" "211.9" ...
##  $ X15ADON       : chr  "3" "0.85" "3.5" "3.1" ...
```

```r
mycotoxin$DON1 <- as.numeric(mycotoxin$DON)
```

```
## Warning: NAs introduced by coercion
```

```r
str (mycotoxin)
```

```
## 'data.frame':	375 obs. of  7 variables:
##  $ Treatment     : chr  "Fg" "Fg" "Fg" "Fg" ...
##  $ Cultivar      : chr  "Wheaton" "Wheaton" "Wheaton" "Wheaton" ...
##  $ BioRep        : int  2 2 2 2 2 2 2 2 2 3 ...
##  $ MassperSeed_mg: chr  "10.29130435" "12.80322581" "2.846666667" "6.5" ...
##  $ DON           : chr  "107.3" "32.6" "416" "211.9" ...
##  $ X15ADON       : chr  "3" "0.85" "3.5" "3.1" ...
##  $ DON1          : num  107.3 32.6 416 211.9 124 ...
```

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, color= Cultivar)) +
  geom_boxplot () +
  xlab ("") +
  ylab ("DON (ppm)")
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_boxplot()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

## Ex.3

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, fill=Cultivar)) +
stat_summary (fun = mean, geom = "bar", position = "dodge") +
stat_summary (fun.data = mean_se, geom = "errorbar", position = position_dodge(width=0.9), width = 0.5) +
xlab ("") +
ylab ("DON (ppm)")
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
## Removed 8 rows containing non-finite values (`stat_summary()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

## Ex.4

```r
ggplot(mycotoxin, aes(x=Treatment, y=DON1, fill=Cultivar)) +
  geom_boxplot() +
  geom_point(shape=21, color= "black", position=position_jitterdodge(dodge.width=0.9)) +
  xlab (" ") +
  ylab ("DON (ppm)")
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_boxplot()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, fill=Cultivar)) +
  stat_summary (fun = mean, geom = "bar", position = "dodge") +
  stat_summary (fun.data = mean_se, geom = "errorbar", position = position_dodge(width=0.9), width = 0.5) +
  geom_point(shape=21, color= "black", position=position_jitterdodge(dodge.width=0.9)) +
   xlab ("") +
  ylab ("DON (ppm)")
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-3-2.png)<!-- -->


## Ex.5

```r
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", 
"#D55E00", "#CC79A7")


ggplot(mycotoxin, aes(x=Treatment, y=DON1, fill=Cultivar)) +
  geom_boxplot() +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9)) +
  xlab (" ") +
  ylab ("DON (ppm)")
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_boxplot()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, fill=Cultivar)) +
  stat_summary (fun = mean, geom = "bar", position = "dodge") +
  stat_summary (fun.data = mean_se, geom = "errorbar", position = position_dodge(width=0.9), width = 0.5) +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9)) +
  xlab ("") +
  ylab ("DON (ppm)")
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

## Ex.6

```r
ggplot(mycotoxin, aes(x=Treatment, y=DON1, fill=Cultivar)) +
  geom_boxplot() +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9)) +
  xlab (" ") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar)
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_boxplot()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, fill=Cultivar)) +
  stat_summary (fun = mean, geom = "bar", position = "dodge") +
  stat_summary (fun.data = mean_se, geom = "errorbar", position = position_dodge(width=0.9), width = 0.5) +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9)) +
  xlab ("") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar)
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-5-2.png)<!-- -->

## Ex. 7

```r
ggplot(mycotoxin, aes(x=Treatment, y=DON1, fill=Cultivar)) +
  geom_boxplot() +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9)) +
  xlab (" ") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar) +
  theme_bw()
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_boxplot()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, fill=Cultivar)) +
  stat_summary (fun = mean, geom = "bar", position = "dodge") +
  stat_summary (fun.data = mean_se, geom = "errorbar", position = position_dodge(width=0.9), width = 0.5) +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9)) +
  xlab ("") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar) +
  theme_bw()
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-6-2.png)<!-- -->

## Ex. 8

```r
ggplot(mycotoxin, aes(x=Treatment, y=DON1, fill=Cultivar)) +
  geom_boxplot() +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9), alpha = 0.3) +
  xlab (" ") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar) +
  theme_bw()
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_boxplot()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, fill=Cultivar)) +
  stat_summary (fun = mean, geom = "bar", position = "dodge") +
  stat_summary (fun.data = mean_se, geom = "errorbar", position = position_dodge(width=0.9), width = 0.5) +
  scale_fill_manual(values=c("#CC79A7", "#56B4E9")) +
  geom_point(shape=21, color= "#000000", position=position_jitterdodge(dodge.width=0.9), alpha =0.3) +
  xlab ("") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar) +
  theme_bw()
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-7-2.png)<!-- -->

## Ex. 9
The boxplot and the barchart are showing that the inoculation of Fg with the fungal endophytes (37, 40, and 70) resulted in a lower level of Deoxynivalenol mycotoxin in the wheat grains for both cultivars tested compared to the Fg alone. However, cultivar Wheaton showed better response in the reduction of mycotoxin when inoculated with Fg + fungal endophytes than cultivar Ambassador. Therefore, we can conclude that inoculation with fungal endophytes are efficient to protect the wheat plants againt *Fusarium graminearum*, reducing the mycotoxin DON in the grains.
For me, the barchat is better to represent this data because it gives a better visualization of the whole data and it shows better the relationship between the treatments (inoculations) and the mycotoxin content (DON).

## Ex. 10

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, group=Cultivar, color=Cultivar)) +
  stat_summary (fun = mean, geom = "line") +
  stat_summary (fun.data = mean_se, geom = "errorbar", width = 0.5) +
  xlab ("") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar) +
  theme_bw()
```

```
## Warning: Removed 8 rows containing non-finite values (`stat_summary()`).
## Removed 8 rows containing non-finite values (`stat_summary()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

```r
ggplot(mycotoxin, aes (x= Treatment, y= DON1, group = Cultivar, color=Cultivar)) +
  geom_jitter()+
  xlab ("") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar) +
  theme_bw()
```

```
## Warning: Removed 8 rows containing missing values (`geom_point()`).
```

![](DataVisualization_files/figure-html/unnamed-chunk-8-2.png)<!-- -->


I would choose the first one (the lines connecting the mean) because it is better to visualize the data than the second one (Jitter points) and to show the relationship between the treatment and DON. The Jitter points make the visualization of the points easier but at the same time is a lot of information which is hard to understand what is happening to the data.
