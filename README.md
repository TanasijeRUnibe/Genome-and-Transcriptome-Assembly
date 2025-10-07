# Genome and Transcriptome Assembly — Course Scripts

This repository contains all Bash scripts developed during the **Genome and Transcriptome Assembly** practical course for the 2025 autumn semester.  
Each script represents a step in a typical *de novo* assembly and quality control workflow, from raw read cleaning to final assembly evaluation and comparative analyses.

---
## Learning Objectives

- Understand the complete workflow of genome and transcriptome assembly.  
- Compare the performance and accuracy of different assembly strategies.  
- Interpret assembly quality metrics (N50, BUSCO completeness, k-mer spectra, synteny plots).

---

## Overview

The repository is organized chronologically by week and analysis step:

| Week | Analysis Step | Description |
|------|----------------|-------------|
| **Week 1** | **Read Quality Control & k-mer Analysis** | `01fastp.sh` performs adapter trimming and quality filtering using **Fastp**. <br> `02jellyfish.sh` and `02_1jellyfish_histo.sh` count and visualize k-mer frequency distributions using **Jellyfish**, providing an overview of genome size and complexity. |
| **Week 2** | **Genome and Transcriptome Assembly** | `03_w2_flye.sh` assembles PacBio HiFi reads with **Flye**. <br> `04_w2_hifasm.sh` and `04_2_w2_hifasmconvert.sh` perform genome assembly and conversion with **Hifiasm**. <br> `05_w2_ija.sh` assembles using **IPA (HiCanu/IJA)**. <br> `06_w2_trinity.sh` runs **Trinity** for *de novo* transcriptome assembly. |
| **Week 3** | **Assembly Quality Assessment (BUSCO)** | `07_1_w3_busco_hifisam.sh`, `07_flye_w3_busco_genome.sh`, `07_ija_w3_busco_genome.sh`, and `07_2_w3_busco_transcriptome.sh` evaluate assembly completeness using **BUSCO** against relevant lineage datasets. |
| **Week 3** | **Assembly Statistics (QUAST)** | `08_1_quast_noref.sh` and `08_2_quast_ref.sh` compute detailed assembly statistics with **QUAST**, both with and without a reference genome. |
| **Week 3** | **Read Mapping and Polishing Assessment (Merqury)** | `09_w3_merqury.sh` performs **Merqury** analysis for consensus accuracy estimation using k-mer based metrics. |
| **Week 3** | **Synteny and Structural Comparison (MUMmer/Nucmer)** | `10_w3_nucmer_mummer.sh` runs **MUMmer/Nucmer** for whole-genome alignment and visualization of synteny and structural differences between assemblies and the reference. |

---

## Repository Contents

- All `.sh` files are ready-to-run **Slurm batch scripts** for HPC environments.
- Each script specifies computational resources (`--mem`, `--cpus-per-task`, `--time`, etc.).
- Tools are executed through **Apptainer containers** or HPC modules on the university's computing cluster.


---

## Tools

| Category | Tools |
|-----------|-------|
| **Quality Control** | Fastp |
| **k-mer Analysis** | Jellyfish |
| **Genome Assembly** | Flye, Hifiasm, IPA/IJA |
| **Transcriptome Assembly** | Trinity |
| **Quality Assessment** | BUSCO, QUAST |
| **Consensus Evaluation** | Merqury |
| **Structural Comparison** | MUMmer / Nucmer |
| **Execution Environment** | Apptainer containers, Slurm scheduler |

---

## Data used
- The tools were run from data available from the following publications:
  https://www.nature.com/articles/s41588-024-01715-9
  & http://dx.doi.org/10.1038/s41467-020-14779-y
- My accession was RRS-10
