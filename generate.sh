#! /bin/bash
# Example usage: ./generate.sh marc21_biblio_schema.json dojson.tpl gen .py
# or ./generate.sh marc21_biblio_schema.json jsonschema.tpl gen .json

source=$1
template=$2
folder=$3
ext=$4
type=$5

mkdir -p $folder

while read -r line
do
  parts=(${line//:/ })
  python generate.py $source $template --re-fields ${parts[1]} > $folder/${parts[0]}$ext
done < filenames_$type.txt
