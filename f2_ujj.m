# 2. feladat
############
# Ujjlenyomat alapú feldolgozás

# Szükséges fájlok, eszközök elérhetőségének biztosítása:
f2_wav_nevek
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scriptek');

# Referencia adatbázisok elkészítése
clear tks;
tks{1}='zeneszamok/lvnp.wav';
fingerprint_ref(tks);

# Teszt hangminták illesztése
rt=fingerprint_illeszt(test);

# Eredmények megjelenítése 
for i=1:8
  Y=wavread(test{i});
  figure;
  illustrate_match(Y, 16000, tks, 1, test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  str=sprintf('Illeszkedő landmarkok száma: %d, \nEgyezés ideje: %.3f mp', rt{i}(2), rt{i}(3)*0.032);
  text(0.5, 1,['\bf ' str],'HorizontalAlignment','center','VerticalAlignment', 'top')
  colormap(1-gray);
end
