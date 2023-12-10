#!/usr/bin/env nextflow
process SAMTOOLS_INDEX {
    input:
    path genome

    output: 
    path ("*.fai"), optional: true, emit : fai

    script:
    """
    samtools faidx ${genome}
    """
}
