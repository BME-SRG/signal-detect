function fingerprint_ref(FNLISTA)
# A FNLISTA cell array-ben adott wav fájl lista elemeit ujjlenyomatozza, és berakja a globális
# változóként létező hash táblába
clear_hashtable;
add_tracks(FNLISTA);
