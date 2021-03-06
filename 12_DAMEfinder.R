#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
options(echo=TRUE)

#----------------------------------------------------------------
# DAMEfinder for Mealybug Sex-Specific data
#----------------------------------------------------------------

# To run script: Rscript <name_of_script.R> <input.tsv.gz>

library(DAMEfinder)
library(SummarizedExperiment)
library(ggplot2)
library(ggrepel)

species <- tools::file_path_sans_ext(basename(args[1]))
species <- gsub("_sorted_methtuple.CG.2.tsv","",species)

tuple_file <- args[1]

tuple_list <- read_tuples(tuple_file, species, minCoverage = 10)
ASMs <- calc_asm(tuple_list) 

asm_regions <- SummarizedExperiment::assays(ASMs)$asm
asm_regions <- as.data.frame(asm_regions)
asm_regions$region <- row.names(asm_regions)
colnames(asm_regions) <- c("asm_score","region")

# Remember: a score of 1 = one allele methylated and the other unmethylated
# a score of 0 means both alleles equally methylated
# Select a cut off of > 0.8 as in the DAMEfinder paper
asm_regions_filtered <- subset(asm_regions, asm_regions$asm_score > 0.8)

# Add coverage information for each region
coverage <- SummarizedExperiment::assays(ASMs)$cov
coverage <- as.data.frame(coverage)
coverage$region <- row.names(coverage)

asm_with_coverage <- merge(asm_regions_filtered, coverage, by="region")
colnames(asm_with_coverage)[3] <- "coverage"

write.table(asm_with_coverage, file=paste(species, "_ASM_regions.txt", sep=""), 
            quote = F, col.names = T, row.names = F, sep="\t")
