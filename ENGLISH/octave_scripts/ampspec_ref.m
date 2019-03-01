function REFDB=ampspec_ref(FNLIST)
# Calculates the amplitude spectrum of the files given in the FNLIST cell-array
# and stores it in REFDB cell-array
for i=1:length(FNLIST)
  Y=wavread(FNLIST{i});
  REFDB{i}=abs(specgram(Y, 512)');
end
