##### Introdução a R

## Criando estruturas de dados dentro do R
### Concatenando dados no R - função c()
# Dados das pessoas

idade = c(24, 48, 32, 65, 38, 56, 74, 19, 29, 22)
peso = c(80, 67, 49, 55, 89, 72, 45, 88, 56, 74)
altura = c(180, 165, 162, 175, 172, 165, 168, 185, 172, 168)
sexo = c('M','F','M','F','M','F','M','F','M','F')

### Inspecionando as estruturas

idade 
[1] 24 48 32 65 38 56 74 19 29 22

show(idade)
[1] 24 48 32 65 38 56 74 19 29 2

sexo = c('M','F','M','F','M','F','M','F','M','F')

sexo[3]
[1] "M"

sexo[c(3,5)]
[1] "M" "M"

### Alterando valores das estruturas e listando os objetos no ambiente

sexo
[1] "M" "F" "M" "F" "M" "F" "M" "F" "M" "F"

sexo[c(3,5)] = c("F", "M")
sexo
[1] "M" "F" "F" "F" "M" "F" "M" "F" "M" "F"

a = 2+3+4+5+6+7
rm(a)
a = 2+3+4+5+6+7
b = a*2
resultado = a+b
rm(a, b, resultado)
ls()

# ### Funções simples aplicadas em um objeto

length(idade)
idade
sort(idade)
sort(idade, decreasing = T)
str(idade)
str(sexo)

# ### Operadores lógicos

altura>170
sexo[altura>170]
table(sexo[altura>170])

## Trabalhando com Data Frames
### Criando um Data Frame

tabela = data.frame(altura, sexo, idade, peso)
View(tabela)

# ### Manipulando um data frame

str(tabela)
names(tabela)
names(tabela)[1] = "Height"
names(tabela)[1]
names(tabela)[1] = "altura"
names(tabela)[1]
head(tabela, n = 5)
tail(tabela, n = 5)
tabela$sexo

str(tabela)

## Saída

'data.frame':	10 obs. of  4 variables:
 $ altura: num  180 165 162 175 172 165 168 185 172 168
 $ sexo  : chr  "M" "F" "M" "F" ...
 $ idade : num  24 48 32 65 38 56 74 19 29 22
 $ peso  : num  80 67 49 55 89 72 45 88 56 74
> names(tabela)
[1] "altura" "sexo"   "idade"  "peso"  
> names(tabela)[1] = "Height"
> names(tabela)[1]
[1] "Height"
> names(tabela)[1] = "altura"
> names(tabela)[1]
[1] "altura"
> head(tabela, n = 5)
  altura sexo idade peso
1    180    M    24   80
2    165    F    48   67
3    162    M    32   49
4    175    F    65   55
5    172    M    38   89
> tail(tabela, n = 5)
   altura sexo idade peso
6     165    F    56   72
7     168    M    74   45
8     185    F    19   88
9     172    M    29   56
10    168    F    22   74
> tabela$sexo
 [1] "M" "F" "M" "F" "M" "F" "M" "F" "M" "F"
 
###########################################

head(tabela$sexo, 7) # note que não é necessário colocar n = 7 para funcionar

tabela[1, 1] # altura da primeira pessoa
tabela[2, 1] # altura da segunda pessoa
tabela[1, 2] # sexo da primeira pessoa
tabela[, 3] # dispõe as idades de todas as pessoas
tabela[2, ] # apresenta as informações da segunda pessoa
tabela[, c(1, 3)] # apresenta somente a 1a e 3a coluna
tabela[, -2] # omite o sexo das pessoas

## Saída

head(tabela$sexo, 7) # note que não é necessário colocar n = 7 para funcionar
[1] "M" "F" "M" "F" "M" "F" "M"

> tabela[1, 1] # altura da primeira pessoa
[1] 180

> tabela[2, 1] # altura da segunda pessoa
[1] 165
> tabela[1, 2] # sexo da primeira pessoa
[1] "M"

> tabela[, 3] # dispõe as idades de todas as pessoas
 [1] 24 48 32 65 38 56 74 19 29 22

> tabela[2, ] # apresenta as informações da segunda pessoa
  altura sexo idade peso
2    165    F    48   67

> tabela[, c(1, 3)] # apresenta somente a 1a e 3a coluna
   altura idade
1     180    24
2     165    48
3     162    32
4     175    65
5     172    38
6     165    56
7     168    74
8     185    19
9     172    29
10    168    22

> tabela[, -2] # omite o sexo das pessoas
   altura idade peso
1     180    24   80
2     165    48   67
3     162    32   49
4     175    65   55
5     172    38   89
6     165    56   72
7     168    74   45
8     185    19   88
9     172    29   56
10    168    22   74

### Exportando/Importando um data frame

write.csv(tabela, "BaseDados.csv")
rm(tabela) # rm(tabela) - remove a tabela

tabela = read.csv("BaseDados.csv")

View(tabela)
tabela = tabela[, -1]
head(tabela) # por default, mostra as 6 primeiras linhas
View(tabela)
> tabela = tabela[, -1]
> head(tabela) # por default, mostra as 6 primeiras linhas
  idade peso
1    24   80
2    48   67
3    32   49
4    65   55
5    38   89
6    56   72

> write.csv(tabela, "BaseDados.csv")
> rm(tabela)
> tabela = read.csv("BaseDados.csv")
> View(tabela)
> tabela = tabela[, -1] # Explicação

# tabela[, -1]: essa sintaxe significa que você está selecionando todas as linhas (tabela[, ]) e todas as colunas exceto a primeira (-1);

# tabela = ...: o resultado da operação é atribuído de volta à variável tabela, efetivamente removendo a primeira coluna.

# Suponha que você tenha uma tabela com as seguintes colunas:

# | Coluna 1 | Coluna 2 | Coluna 3 |
# | --- | --- | --- |
# | 1 | 2 | 3 |
# | 4 | 5 | 6 |
# | 7 | 8 | 9 |

# Se você executar tabela = tabela[, -1], a tabela resultante será:

# | Coluna 2 | Coluna 3 |
# | --- | --- |
# | 2 | 3 |
# | 5 | 6 |
# | 8 | 9 |

# Conclusão:

# Essa operação é útil quando você precisa remover uma coluna específica de uma tabela, especialmente se a primeira coluna não for necessária para a análise ou processamento subsequente. Se você tiver mais alguma dúvida, não hesite em perguntar.

> head(tabela) # por default, mostra as 6 primeiras linhas

  altura sexo idade peso
1    180    M    24   80
2    165    F    48   67
3    162    M    32   49
4    175    F    65   55
5    172    M    38   89
6    165    F    56   72

cos(pi)^2 + sin(pi)^2
[1] 1

