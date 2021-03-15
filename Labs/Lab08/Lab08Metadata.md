


> Written with [StackEdit](https://stackedit.io/).
> ## Metadata for Lab08
> #### This folder includes an R script called *Seabaugh_Lab8.R* that contains a function called *growthModel().*
> 
>* *growthModel()* takes four inputs: r (intrinsic growth rate), K (carrying capacity), generations (number of generations) and initPop (initial population)
> 
>* *growthModel()* computes the discrete-time logistic growth equation for the parameters input by the user.
>    * **Discrete-time Logistic Growth Equation** (models the abundance of a population over discrete time steps): n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
> 
>* *growthModel()* returns the abundance of the population at each time step/generation and plot of the abundance over time.
> 
>* *growthModel()* also writes the data to csv file and saves it in the working directory.
> 
> **Link to script:** [Script](https://github.com/josh-seabaugh/CompBioLabsAndHomework/blob/main/Labs/Lab08/Seabaugh_Lab8.R)
> **Example output plot:** 
> ![Example plot](/Users/joshseabaugh/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab08/ExamplePlot.png)
