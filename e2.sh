#!/usr/bin/env bash

function usage() {
cat << EOF
  Uso: $(basename "$0") arquivo_de_dados
  Descrição: busca em um arquivo csv o maior atraso na chegada (ArrDelay).
    -h | --help       Mostrar essa ajuda
EOF
}

function arg_parse() {
  if [[ $# == 0 ]]; then
    cat << EOF
    Não foram fornecidos argumentos.
EOF
    usage
    exit 0
  elif [[ $# == 1 ]]; then
    case $1 in 
      -h | --help)
        usage
        exit 0
        ;;
      *)
      DATAFILE=$1
      ;;
    esac
  else
  cat << EOF
  
    Número inválido de argumentos: $#
EOF
    usage
    exit 0
  fi
}

function sort_by_ArrDelay() {
  FLIGHT_DATA=$(awk -F',' 'NF==29 && NR>1' $1 | sort --field-separator="," -k 15 -nr | head -n1)
  TailNum=$(echo $FLIGHT_DATA | cut -d, -f11)
  ArrDelay=$(echo $FLIGHT_DATA | cut -d, -f15)

  cat << EOF
  
O voo com maior atraso na chegada é o voo número: $TailNum
Esse voo teve um atraso de $ArrDelay minutos na chegada.
EOF
}

function main() {
  arg_parse "$@"
  sort_by_ArrDelay $DATAFILE
}

main "$@"