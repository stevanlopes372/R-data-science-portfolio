setwd("C:/Users/neo2g/OneDrive/Documentos/Github Repos/R-data-science-portfolio/gorjeta")
getwd()

# Existe uma diferença significativa na média de gorjetas dadas por fumantes e _
  # não fumantes?

#carrego os dados
df <- read.csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv")
View(df)

#verifico se todos os dados estão preenchidos
print(colSums(is.na(df)))
