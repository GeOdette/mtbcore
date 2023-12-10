#!/usr/bin/env nextflow
process CREATINGDICTFILE {
    input:
    path genome

    output:
    path("*.dict"), optional: true, emit : dict

    script:
    """
    gatk CreateSequenceDictionary -R ${genome} -O ${genome.baseName}.dict
    """
}
