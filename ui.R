library(shiny)
library(shinythemes)
library(protr)
library(markdown)

shinyUI(fluidPage(title="osFP: a web server for predicting the oligomeric state of fluorescent proteins", theme=shinytheme("united"),
                  navbarPage(strong("osFP"), collapsible = TRUE,
                             titleContent <- HTML("<b>osFP</b>: a web server for predicting the oligomeric state of fluorescent proteins"),
                             tabPanel("Submit Job", titlePanel(titleContent),
                                      sidebarLayout(
                                        wellPanel(
                                          tags$label("Enter your input sequence(s) in FASTA format",style="float: none; width: 100%;"),
                                          actionLink("addlink", "Insert example data"),
                                          tags$textarea(id="Sequence", rows=5, cols=100, style="float: none; width:100%;", ""),
                                          #actionLink("addlink", "Insert example data"),
                                          #tags$label("or",style="float: none; width: 100%;"),
                                          fileInput('file1', 'or upload file',accept=c('text/FASTA','FASTA','.fasta','.txt')),
                                          # tags$label("Step 2 - Submit your job",style="float: none; width: 100%;"),
                                          actionButton("submitbutton", "Submit", class = "btn btn-primary"),
                                          HTML("<a class='btn btn-default' href='/osfp'>Clear</a>")
                                        ), #wellPanel
                                        
                                        mainPanel(
                                          tags$label("Status/Output",style="float: none; width: 100%;"),
                                          verbatimTextOutput('contents'),
                                          downloadButton('downloadData', 'Download CSV')
                                        )  
                                      ) #sidebarLayout
                             ), #tabPanel Submit Job
                             
                             tabPanel("About", titlePanel("About"), div(includeMarkdown("about.md"), align="justify")),
                             tabPanel("Download", titlePanel("Download"), div(includeMarkdown("download.md"), align="justify")),
                             tabPanel("Citing Us", titlePanel("Citing Us"), div(includeMarkdown("cite.md"), align="justify")),
                             tabPanel("Contact", titlePanel("Contact"), div(includeMarkdown("contact.md"), align="justify")),	
                             
                             copyright <- div(HTML("<br><table border=0 cellpadding=10 cellspacing=10 width='100%' height='50'><tr><td bgcolor='#f2f2f2' align='center'>Copyright © 2016 <a href='http://codes.bio'>codes.bio</a>. All rights reserved.</td></tr></table>")),
                             cat(as.character(copyright))
                  ) #navbarPage
) #fluidPage	
) #shinyUI
