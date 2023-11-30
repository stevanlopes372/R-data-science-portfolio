setwd("C:/Users/neo2g/OneDrive/Documentos/Github Repos/R-data-science-portfolio/gorjeta")
getwd()
library(tidyverse)
library(car)

# Existe uma diferença significativa na média de gorjetas dadas por fumantes e _
  # não fumantes?

# carrego os dados
df <- read.csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv")
View(df)

# verifico se todos os dados estão preenchidos
print(colSums(is.na(df)))

# vejo os itens da coluna df$smoker
unique(df$smoker)


# para o teste t funcionar precisamos de 5 condições:

# 1- os dados são aleatórios e representativos da população
# 2- A variável dependente é contínua
# 3- Ambos os grupos são independentes (exaustivos excludentes)
# 4- Os resíduos do modelo são normalmente distribuídos
# 5- A variância residual é homogênea (princípio da homocedasticidade) _
  # Isso significa dizer que a variÂncia entre os dois grupos é a mesma

# para fins didáticos, nesse estudo de caso iremos adotar como verdadeiras as _
  # suposições 1 a 3 (dado a natureza dos dad) e validaremos as suposições _
  # 4 (teste de Shapiro-Wilk) e 5 (teste F)


# validando a suposição 4 usando teste de Shapiro-Wilk
# Suposição 4- Os resíduos do modelo são normalmente distribuídos


# analisando o grupo de FUMANTES
shapiro.test(df$total_bill[fumantes])

# Parao grupo de fumantes o p-value foi menor do que 0.05 (p-value = 0.0002167)
# Isso implica em rejeitar H0 e concluir que os dados _
  # não têm uma distribuição normal

# A aplicação do teste t de Student pressupõe que os dados sejam normalmente _
  # distribuídos. No entanto, a violação dessa suposição não necessariamente _
  # invalida o teste t. De acordo com o teorema do limite central, _
  # a distribuição das médias tende a ser normal se o tamanho da amostra for _
  # superior a 30. Como estamos usando uma amostra de 244 itens, então é _
  # razoável aplicar o TCL





# analisando o grupo de NÃO-FUMANTES
shapiro.test(df$total_bill[! fumantes])


# Parao grupo de fumantes o p-value foi menor do que 0.05 (p-value = 2.211e-08)
# Isso implica em rejeitar H0 e concluir que os dados _
# não têm uma distribuição normal

# A aplicação do teste t de Student pressupõe que os dados sejam normalmente _
# distribuídos. No entanto, a violação dessa suposição não necessariamente _
# invalida o teste t. De acordo com o teorema do limite central, _
# a distribuição das médias tende a ser normal se o tamanho da amostra for _
# superior a 30. Como estamos usando uma amostra de 244 itens, então é _
# razoável aplicar o TCL




# validando a suposição 5 usando teste F
# Suposição 5- A variância residual é homogênea (princípio da homocedasticidade)

# preciso comparar a variância de dois grupos
# Para rejeitar a hipótese nula de que as médias do grupo são iguais, _
# precisamos de um valor F alto.
# H0 = As médias de dados extraídos de uma população normalmente distribuída _
# tem a mesma variância.

var.test(total_bill ~ smoker, data = df)

# O valor-p é de 0.05755, logo, maior que 0.05. Falhamos em rejeitar a H0.
# Não há diferença significativa entre as variâncias dos 2 grupos.


***********parei aqui































t.test(total_bill ~ smoker, data = df, var.equal = TRUE)

# O valor-p do teste é 0.182, logo, maior que 0.05. Falhamos em rejeitar a H0.
# Podemos concluir que os 2 grupos não tem diferença significativa.
# Não há diferença significativa entre a média das gorjetas de fumantes _
  #e não-fumantes