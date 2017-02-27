# 2. feladat
############
# Amplitúdóspektrum alapú feldolgozás

# Szükséges fájlok, eszközök elérhetőségének biztosítása:
f2_wav_nevek
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scriptek');

# Referencia adatbázisok elkészítése
clear tks;
tks{1}='zeneszamok/lvnp.wav';
refdb_ampspec=ampspec_ref(tks);

# Teszt hangminták illesztése
[et_ampspec, min_index_ampspec]=ampspec_illeszt(refdb_ampspec, test);

# Eredmények megjelenítése (Igen, innentől már az egész csak a megjelenítés.)
et_ampspec_max=0;
for i=1:8
  if (max(et_ampspec{i,1})>et_ampspec_max)
    et_ampspec_max=max(et_ampspec{i,1});
  end
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (et_ampspec{i,1}, 'linewidth', 2);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Amplitúdóspektrum, automatikus y tengely','HorizontalAlignment','center','VerticalAlignment', 'top')
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (et_ampspec{i,1}, 'linewidth', 2);
  a=axis;
  a(3)=0;
  a(4)=et_ampspec_max;
  axis(a);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Amplitúdóspektrum, egységes y tengely','HorizontalAlignment','center','VerticalAlignment', 'top')
end
