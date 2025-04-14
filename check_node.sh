#!/bin/bash

if [ -z "$1" ];then
  echo '缺少参数,请传入路径'
  exit -1
fi

get_node_count() {
  echo `ls -l "$1" | cut -d ' ' -f 2`
}

OLDIFS=$IFS
IFS=$'\n'

for file in $(find "$1" -regextype posix-extended -type f -not -regex ".*\.(jpg|png|nfo|ass|srt|mp3)")
do
  node_count=$(get_node_count "$file")
  if [ $node_count -le 1 ]; then
    echo "文件:'$file'    的node数是:$node_count" 
  fi
done

IFS=$OLDIFS
