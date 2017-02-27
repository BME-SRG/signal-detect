function REFDB=ampspec_ref(FNLISTA)
# Amplitúdóspektrumot számít a FNLISTA cell array-ben adott fájlokon, és eltátolja a REFDB cell arrayben
for i=1:length(FNLISTA)
  Y=wavread(FNLISTA{i});
  REFDB{i}=abs(specgram(Y, 512)');
end