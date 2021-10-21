#!/bin/bash

#Esse programa foi feito em shell e se refere a como passar paramêtros ao programa pela linha de comandos (Paramêtros posicionais)
#./ftab.sh p1 p2 p3 pn
#    ^     ^  ^  ^  ^
#    $0    $1 $2 $3 $n
# Preferiu-se fazer uso da estrutura condicional case para gerar um menu de opções em Shell Script

#export PATH=$PATH:pwd"/"

AJUDA="
*****************************************
Software FTAB v1.0

-h --help       Exibe ajuda e sai
-v --version    Exibe versão e sai
-s --sigla      Exibe o siginificado da SIGLA FTAB 
-l --linhas     Quantidade de linhas do arquivo (2006-sample.csv)
-c --colunas    Quantidade de colunas do arquivo (2006-sample.csv)
-a --ArrDelay   Descobrir o vôo com maior atraso na chegada (ArrDelay) registrado.
-d --DepDelay   Descobrir o vôo com maior atraso na saída (DepDelay) registrado.
-b --VooLongo   Descobrir o vôo mais longo (Distância).
-r --Diverted   Contar quantos vôos precisaram ser redirecionados (Diverted).
-k --calc       Calcular o tempo de atraso total para a companhia Delta Air Lines
-m --jfkny      Mostrar o tempo total de atrasos para a decolagem de vôos no aeroporto JFK, de Nova Iorque.
*****************************************
"

VERSAO="Versão 1.0"

case "$1" in
-h | --help)
       echo "$AJUDA"
;;

-v | --version)
       echo "$VERSAO"
;;

-s | --sigla)
       echo "****************************"
       echo "FTAB significa Força Tarefa Afrânio e Brandão"
       echo -e "\nPara resolver alguns problemas precisamos sim de uma Força Tarefla, afinal,\ntrabalhar em equipe é melhor do que sozinho."
       echo "****************************"
;;

-l | --linhas)
       echo "****************************"
       echo "Quantidade de linhas do arquivo (2006-sample.csv)"
       echo "cat 2006-sample.csv | wc -l"
       cat  2006-sample.csv | wc -l
       echo "****************************"
;;

-c | --colunas)
       echo "****************************"
       echo "Quantidade de Colunas"
       echo "head -2 2006-sample.csv | tail -1 | tr ',' '\n' | wc -l"
       head -2 2006-sample.csv | tail -1 | tr ',' '\n' | wc -l
       echo "****************************"
;;

-a | --ArrDelay)
       echo "****************************2)"
       echo "Descobrir o vôo com maior atraso na chegada (ArrDelay) registrado."
       echo -e "sort -nk15 2006-sample.csv | sed -n -e '2p;Dolar(p)' \n"
       sort -nk15 2006-sample.csv | sed -n -e '2p'
       echo "****************************"
;;

-d | --DepDelay)
       echo "****************************3)"
       echo "Descobrir o vôo com maior atraso na saída (DepDelay) registrado."
       echo -e "sort -nk16 2006-sample.csv | sed -n -e '2p' \n"
       sort -nk16 2006-sample.csv | sed -n -e '2p'
       echo "****************************"
;;

-b | --VooLongo)
       echo "****************************4)"
       echo "Descobrir o vôo mais longo (Distância)."
       echo -e "sort -nk19 2006-sample.csv | sed -n -e '2p' \n"
       sort -nk19 2006-sample.csv | sed -n -e '2p'
       echo "****************************"
;;

-r | --Diverted)
       echo "****************************5)"
       echo "Contar quantos vôos precisaram ser redirecionados (Diverted)."
       echo -e "cat 2006-sample.csv | grep -c '0'| wc -l \n"
       cat 2006-sample.csv | grep -c '0'| wc -l
       echo "****************************"
;;

-k | --calc)
       echo "****************************"
       echo "Calcular o tempo de atraso total para a companhia Delta Air Lines."
       echo -e "cat 2006-sample.csv | grep -c '0'| wc -l \n"
       cat 2006-sample.csv | grep -c '0'| wc -l
       echo "****************************"
;;

-n | --jfkny)
       echo "****************************7)"
       echo -e "Mostrar o tempo total de atrasos para a decolagem (DepDelay) de vôos no aeroporto JFK, de Nova Iorque.\n"
       echo -e "sort -nk18 2006-sample.csv | grep 'JFK' | wc -l"
       echo -e "Número total de atraso de vôos no aeroporto JFK:"
       sort -nk18 2006-sample.csv | grep 'JFK' | wc -l 
       echo -e "\nawk -F\",\" '\$18==\"JFK\" {SUM+=\$16}END {print SUM}' 2006-sample.csv"
       echo -e "Tempo total de atrasos para a decolagem (DepDelay) de vôos no aeroporto JFK"
       awk -F "," '$18=="JFK" {SUM+=$16}END {print SUM}' 2006-sample.csv 
       
       #count '$18=="JFK" {SUM+=$16}END {print SUM}' 2006-sample.csv 
       #sort -nk18 2006-sample.csv | grep 'JFK' | wc -l (2198 JFK)
       #grep 2006-sample.csv | cut -d "," -f 2 | paste -sd+ | bc
       echo "****************************"
;;


*) 
  echo "****************************"
  echo "software FTAB v1.0"
  echo ""
  echo "Opção invalida"
  echo "Para maiores informações digite:"
  echo ""
  echo -e "./ftab.sh --help \n./ftab.sh -h"
  echo "****************************"
;;

esac



