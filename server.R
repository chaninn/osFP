library(shiny)
library(seqinr)
library(protr)
library(RWeka)
library(shinyjs)

# Function for Descriptor Calculation
computeAAC = function (x) {
  if (protcheck(x) == FALSE) stop('x has unrecognized amino acid type')
  AADict = c("T","R","Q","E","D","C","A")
  AAC = summary(factor(strsplit(x, split = '')[[1]], levels = AADict),
                maxsum = 8)/nchar(x)
  return(AAC)
}

computeDC = function (x) {
  if (protcheck(x) == FALSE) stop('x has unrecognized amino acid type')
  DCDict = c("LI","ML","YS","SF","NR","HY","TA","LT")
  xSplitted = strsplit(x, split = '')[[1]]
  n  = nchar(x)
  DC = summary(factor(paste(xSplitted[-n], xSplitted[-1], sep = ''),
                      levels = DCDict), maxsum = 9)/(n - 1)
  return(DC)
}

computeTC = function (x) {
  if (protcheck(x) == FALSE) stop('x has unrecognized amino acid type')
  TCDict = c('RMY','MVS','KLE','GTN','IKV')
  xSplitted = strsplit(x, split = '')[[1]]
  n  = nchar(x)
  TC = summary(factor(paste(paste(xSplitted[-c(n, n-1)],
                                  xSplitted[-c(1, n)], sep = ''),
                            xSplitted[-c(1, 2)], sep = ''),
                      levels = TCDict), maxsum = 6)/(n - 2)
  return(TC)
}

# Model Building
training <- read.csv("Tr_select.csv", header = TRUE)
fit <- J48(Oligomerization~., data = training)


shinyServer(function(input, output, session) {

  observe({
    FASTADATA <- ''
    fastaexample <- '>mCitrine-Monomer
DPMVSKGEELFTGVVPILVELDGDVNGHKFSVSGEGEGDATYGKLTLKF
ILTTGKLPVPWPTLVTTFGYGLMVFARYPDHMKRHDFFKSAMPEGYVQER
TIFFKDDGNYKTRAEVKFEGDTLVNRIELKGIDFKEDGNILGHKLEYNYN
SHNVYIMADKQKNGIKVNFKIRHNIEDGSVQLADHYQQNTPIGDGPVLLP
DNHYLSYQSKLSKDPNEKRDHMVLLEFVTAAGITHGMDELYK
>amFP486(E150Q)-Tetramer
MRGSHHHHHHGSALSNKFIGDDMKMTYHMDGCVNGHYFTVKGEGNGKPY
EGTQTSTFKVTMANGGPLAFSFDILSTVFKYGNRCFTAYPTSMPDYFKQA
FPDGMSYERTFTYEDGGVATASWEISLKGNCFEHKSTFHGVNFPADGPVM
AKKTTGWDPSFQKMTVCDGILKGDVTAFLMLQGGGNYRCQFHTSYKTKKP
VTMPPNHVVEHRIARTDLDKGGNSVQLTEHAVAHITSVVPF
'

    if(input$addlink>0) {
      isolate({
        FASTADATA <- fastaexample
        updateTextInput(session, inputId = "Sequence", value = FASTADATA)
      })
    }
  })
  
  datasetInput <- reactive({
    
    inFile <- input$file1 
    inTextbox <- input$Sequence
    
    if (is.null(inTextbox)) {
      return("Please insert/upload sequence in FASTA format")
    } else {
      if (is.null(inFile)) {
        x <- inTextbox
        write.fasta(sequence = x, names = names(x),
                    nbchar = 80, , file.out = "text.fasta")
        x <- readFASTA("text.fasta")
        x <- x[(sapply(x, protcheck))]
        AAC <- t(sapply(x, computeAAC))
        DC <- t(sapply(x, computeDC))
        TC <- t(sapply(x, computeDC))
        Feature = cbind(AAC,DC,TC)
        test = data.frame(Feature)
        Prediction <- predict(fit, test)
        Prediction <- as.data.frame(Prediction)
        Protein <- cbind(Name = rownames(test, test))
        results <- cbind(Protein, Prediction)
        results <- data.frame(results, row.names=NULL)
        print(results)
      } 
      else {     
        x <- readFASTA(inFile$datapath)
        x <- x[(sapply(x, protcheck))]
        AAC <- t(sapply(x, extractAAC))
        DC <- t(sapply(x, extractDC))
        TC <- t(sapply(x, computeTC))
        Feature = cbind(AAC,DC,TC)
        test = data.frame(Feature)
        Prediction <- predict(fit, test)
        Prediction <- as.data.frame(Prediction)
        Protein <- cbind(Protein = rownames(test, test))
        results <- cbind(Protein, Prediction)
        results <- data.frame(results, row.names=NULL)
        print(results)
      }
    }
  })

  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate(datasetInput()) 
    } else {
        return("Server is ready for prediction. Please insert/upload sequence in FASTA format")
      }
  })

  output$downloadData <- downloadHandler(
    filename = function() { paste('Predicted_Results', '.csv', sep='') },
    content = function(file) {
      write.csv(datasetInput(), file, row.names=FALSE)
    })

  })
