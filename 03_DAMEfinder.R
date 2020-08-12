#----------------------------------------------------------------
# DAMEfinder for Mealybug Sex-Specific data
#----------------------------------------------------------------

library(DAMEfinder)
library(SummarizedExperiment)
library(ggplot2)
library(ggrepel)

setwd("~/Dropbox/Edinburgh/Projects/Allele_specific/methtuple_files")

#----------------------------------------------------------------
# Read in files

tuple_files <- list.files("./", pattern="*.tsv.gz")
sample_names <- c("F1","F2","F3","F4","F5","M1","M3","M4","M5")

tuple_list <- read_tuples(tuple_files, sample_names, minCoverage = 5)

#----------------------------------------------------------------
# Calculate ASM based on tuples

ASMs <- calc_asm(tuple_list) # 5863535 CpG pairs

asm_regions <- SummarizedExperiment::assays(ASMs)$asm
asm_regions <- as.data.frame(asm_regions)
asm_regions$region <- row.names(asm_regions)
write.table(asm_regions, file="raw_asm_regions_sex_specific.txt", quote = F, col.names = T, row.names = F,
            sep="\t")

coverage <- SummarizedExperiment::assays(ASMs)$cov
coverage <- as.data.frame(coverage)
coverage$region <- row.names(coverage)
write.table(coverage, file="raw_coverage_regions_sex_specific.txt", quote = F, col.names = T, row.names = F,
            sep="\t")

#----------------------------------------------------------------
# Make some plots and play with the data

grp <- factor(c(rep("Female",5),rep("Male",4)), levels = c("Female", "Male"))
methyl_MDS_plot(ASMs, grp, top = 1000, coverage = 5, adj = 0.02, pointSize = 4)

asm_regions <- asm_regions[,-10]
pca_data=prcomp(t(asm_regions))
percentage <- round(pca_data$sdev / sum(pca_data$sdev) * 100, 0)
percentage <- paste(colnames(pca_data), paste( as.character(percentage), "%", sep="") )
condition <- factor(c(rep("Female",5),rep("Male",4)))
df_pca_data=data.frame(PC1 = pca_data$x[,1], PC2 = pca_data$x[,2], sample = colnames(asm_regions), Sex=condition)

ggplot(df_pca_data, aes(PC1, PC2, colour=Sex))+
  geom_point(size=14)+
  geom_text_repel(aes(label=sample), size=14,show.legend=FALSE, 
                  point.padding = 0.85, box.padding = 0.25)+
  theme_bw()+
  xlab(paste0("PC1: ",percentage[1],"variance")) +
  ylab(paste0("PC2: ",percentage[2],"variance")) +
  theme(axis.text=element_text(size=26),
        axis.title=element_text(size=30),
        legend.text=element_text(size=30),
        legend.title=element_blank())+
  scale_colour_manual(values=c("pink1", "steelblue1"))


#----------------------------------------------------------------
# Find differential allele specific methylation between replciates

# Remove any rows with NA, 9 = number of samples (NOT NEEDED)
#filt <- rowSums(!is.na(assay(ASMs, "asm"))) == 9 
#ASMs <- ASMs[filt,]

#make design matrix (or specify a contrast)
mod <- model.matrix(~grp)

#run default (this took > overnight on laptop, put on servers)
dames <- find_dames(ASMs, mod)
head(dames)
dames_output <- write.table(dames, file="dames.txt", sep="\t", quote = F, col.names = T, row.names = F)

#----------------------------------------------------------------
# Visualise some of the top DAMEs

colData(ASMs)$group <- grp
colData(ASMs)$samples <- colnames(ASMs)

#Set a DAME as a GRanges choosing from the above output
dame <- GRanges(19,IRanges(323736,324622))

dame_track(dame = dame,
           ASM = ASMs)


