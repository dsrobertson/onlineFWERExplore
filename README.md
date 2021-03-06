# onlineFWER Explore

## Introduction
Welcome to the onlineFWER Explore Shiny app. This repository contains an application that is an interface to the onlineFDR package hosted on Bioconductor. It is designed to assist researchers in controlling the Family-wise Error Rate in an online manner. The app provides a family of algorithms that users can use, a tool to help decide which one to use, and several features including plotting the adjusted significance thresholds against a Bonferroni correction as well as the compare tool to compare 2 algorithms against each other. Users are also able to download the results. The [onlineFWER Explore](https://mrc-bsu.shinyapps.io/onlineFWERExplore/) app is meant for post-hoc use. 

## FDR vs. FWER
FDR is the expected proportion of false rejections out of all rejections. FWER is the probability of making any Type I errors at all. Controlling the FWER is generally more conservative than controlling the FDR. Note that in the case when all null hypotheses are true, the FDR and FWER are the same. For the FDR Explore app, click [here](https://mrc-bsu.shinyapps.io/onlineFDRExplore). 

## How to Use
![](https://github.com/latlio/onlineFWERexplore/blob/master/www/user-diagram.png)

## Background behind algorithms
For more information, please visit our [vignette](https://dsrobertson.github.io/onlineFDR/articles/onlineFDR.html)!
