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

function sort_by_DepDelay() {
  FLIGHT_DATA=$(awk -F',' 'NF==29 && NR>1' $1 | sort --field-separator="," -k 16 -nr | head -n1)
  Origin=$(echo $FLIGHT_DATA | cut -d, -f17)
  DepDelay=$(echo $FLIGHT_DATA | cut -d, -f16)

  cat << EOF
  
O voo com maior atraso na decolagem é o voo número: $Origin
Esse voo teve um atraso de $DepDelay minutos na decolagem.
EOF
}

function main() {
  arg_parse "$@"
  sort_by_DepDelay $DATAFILE
}

main "$@"