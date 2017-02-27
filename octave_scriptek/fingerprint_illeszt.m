function RT=fingerprint_illeszt(FNLISTA)
# Ujjlenyomat alapú illesztést végez a globális változóban tárolt referencia adatbázis elemei
# és a megadott wav-fájlnév lista elemei között, az összes kombinációban.
# Bemenetek: FNLISTA: felismerendő wav fájlneveket tartalmazó cell-array
# Kimenetek: RT: egydimenziós cell-array. ET{i} a match_query futtatásakor az i. FNLISTA-beli
#            fájllal adódó R tömb.
for i=1:length(FNLISTA)
  Y=wavread(FNLISTA{i});
  [R,L]=match_query(Y, 16000);
  RT{i}=R;
end