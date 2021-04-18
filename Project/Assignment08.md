


# Land Use by Large Predator Species in West African Protected Sites
## Introduction

Both national parks and hunting concessions are common wildlife protected areas in western Africa and are considered refuges for enigmatic predator species, such as lions, hyenas and leopards. In order to ensure the long-term protection of such species, it is important to better understand the different capabilities of each management type (national parks or hunting concessions) in providing suitable habitats for competing predators, as well as to understand the main factors that dictate which habitats are better than others. With this in mind, I aim to use both collected data and model prediction data to better inform conservation practices for these species. My driving questions for this project are: which habitats and management-types are better suited to host multiple large predator species at once and what are the underlying factors that influence this capability?

## Summary of Data to be Analyzed
### Goals of original study:

The original study aimed to examine the anthropogenic, environmental, ecological and management-type (national parks vs. hunting concessions) effects on lion occupancy in the W-Arly-Pendjari protected complex in West Africa. Specifically, the study wanted to better understand the direct and indirect effects of human land use, livestock use, habitat, prey and competitor abundance, and management-type on the spatial use of lions, as well as if these effects differ between national park and hunting concession. The overarching goals of this study were to figure out what drives lion land use, what trade-offs exist between anthropogenic pressures and quality of habitat, and to better inform conservation practices to protect critically endangered lion populations.

### Methodology that produced the data:
* Camera traps were placed in three national parks (NPs) and eleven hunting concessions (HCs) within the W-Arly-Pendjari protected complex in West Africa during February-June of 2016-2018. These camera traps were placed in 204 discrete individual 10km x 10km sections throughout the study site and collected data across 21,430 trap-nights.
* All images from the traps were analyzed for occurrences of lions, humans, livestock and lion competitors (leopards and hyenas). Any false positives were thrown out of the data.
* Environmental data, such as average precipitation and percentage of savanna cover, was obtained from various sources (e.g. NASA, USGS databases, etc.)
* Occupancy models and structural equation modeling were used to estimate predicted occupancy probabilities of humans, livestock, lions and lion competitors (leopards and hyenas) for each section based on the counts obtained from the camera trap images, as well as environmental covariates and study design covariates. 
### Type of data in this data set:
> #### Format
> * The data is in the form of a CSV file. It contains rows for each section of the grid that had cameras, split by year of the study (e.g. if grid section F17 had cameras for 2016 and 2017, there would be a row of data for F17 in 2016 AND a row of data for F17 in 2017). 
> * Each row contains columns for such data as: grid identifier, year, site (name of national park (NP) or hunting concession (HC)), management type (either NP or HC), camera type, # of trap nights, average precipitation for the study period, percentage of the grid section that is savanna habitat, km of river that runs through the grid section, km of roads that runs through the grid section, log transformed number of prey per 100 trap nights, predicted probability of human occupancy, predicted probability of lion occupancy, predicted probability of livestock occupancy, predicted probability of competitor (hyena and leopard) occupancy, and a few other columns.
> #### Size
> * 32 KB of data
>  * 204 rows
>  * 21 columns
> #### Inconsistencies/Problems
> * The data is very consistent - a visual inspection shows no gaps in the data whatsoever.
> * The data seems to be ordered by year date, which means I may have to re-order the data by grid/site identifier to make my analysis easier.
> * I don't plan to use every data column, so I may remove some data to make it easier and cleaner to work with.
> #### What the data represents about the biology
> * This data represents many things about the biology. Most notably, it represents predicted probabilities of lion occupancy, human occupancy, livestock occupancy and competitor occupancy for 100 square-km sections of both national parks and hunting concessions in West Africa. It also represents prey availability, average precipitation and general habitat information for the same land sections.
## Detailed Description of Analysis to be Done and Challenges Involved
The goal of my project is to analyze which regions, sites and management types are most likely to be inhabited by more than one of the large predatory species (lions, leopards and hyenas) at one time, something that the original study did not do. The original study mainly focused on the variables which impacted lion space use, but never explicitly examined which sites were most likely to inhabit multiple large predatory species at a given time, or which variables (environmental, ecological, anthropogenic) were most likely to influence the overall space use of all large predator species. In addition to analyzing which spaces multiple predator species are likely to occupy, I want to see what these sites have in common that may lead to all these competitors sharing the space. For example, do the sites that are likely to have several large predator species have more abundant prey availability, more suitable habitat, or a specific management type when compared to the others? 

Since the original dataset contains predicted probabilities of lion occupancy and predicted probabilities of competitor occupancy (i.e. leopards and hyenas), I should be able to combine these probabilities into a predicted probability of a site having multiple large predator species occupancy (occupancy of both lions AND another predator species). Then, I want to create plots showing which specific national parks and hunting concessions in the study area are most likely to have more than one predator species at a given time, as well as which management type (national park or hunting conservancy) appears to be more suitable to host two of these predator species at once. Finally, if possible, I would like to elucidate which variables (anthropogenic, environmental, ecological) influence the simultaneous site selection of these predators, perhaps by using logistic regression. Identifying habitats and management types capable of being a refuge to multiple competing large predatory species may help to inform conservation practices so that more species can be protected in a single space. 

Some of the main challenges involved in this project will be to: combine the individual occupancy probabilities into a single occupancy probability for multiple predator species, evaluate the data at two different spatial scales (smaller scale, i.e. each specific national park and hunting concession area, and larger scale, i.e. overall national parks vs. hunting concessions), and identify predictor variables (I'm not completely sure that logistic regression will work for this data and implementing a logistic regression in R may be a challenge to figure out).  

## References
**Paper:**
Mills KL, Harissou Y, Gnoumou IT, Abdel-Nasser YI, Doamba B, Harris NC. Comparable space use by lions between hunting concessions and national  parks in West Africa. J Appl Ecol. 2020;57:975–984. [https://doi.org/10.1111/1365-2664.13601](https://doi.org/10.1111/1365-2664.13601)

**Data:**
Mills, Kirby et al. (2020), Comparable space use by lions between hunting concessions and national parks in West Africa, Dryad, Dataset. https://doi.org/10.5061/dryad.r4xgxd28g
