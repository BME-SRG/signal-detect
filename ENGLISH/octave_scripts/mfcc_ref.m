function REFDB=mfcc_ref(FNLIST)
# Calculates the MFCC features of the files in the FNLIST cell-array
# and stores them in REFDB cell-array.
for i=1:length(FNLIST)
  Y=wavread(FNLIST{i});
  REFDB{i}=melfcc(Y, 16000)';
end
