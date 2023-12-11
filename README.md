# mtbcore

**mtbcore** is a bioinformatics pipeline, developed using Nextflow, designed for the analysis of Mycobacterium tuberculosis (M. tuberculosis) whole genome sequencing (WGS) data. As a work in progress, this pipeline aims to provide comprehensive insights into tuberculosis (TB) epidemiology and surveillance efforts.

## Overview

**mtbcore** encompasses a variety of functionalities, including quality control, mapping, variant calling, phylogenetics, resistance prediction, and various downstream analyses tailored for M. tuberculosis WGS data.

### Key Features:

1. **FastQC for raw read QC**
2. **Adapter and quality trimming options:**
   - Trimmomatic
   - fastp 
3. **BWA-MEM for mapping to the H37Rv reference genome**
4. **FreeBayes for variant calling**
5. **GATK HaplotypeCaller for joint genotyping**
6. **VCF2Diploid for variant filtering**
7. **snpEff for variant annotation**
8. **SNP pruning and phylogenetic tree building**
9. **SnpEff/SnpSift for variant annotation**
10. **PhyResSE, TBProfiler, and custom dbs for resistance prediction**
11. **Lineage classification from barcode SNPs**
12. **Data visualization with Phandango, TBvcf, and Rainfall plots.**

The pipeline is optimized for PBS/SLURM clusters, ensuring scalability for large cohort-scale dataset analysis involving thousands of M. tuberculosis isolates. It efficiently handles paired-end FASTQ inputs and integrates metadata for downstream interpretation.

## Usage

To run **mtbcore**, use the following command:

```bash
nextflow run mtbcore.nf -profile <docker/singularity> [--options]
```

Specify input data using:

```bash
-fq '<PATH TO INPUT FASTQ>' --meta '<METADATA TSV>'
```

### Key Run Parameters:

- `--genome <REF GENOME PATH>`
- `--outdir <OUTPUT FOLDER PATH>`
- `--resume` (to resume from a previous run)

For additional customization options, refer to the comments in **mtbcore.config**.

Upon execution, an output directory will be generated, with results organized in sub-folders corresponding to each analysis step. Log and timing files detail the pipeline run.

## Output

Key output files include:

- QC summary metrics
- Sorted BAM alignment files
- Raw SNP VCF
- Annotated filtered SNP table
- Phylogenetic tree (Newick format)
- Lineage classification report
- PDF resistance profiles
- Various visualization files

Review the output documentation for in-depth guidance on locating and interpreting the outputs.

## Requirements

**mtbcore** has been developed and tested on Linux systems. It requires Nextflow 20+ and either Docker or Singularity. While SLURM is used for cluster execution, local execution is also supported.
