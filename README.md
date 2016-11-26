# osFP
osFP is a web server for predicting the oligomeric state of fluorescent proteins.

### Prerequisites

Before beginning, please make sure to install the following R packages: *shiny*, *shinyjs* and *shinythemes*, which can be performed by typing the following commands into an R environment:

```
install.packages(c('shiny','shinyjs','shinythemes'))
```

### Launching the application
To launch the application on your own computer, in an R environment, type the following:

```
shiny::runGitHub('osfp','chaninn')
```
In a few moments, the application should launch from your web browser.

### Using the application
To use the application:

**Step 1.** Before starting, please wait until you see the following message in the **Status/Output** text box:
```
[1] "Server is ready for prediction. Please insert/upload sequence in FASTA format"
```
**Step 2.** Paste your sequences in FASTA format into the text box *or* Upload your input FASTA files
**Step 3.** The prediction results will appear in the **Status/Output** box. Users can also download the prediction results in CSV file format by clicking on the **Download** button.

### Citing this work
If you find the osFP web server useful, please cite:
```
Simeon S, Shoombuatong W, Anuwongcharoen N, Preeyanon L, Prachayasittikul V, Wikberg JES, Nantasenamat C. osFP: 
a web server for predicting the oligomeric states of fluorescent proteins. Journal of Cheminformatics
(Accepted for Publication).
```
