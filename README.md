# osFP
[![DOI](https://img.shields.io/badge/DOI-10.1186%2Fs13321--016--0185--8-blue.svg)](https://doi.org/10.1186/s13321-016-0185-8)

osFP is a web server for predicting the oligomeric state of fluorescent proteins.

### Prerequisites

Before beginning, please make sure to install the following R packages: *shiny*, *shinyjs* and *shinythemes*, *protr*, *seqinr*, *RWeka* and *markdown* which can be performed by typing the following commands into an R environment:

```R
install.packages(c('shiny','shinyjs','shinythemes','protr','seqinr','RWeka','markdown'))
```

### Launching the application
To launch the application on your own local computer, in an R environment, type the following:

```R
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

> Simeon S, Shoombuatong W, Anuwongcharoen N, Preeyanon L, Prachayasittikul V, Wikberg JES, Nantasenamat C. 
[osFP: a web server for predicting the oligomeric states of fluorescent proteins](http://jcheminf.springeropen.com/articles/10.1186/s13321-016-0185-8). ***Journal of Cheminformatics*** 
8 (2016) 72. 

[![DOI](https://img.shields.io/badge/DOI-10.1186%2Fs13321--016--0185--8-blue.svg)](https://doi.org/10.1186/s13321-016-0185-8)

The BibTex reference format is given below:
```
@article{Simeon2016osFP,
    author="Simeon, Saw
    and Shoombuatong, Watshara
    and Anuwongcharoen, Nuttapat
    and Preeyanon, Likit
    and Prachayasittikul, Virapong
    and Wikberg, Jarl E. S.
    and Nantasenamat, Chanin",
    title="osFP: a web server for predicting the oligomeric states of fluorescent proteins",
    journal="Journal of Cheminformatics",
    year="2016",
    volume="8",
    number="1",
    pages="72",
    issn="1758-2946",
    doi="10.1186/s13321-016-0185-8",
    url="http://dx.doi.org/10.1186/s13321-016-0185-8"
}
```
