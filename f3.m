# 3. feladat
############

clear test;
# A következő sorba írja a kipróbálandó hangminta fájl nevét:
test{1}='ide';
# És most probálja ki, megtalálják-e az illesztő módszerek!



# Szükséges eszközök elérhetőségének biztosítása:
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scriptek');

# Referencia adatbázis (1 szám) elkészítése
clear tks;
tks{1}='zeneszamok/lvnp.wav';
refdb_mfcc=mfcc_ref(tks);
fingerprint_ref(tks);

# Teszt hangminták illesztése
# MFCC illesztés
[et_mfcc, min_index_mfcc]=mfcc_illeszt(refdb_mfcc, test);
# Ujjlenyomatos illesztés
rt=fingerprint_illeszt(test);

# Eredmények megjelenítése ábrákon és szövegesen
disp ("MFCC-s illesztés találata:");
if (min_index_mfcc{1}==0)
  disp ("Nincs találat");
else
  disp (min_index_mfcc{1});
end

disp ("Ujjlenyomatos illesztés eredménye (index, időben helyes illeszkedő landmarkok száma, egyezés ideje, összes illeszkedő landmark száma):");
if (rt{1,1}(2)<3)
  disp ("Nincs találat");
else
  disp (rt{1});
end

figure 1;
subplot(1,1,1);
plot (et_mfcc{1});
Y=wavread(test{1});
figure 2;
if (size(rt{1,1},1)>0)
  illustrate_match(Y, 16000, tks);
  colormap(1-gray);
end
