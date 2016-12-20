### Background
Oligomerization in fluorescent proteins (FP) hinders their usage as a marker for protein tagging. The problems include but are not limited to abnormal localization, interfering with signaling cascades and disturing the normal function of tagged proteins. The ability to predict the oligomeric state of FP may help facilitate the production of monomeric FP that are beneficial for life science applications.

### About osFP
osFP is a web application for predicting the oligomeric state of FP input sequences as being either monomeric or oligomeric. A simple and intuitive user interface is provided where users need only provide the sequence data (FASTA format) for FP of interest.

### Tutorial: Using osFP to predict the oligomeric states of FP
osFP is very simple to use requiring only 3 steps as follows: 

1. Prior to performing the prediction, users should wait until the gray box found under the **_Status/Output_** heading displays the following message: **_Server is ready for prediction. Please insert/upload sequence in FASTA format_**.
2. Paste the input sequences for FP of interest into the input box found below the heading **_Enter your input sequence(s) in FASTA format_**. Alternatively, users can choose to upload the input file of such data by clicking on the **_Choose File_** button. Click on the **_Submit_** button to initiate the prediction process.
4. Prediction results are provided in the gray box found below the **_Status/Output_** heading. Users can also download the results as a CSV file for later use.

### Setting up your own instance of osFP
0. Before you begin, it is recommended to sign up for [DigitalOcean](https://m.do.co/c/082445d5f7b1). If sign up via this link, you will be given $10 credit.
1. Install the [R software](https://www.r-project.org/) and the [RStudio Shiny Server](https://www.rstudio.com/products/shiny/download-server/) on a Linux server by following excellent tutorials available from [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-shiny-server-on-ubuntu-14-04) and [RStudio](https://www.rstudio.com/products/shiny/download-server/).
2. After successful installation, you should be able to go to the default welcome page that is hosted on your computer at the URL **_http://192.168.1.1:3838/_**
3. Download the osFP [source codes](https://github.com/chaninn/osFP/archive/master.zip) and unzip the contents of the ZIP file to the osFP folder at the following path: **_/srv/shiny-server/osfp/_**
4. Make sure that the Shiny Server is up and running by running the command: **_start shiny-server_**
5. Your local instance of osFP should be able to run from the URL **_http://192.168.1.1:3838/osfp/_**

### Launching the osFP on your local computer
You can also run your own local version of osFP right on your local computer in an R environment by typing the following one-line code:
```R
shiny::runGitHub('osfp','chaninn')
```

#### Prerequisite
Before beginning, please make sure to install the following R packages: *shiny*, *shinyjs* and *shinythemes*, *protr*, *seqinr*, *RWeka* and *markdown* which can be performed by typing the following commands into an R environment:
```R
install.packages(c('shiny','shinyjs','shinythemes','protr','seqinr','RWeka','markdown'))
```
