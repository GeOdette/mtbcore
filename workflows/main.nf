#!/usr/bin/env nextflow

log.info """
M T B - NF P I P E L I N E 
"""
params.reads = "$launchDir/data/*_{1,2}.*"

include { SAMTOOLS_INDEX} from '../modules/samtools/main.nf'
include {CREATINGDICTFILE} from '../modules/gatk/dict/main.nf'
include {FASTQC} from '../modules/fastqc/main.nf'
include {BWA_INDEXING} from '../modules/bwa/index/main.nf'
include {BWA_MEM} from '../modules/bwa/mem/main.nf'

workflow {
    reads_ch = Channel.fromFilePairs(params.reads, checkIfExists: true)
    index_ch = SAMTOOLS_INDEX(params.REF)
    dict_ch = CREATINGDICTFILE(params.ref_path)
    fastqc_ch = FASTQC(reads_ch)
    bwa_ch = BWA_INDEXING(params.REF)
    bam_ch = BWA_MEM(params.REF, reads_ch)
}

