function REFDB=wav_ref(FNLISTA)
# Betölti a FNLISTA cell array-ben adott fájlokat, és eltátolja a REFDB cell arrayben
for i=1:length(FNLISTA)
  REFDB{i}=wavread(FNLISTA{i});
end