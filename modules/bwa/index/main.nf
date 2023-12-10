#!/usr/bin/env nextflow

process BWA_INDEXING {
    input:
    path REF

    output:
    tuple val(meta), path("*.amb"), optional: true, emit: amb
    tuple val(meta), path("*.ann"), optional: true, emit: ann
    tuple val(meta), path("*.bwt"), optional: true, emit: bwt
    tuple val(meta), path("*.pac"), optional: true, emit: pac
    tuple val(meta), path("*.sa"), optional: true, emit: sa

    script:
    """
    bwa index -a bwtsw $REF
    """

}