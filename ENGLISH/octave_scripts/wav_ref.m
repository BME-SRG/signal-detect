function REFDB=wav_ref(FNLIST)
# Loads the files given in the FNLIST cell-array
# and stores them in the REFDB cell-array
for i=1:length(FNLIST)
  REFDB{i}=wavread(FNLIST{i});
end
