#!/bin/bash

touch ~/.idioms

if [ "$1" == "add" ]; then
  
  name=""
  ans="n"
  while [ "$name" == "" ] || [ "$ans" != "y" ]; do
    echo -en "\e[1;39mIdiom Name : \e[0;39m"
    read name
    echo -en "\e[1mIs name Ok?(y/n) \e[0m: "
    read ans
  done
  
  
  name=$(echo $name|sed 's/ /_/g')
  
  shift
  com="$@"

  if [ "$com" == "[:last:]" ] || [ "$com" == "" ]; then
    com=$(cat ~/.bash_history|tail -n2|head -n1)
  fi
  
  echo "[$name] "$com"" >> ~/.idioms

  echo "Complete Add idioms"
  exit
fi


if [ "$1" == "" ]; then
  com=$(cat ~/.idioms|while read LINE;do
      echo $LINE|sed 's/\(\[.*\]\)/\\\\e[1;33m\1\\\\e[0;39m/g'|xargs echo -e
    done|fzf|awk '{$1="";print $0}'|sed 's/^ //g'
  )
  if [ "$idiom_DO" == "1" ];then
    eval $com
  else
    echo $com
  fi
fi
