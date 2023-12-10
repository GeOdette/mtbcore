#!/usr/bin/env nextflow
process FASTQC {
    input:
    tuple val(replicateID), path(reads)

    output:
    path("*.html"), emit: html
    path("*.zip"), emit: zip

    script:
    """
    fastqc -f fastq -q ${reads}

    """

    
}
