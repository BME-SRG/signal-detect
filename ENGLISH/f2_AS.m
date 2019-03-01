# Exercise 2
############
# Processing based on amplitude spectrum

# Loading filenames and necessary tools:
f2_wav_names
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scripts');

# Preparation of reference databases
clear tks;
tks{1}='tracks/lvnp.wav';
refdb_ampspec=ampspec_ref(tks);

# Matching test samples
[ed_ampspec, min_index_ampspec]=ampspec_match(refdb_ampspec, test);

# Displaying the results. (All the code below is just for displaying.)
ed_ampspec_max=0;
for i=1:8
  if (max(ed_ampspec{i,1})>ed_ampspec_max)
    ed_ampspec_max=max(ed_ampspec{i,1});
  end
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (ed_ampspec{i,1}, 'linewidth', 2);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Amplitude spectrum, automatic y axis','HorizontalAlignment','center','VerticalAlignment', 'top')
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (ed_ampspec{i,1}, 'linewidth', 2);
  a=axis;
  a(3)=0;
  a(4)=ed_ampspec_max;
  axis(a);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Amplitude spectrum, fixed y axis','HorizontalAlignment','center','VerticalAlignment', 'top')
end
