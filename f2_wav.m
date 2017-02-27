# 2. feladat
############
# Hullámforma alapú feldolgozás

# Szükséges fájlok, eszközök elérhetőségének biztosítása:
f2_wav_nevek
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scriptek');

# Referencia adatbázisok elkészítése
clear tks;
tks{1}='zeneszamok/lvnp.wav';
refdb_wav=wav_ref(tks);

# Teszt hangminták illesztése
[et_wav, min_index_wav]=wav_illeszt(refdb_wav, test, 4, 2);

# Eredmények megjelenítése
et_wav_max=0;
for i=1:8
  if (max(et_wav{i,1})>et_wav_max)
    et_wav_max=max(et_wav{i,1});
  end
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (et_wav{i,1}, '.-', 'linewidth', 2);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Hullámforma, automatikus y tengely','HorizontalAlignment','center','VerticalAlignment', 'top')
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (et_wav{i,1}, 'linewidth', 2);
  a=axis;
  a(3)=0;
  a(4)=et_wav_max;
  axis(a);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Hullámforma, egységes y tengely','HorizontalAlignment','center','VerticalAlignment', 'top')
end
