function [ET, MIN_INDEX]=mfcc_illeszt(REFDB, FNLISTA)
# Euklidészi távolság alapú illesztést végez és csúcsot keres a megadott lényegkiemelt
# referenci adatbázis elemei és a megadott wav-fájlnév lista elemei között, az összes
# kombinációban.
# Bemenetek: REFDB: lényegkiemelt referencia adatbázis, amit a mfcc_ref függvény készít el
#            FNLISTA: felismerendő wav fájlneveket tartalmazó cell-array
# Kimenetek: ET: kétdimenziós cell-array. ET{i,j} az i. FNLISTA-beli fájlnak a j. referencia
#             adatbázisbeli hanganyaggal való illesztésével előálló euklidészi távolság-sorozat.
#            MIN_INDEX: az ET-vel megegyező indexelésű cell-array, az ET-ben etcsucs() függvénnyel
#             megtalált csúcsokat tartalmazza.
for i=1:length(FNLISTA)
  Y=wavread(FNLISTA{i});
  mfcc=melfcc(Y,16000)';
  for j=1:length(REFDB);
    ET{i,j}=illeszt(REFDB{j}, mfcc);
    MIN_INDEX{i,j}=etcsucs(ET{i,j});
  end
end