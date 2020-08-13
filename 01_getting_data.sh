#-----------------------------------------
# Getting all of the data
#-----------------------------------------

# NOTE:
# Alun already has the data for some of the wasp (and ant?) species so no need to download

# L. albipes (bee)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-run-9/SRR5192887/SRR5192887.1

# D. novaeangliae (bee)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-run-9/SRR5192888/SRR5192888.1

# N. lecontei (sawfly)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-run-9/SRR5192885/SRR5192885.1
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-run-9/SRR5192886/SRR5192886.1

# Ceratina calcarata (bee)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-5/SRR2954336/SRR2954336.1

# A. mellifera (bee)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR042617/SRR042617.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR042618/SRR042618.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR042619/SRR042619.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR042620/SRR042620.3

# Nasonia vitripennis (wasp)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR647668/SRR647668.2

# Harpegnathos saltator (ant)
# Replicate 1 (hiseq)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333783/SRR333783.3
# Replicate 1 (ga)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333780/SRR333780.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333781/SRR333781.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333782/SRR333782.3
# Replicate 2 (hiseq)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333784/SRR333784.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333785/SRR333785.3

# Camponotus floridanus (ant)
# Replicate 1 (ga)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333750/SRR333750.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333751/SRR333751.3
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333752/SRR333752.3
# Replicate 2 (hiseq)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-1/SRR333753/SRR333753.3

# Solenopsis invicta (ant)
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos1/sra-pub-run-5/SRR534568/SRR534568.2

# Add file ending
for file in SRR*; do mv "${file}" "${file}.sra"; done