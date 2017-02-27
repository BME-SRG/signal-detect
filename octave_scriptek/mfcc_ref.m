function REFDB=mfcc_ref(FNLISTA)
# MFCC lényegkiemelést végez a FNLISTA cell array-ben adott fájlokon, és eltátolja a REFDB cell arrayben
for i=1:length(FNLISTA)
  Y=wavread(FNLISTA{i});
  REFDB{i}=melfcc(Y, 16000)';
end