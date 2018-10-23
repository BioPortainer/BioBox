#!/bin/bash

echo "Extracting GreenGenes Database..."
gunzip -c ./additional_files/97_otus.fasta.gz > ./additional_files/
echo "Pipeline Starting..."
echo " "
echo " "
snakemake $@
