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

-h   --help       Exibe ajuda e sai
-v   --version    Exibe versão e sai
-s   --sigla      Exibe o siginificado da SIGLA FTAB 
-l   --linhas     Quantidade de linhas do arquivo (2006-sample.csv)
-c   --colunas    Quantidade de colunas do arquivo (2006-sample.csv)
-e1  --exerc1     Descobrir a quantiade de atrasos de uma dada companhia passada como parâmetro. 
-e2  --ArrDelay   Descobrir o vôo com maior atraso na chegada (ArrDelay) registrado.
-e3  --DepDelay   Descobrir o vôo com maior atraso na saída (DepDelay) registrado.
-e4  --VooLongo   Descobrir o vôo mais longo (Distância).
-e5  --Diverted   Contar quantos vôos precisaram ser redirecionados (Diverted).
-e6  --calc       Calcular o tempo de atraso total para a companhia Delta Air Lines
-e7  --jfk        Mostrar o tempo total de atrasos para a decolagem de vôos no aeroporto JFK, de Nova Iorque.
-e8  --lax        Mostrar o tempo total de atrasos para pousos no Aeroporto Internacional de Los Angeles (LAX).
-b1  --bonus1     Listar qual companhia teve o maior tempo total de atrasos (atrasos somente na decolagem).
-b2  --bonus2     Listar qual aeroporto teve o maior tempo total de atrasos (atrasos somente na decolagem).
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
-t | --teste)
       echo "****************************"

       echo "****************************"
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

-e1 | --exerc1)
       echo "****************************(ok)"
       echo -e "Descobrir a quantiade de atrasos de uma dada companhia passada como parâmetro, em minutos.\n"
       cat 2006-sample.csv | cut -d, -f9,15,16 | cut -d, -f2,3 | grep '.,.' | wc -l
       echo "****************************"
;;

-e2 | --ArrDelay)
       echo "****************************(ok)"
       echo "Descobrir o vôo com maior atraso na chegada (ArrDelay) registrado."
       bash e2.sh 2006-sample.csv
       echo "****************************"
;;

-e3 | --DepDelay)
       echo "****************************(ok)"
       echo "Descobrir o vôo com maior atraso na saída (DepDelay) registrado."
       echo -e "cat 2006-sample.csv | sort -n -t, -k16 | cut -d, -f10 | tail -1 \n"
       cat 2006-sample.csv | sort -n -t, -k16 | cut -d, -f10 | tail -1
       echo "****************************"
;;

-e4 | --VooLongo)
       echo "****************************4)"
       echo "Descobrir o vôo mais longo (Distância)."
       echo -e "sort -nk19 2006-sample.csv | sed -n -e '2p' \n"
       sort -nk19 2006-sample.csv | sed -n -e '2p'
       echo "****************************"
;;

-e5 | --Diverted)
       echo "****************************(ok)"
       echo "Contar quantos vôos precisaram ser redirecionados (Diverted)."
       echo -e "cat 2006-sample.csv | cut -d, -f24 | grep 1 | wc -l \n"
       cat 2006-sample.csv | cut -d, -f24 | grep 1 | wc -l
       echo "****************************"
;;

-e6 | --calc)
       echo "****************************(ok)"
       echo "Calcular o tempo de atraso total para a companhia Delta Air Lines (DL)."
       bash e6.sh 2006-sample.csv 
       echo "****************************"
;;

-e7 | --jfk)
       echo "****************************(ok)"
       echo -e "Mostrar o tempo total de atrasos para a decolagem (DepDelay) de vôos no aeroporto JFK, de Nova Iorque.\n"
       echo -e "sort -nk18 2006-sample.csv | grep 'JFK' | wc -l"
       echo -e "Número total de atrasos de vôos no aeroporto JFK:"
       sort -nk18 2006-sample.csv | grep 'JFK' | wc -l #(2198 JFK)
       echo -e "\nawk -F\",\" '\$17==\"JFK\" {SUM+=\$16}END {print SUM}' 2006-sample.csv"
       echo -e "Tempo total de atrasos para a decolagem (DepDelay) de vôos no aeroporto JFK, em minutos."
       awk -F "," '$17=="JFK" {SUM+=$16}END {print SUM}' 2006-sample.csv 
       echo "****************************"
;;

-e8 | --lax)
       echo "****************************(ok)"
       echo -e "Mostrar o tempo total de atrasos para pousos no Aeroporto Internacional de Los Angeles (LAX).\n"
       echo -e "sort -nk17 2006-sample.csv | grep 'LAX' | wc -l"
       echo -e "Número total de atrasos de vôos no aeroporto no Aeroporto Internacional de Los Angeles (LAX):"
       sort -nk17 2006-sample.csv | grep 'LAX' | wc -l #(4729 LAX)
       echo -e "\nawk -F\",\" '\$17==\"LAX\" {SUM+=\$15}END {print SUM}' 2006-sample.csv"
       echo -e "Tempo total de atrasos para pousos no Aeroporto Internacional de Los Angeles (LAX), em minutos."
       awk -F "," '$17=="LAX" {SUM+=$15}END {print SUM}' 2006-sample.csv 
       echo "****************************"
;;

-b1 | --bonus1)
       echo "****************************"
       echo "Listar qual companhia teve o maior tempo total de atrasos (atrasos somente na decolagem)."
       bash b1.sh 2006-sample.csv 
       echo "****************************"
;;

-b2 | --bonus2)
       echo "****************************"
       echo "Listar qual aeroporto teve o maior tempo total de atrasos (atrasos somente na decolagem)."
       bash b2.sh 2006-sample.csv 
       echo "****************************"
;;

*) 
  echo "****************************"
  echo "software FTAB v1.0"
  echo ""
  echo "Opção invalida"
  echo "Para maiores informações digite:"
  echo ""
  echo -e "./ftab.sh --help ou ./ftab.sh -h"
  echo -e "bash ftab.sh --help ou bash ftab.sh -h"
  echo "****************************"
;;

esac



