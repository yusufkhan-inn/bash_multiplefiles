## Using kraken for multiple files in the folder

#!/bin/bash
mkdir result

for R1 in *_1*

do  

R2=${R1//_1.fastq/_2.fastq}
R3=${R1//_1.fastq/_unclassified.fastq}
R4=${R1//_1.fastq/_classified.fastq}
R5=${R1//_1.fastq/_output.txt}
R6=${R1//_1.fastq/_report.txt}

echo "processing $R1 $R2 $R3 $R4 $R5 $R6"

#krakenuniq --db DBDIR --threads 10 --report-file $R3 > $R4 $R1 $R2
/data/tools/krakenuniq/krakenuniq --db /datastore/tools/DBDIR --threads 8 --fastq-input --unclassified-out $R3 --classified-out $R4 --output $R5 --report $R6 --paired $R1 $R2

done

