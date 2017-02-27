function [ET, MIN_INDEX]=wav_illeszt(REFDB, FNLISTA, KEZD, HOSSZ)
# Euklidészi távolság alapú illesztést végez és csúcsot keres a megadott hullámforma
# referencia adatbázis elemei és a megadott wav-fájlnév lista elemei között, az összes
# kombinációban.
# Bemenetek: REFDB: hullámforma referencia adatbázis, amit a wav_ref függvény készít el
#            FNLISTA: felismerendő wav fájlneveket tartalmazó cell-array
#            KEZD: Illesztés kezdete a ref. fájlban mért mp-ben
#            HOSSZ: Illesztési ablakcsúsztatás hossza
# Kimenetek: ET: kétdimenziós cell-array. ET{i,j} az i. FNLISTA-beli fájlnak a j. referencia
#             adatbázisbeli hanganyaggal való illesztésével előálló euklidészi távolság-sorozat.
#            MIN_INDEX: az ET-vel megegyező indexelésű cell-array, az ET-ben etcsucs() függvénnyel
#             megtalált csúcsokat tartalmazza.
for i=1:length(FNLISTA)
  Y=wavread(FNLISTA{i});
  for j=1:length(REFDB);
    
    il=illeszt(REFDB{j}(KEZD*16000+1:(KEZD+HOSSZ)*16000+1+length(Y)), Y);
    z=8;
    ET{i,j}=il;
    MIN_INDEX{i,j}=etcsucs(ET{i,j});
  end
end