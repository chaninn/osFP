# osFP
osFP web server

## Prerequisites

Before beginning, please make sure to install the following R packages: *shiny*, *shinyjs* and *shinythemes*, which can be performed by typing the following commands into an R environment:

```
install.packages(c('shiny','shinyjs','shinythemes'))
```

## Launching the application
To launch the application on your own computer, in an R environment, type the following:

```
shiny::runGitHub('osfp','chaninn')
```
In a few moments, the application should launch from your web browser.

## Using the application
To use the application:

1. Before starting, please wait until you see the following message in the **Status/Output** text box:
```
[1] "Server is ready for prediction. Please insert/upload sequence in FASTA format"
```
2. Paste your sequences in FASTA format into the text box *or* Upload your input FASTA files
3. The prediction results will appear in the **Status/Output** box. Users can also download the prediction results in CSV file format by clicking on the **Download** button.
