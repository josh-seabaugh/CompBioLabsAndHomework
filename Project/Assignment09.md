





# Land Use by Large Predator Species in West African Protected Sites
### Biological Question

Which common wildlife management type, national parks or hunting concessions, is more likely to host multiple large predator species at once and what are the most important factors that influence predator occupancy?

### Context (Introduction)
Both national parks and hunting concessions are common wildlife protected areas in western Africa and are considered refuges for enigmatic predator species, such as lions, hyenas and leopards. In order to ensure the long-term protection of such species, it is important to better understand the different capabilities of each management type (national parks or hunting concessions) in providing suitable habitats for competing predators, as well as to understand the main factors that dictate which habitats are better than others. With this in mind, I aim to use both collected data and model prediction data to better inform conservation practices for these species. 

### Methods
#### Source of the data:

The original source of the data is from the [Mills et al. (2020)](https://doi.org/10.1111/1365-2664.13601) study and the data itself was taken from the Dryad Digital Repository ([Occupancy Dataset](https://doi.org/10.5061/dryad.r4xgxd28g)). This dataset contains information on lion, human, livestock and lion competitor occupancy estimates, as well as environmental information for several sites in the W-Arly-Pendjari protected complex in West Africa. This complex contains several different hunting concessions and national parks, and was surveyed from 2016-2018 in order to better understand the distribution of lions throughout the complex, the likelihood of lions occupying specific sites within the complex, and the environmental, ecological and anthropogenic factors that influence lion occupancy in the region.

This data was produced by camera traps that were placed in three national parks (NPs) and eleven hunting concessions (HCs) within the W-Arly-Pendjari protected complex in West Africa during February-June of 2016-2018. The camera traps were placed in 204 discrete individual 10km x 10km sections throughout the study site and collected data across 21,430 trap-nights.
All images from the traps were analyzed for occurrences of lions, prey animals, humans, livestock and lion competitors (leopards and hyenas). Any false positives were thrown out of the data. Environmental data, such as average precipitation and percentage of savanna cover, was obtained from various sources (e.g. NASA, USGS databases, etc.)

To create the final dataset, occupancy models were used to estimate predicted occupancy probabilities of humans, livestock, lions and lion competitors (leopards and hyenas) for each section based on the counts obtained from the camera trap images, as well as environmental covariates, study design covariates and prey availability. 

The dataset is in the form of a CSV file. It contains 32 KB of data, 204 rows and 21 columns. Each row represents a section of the grid that had cameras, split by year of the study (e.g. if grid section F17 had cameras for 2016 and 2017, there would be a row of data for F17 in 2016 AND a row of data for F17 in 2017).  Each row contains columns for environmental data, site data, prey availability and occupancy data. The dataset is very consistent, with no gaps or missing values.

#### What the original authors did with the data:

The original study aimed to examine the anthropogenic, environmental, ecological and management-type (national parks vs. hunting concessions) effects on lion occupancy in the W-Arly-Pendjari complex. After running the occupancy models, the original authors produced plots showing the estimated lion occupancy for each site in the complex, as well as a map showing the predicted lion occupancy for each grid used for camera trapping. With these results, they were able to compare how lions were using national park spaces differently from hunting concessions in the same region. Then, the authors used structural equation modeling to examine the effects of all the different variables (environmental, anthropogenic, ecological, etc.) on the probability of lion occupancy, along with associated significance values. 

#### What I did with the data:

Using the dataset, the first thing I did was create another column for the data that combined the lion and lion predator occupancy estimates into a single "Predator Occupancy" estimate, which represented the likelihood of multiple predator species occupying the same are. This was done by assuming probabilistic independence and multiplying the two probabilities together for each site.

For the next step, I wanted to create a plot showing multiple predator occupancy across different sites and a plot comparing multiple predator occupancy for national parks and hunting concessions, similar to what the original authors did for lion occupancy. To do this, I first collapsed the data set into a smaller data set that contained multiple predator occupancy on a grid by grid basis, keeping the site identifier column and the multiple predator occupancy column. However, for this smaller data set, if a grid contained data for multiple years then the multiple predator occupancy values were averaged across the years, so that each grid contains a single averaged value for multiple predator occupancy. Then, I added another column that specified if each grid existed within a national park or a hunting concession. Using this condensed data set and ggplot (from ggplot2 library), I created a box plot showing the multiple predator occupancy across all 14 sites and another box plot comparing multiple predator occupancy between the two different management types.

Next, I simply used the ggplot histogram and scatter plot functions to explore the data - specifically how multiple predator occupancy changed with the different ecological and environmental variables in the original dataset. Following this, I used the glm function to perform linear regressions on these different variables to test their effects on multiple predator occupancy. I also performed several linear regression on different variable to test their effects on prey availability, since prey availability is such an important driver of predator occupancy in general. However, this was also done in the original study, so is not of much interest to my current study.

Finally, I performed a linear regression on the effects of both management type and prey availability on multiple predator occupancy. Then, I used the predict function to predict how multiple predator occupancy would be affected by both prey availability and management type. The results of this analysis were then plotted using ggplot. 

### Results and Conclusions

The results of the plot showing multiple predator occupancy across different sites revealed some considerable differences to the similar plot made by the original authors for just lion occupancy. This was to be expected since I was combining two different data categories (lions and lion competitors). This plot was a good visualization as to how predicted predator occupancy was distributed throughout the complex and is shown below.
****Plot of Multiple Predator Occupancy Across Sites:****

![Site Occupancy Plot](https://github.com/josh-seabaugh/CompBioLabsAndHomework/blob/main/Project/Site_Occupancy_Plot.png)

The results of the management type occupancy plot showed that the likelihood of multiple predator occupancy was considerable different between management types, with hunting concessions having close to twice the mean likelihood than national parks (figure shown below). 
****Plot of Multiple Predator Occupancy Across Management Types:****

![Site Occupancy Plot](https://github.com/josh-seabaugh/CompBioLabsAndHomework/blob/main/Project/Management_Type_Occupancy_Plot.png)

Several factors positively and significantly affected the likelihood of an area being inhabited by multiple large predator species, including average precipitation of a site (p < 0.05), river area of a site (p < 0.001), road area of a site (p < 0.001) and prey availability in a site (specifically, the log transform of the number of prey per 100 trap nights, p = 0). Of these, prey availability had the largest effect. Both human occupancy and livestock occupancy showed no significant effects on multiple predator occupancy, despite livestock occupancy having a significant and positive effect on lion competitors in the original study. Of all the factors, only percentage of savanna coverage showed a significant and negative effect (p < 0.01) on multiple predator occupancy.

Also, hunting concessions were shown to be significantly more likely to host multiple predator species than national parks (p < 0.01), which supports the previous figure. Finally, using the linear regression with both management type and prey availability on multiple predator occupancy and the predictor function, the resulting plot (figure shown below) indicates that multiple predator occupancy likelihood drastically increases with increased prey availability. In addition, the plot shows that hunting concessions will typically be more likely than national parks to host multiple large predators.

****Plot of how Multiple Predator Occupancy Changes with Prey Availability and Management Type:****

![Site Occupancy Plot](https://github.com/josh-seabaugh/CompBioLabsAndHomework/blob/main/Project/Predator_Occupancy_ManagementType_PreyAvailability_Plot.png)

These results suggest that not only are hunting concessions favorable management types when it comes to hosting multiple predator species, but habitats that have higher average precipitation, more river and road access, less savanna coverage and more prey are more likely to contain at least two of the three predator species in this study (lions, leopards and hyenas). Most importantly, however, sites that contain abundant prey are far more likely to also contain multiple predator species and hunting concessions are predicted to do a little better than national parks in this regard.



## References
**Original Study:**
Mills KL, Harissou Y, Gnoumou IT, Abdel-Nasser YI, Doamba B, Harris NC. Comparable space use by lions between hunting concessions and national  parks in West Africa. J Appl Ecol. 2020;57:975–984. [https://doi.org/10.1111/1365-2664.13601](https://doi.org/10.1111/1365-2664.13601)

**Original Data:**
Mills, Kirby et al. (2020), Comparable space use by lions between hunting concessions and national parks in West Africa, Dryad, Dataset. https://doi.org/10.5061/dryad.r4xgxd28g
