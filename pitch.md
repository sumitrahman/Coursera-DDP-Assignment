Staff survey results for groups and directorates
========================================================
author: Sumit Rahman
date: 21 December 2015
transition: concave
font-family: 'Helvetica'


Why do we need this app?
========================================================

Where the author works (BIS) we undertake staff surveys.  Historically, results are presented to senior managers and some high level commentary is shared with the rest of our colleagues.  

I have developed this app which allows any colleague to see the results for their directorate, and compare them with the other directorates in the group, or with all directorates in BIS.  

This way results are shared directly to the whole of BIS and colleagues won't worry that senior managers are cherry-picking the most convenient results to share with everyone else.  

The data
========================================================

The data are aggregated at directorate, group and BIS level for each theme.  We have standardised these estimates to account for different compositions of junior and senior colleagues in each directorate and group, in order to enable meaningful comparisons to be made.


```
     Group   Directorate   Theme  Score
1  Group 1 Directorate 1 Theme 1 0.4005
2  Group 1 Directorate 2 Theme 1 0.8907
21 Group 1       Group 1 Theme 1 0.6833
24     BIS           BIS Theme 1 0.6057
```

<small>To make the slide clearer, we have omitted the upper and lower limits of the confidence intervals for each score.  Row 21 of our data is the result for Group 1 as a whole (Directorates 1 and 2 are part of this Group).  Row 24 shows the result for BIS as a whole.</small>

Example of plot where all groups have been selected
========================================================

![plot of chunk unnamed-chunk-2](pitch-figure/unnamed-chunk-2-1.png) 
<small>The chart updates instantly if you select a different theme.</small>

Why no microdata?
========================================================
type: prompt

These are aggregated scores.  We cannot use individual level microdata in this app because those are confidential survey responses.  If we publish too much detail and make a colleague's responses identifiable then no-one will ever agree to take part in these surveys in the future!  

To see the app, click [here](https://sumitrahman.shinyapps.io/assignment).

To see the code and (aggregated) dataset go to my Git Hub repository [here](https://github.com/sumitrahman/Coursera-DDP-Assignment).
