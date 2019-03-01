# Exercise 2
############
# Processing based on waveform

# Loading filenames and necessary tools:
f2_wav_names
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scripts');

# Preparation of reference databases
clear tks;
tks{1}='tracks/lvnp.wav';
refdb_wav=wav_ref(tks);

# Matching test samples
[ed_wav, min_index_wav]=wav_match(refdb_wav, test, 4, 2);

# Displaying the results (All the code below is just for displaying.)
ed_wav_max=0;
for i=1:8
  if (max(ed_wav{i,1})>ed_wav_max)
    ed_wav_max=max(ed_wav{i,1});
  end
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (ed_wav{i,1}, '.-', 'linewidth', 2);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Waveform, automatic y axis','HorizontalAlignment','center','VerticalAlignment', 'top')
end

figure;
for i=1:8
  subplot (4,2,i);
  plot (ed_wav{i,1}, 'linewidth', 2);
  a=axis;
  a(3)=0;
  a(4)=ed_wav_max;
  axis(a);
  set (get (gca, "title"), "interpreter", "none");
  title(test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  text(0.5, 1,'\bf Waveform, fixeed y axis','HorizontalAlignment','center','VerticalAlignment', 'top')
end
