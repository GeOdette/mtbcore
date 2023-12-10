#!/usr/bin/env nextflow

process BWA_MEM {

    input:
    path REF
    tuple val(replicateID), path (reads)

    output:
    tuple val (replicateID), path ("*.bam")

    script:
    """
    bwa mem -t $task.cpus -R '@RG\tID:${replicateID}\tSM:${replicateID}\tPL:ILLUMINA' ${REF} ${reads} > ${replicateID.bam}
    """
}