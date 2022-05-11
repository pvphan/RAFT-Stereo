#!/bin/bash
folderNames="datasets models"

for folderName in $folderNames
do
    mkdir -p ./$folderName
    dataDirSize=$(ls ./$folderName | wc -l)
    if [[ "$dataDirSize" -eq 0 ]]; then
        ./download_$folderName.sh
    fi
done
