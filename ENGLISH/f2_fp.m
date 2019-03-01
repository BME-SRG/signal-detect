# Exercise 2
############
# Processing based on fingerprinting

# Loading filenames and necessary tools:
f2_wav_names
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scripts');

# Preparation of reference databases
clear tks;
tks{1}='tracks/lvnp.wav';
fingerprint_ref(tks);

# Matching test samples
rt=fingerprint_match(test);

# Displaying results
for i=1:8
  Y=wavread(test{i});
  figure;
  illustrate_match(Y, 16000, tks, 1, test{i});
  ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
  if (size(rt{i},1)==0)
    str=sprintf('Number of matching landmarks: 0');
  else
    str=sprintf('Number of matching landmarks: %d, \nTime of match: %.3f s', rt{i}(2), rt{i}(3)*0.032);
  end
  text(0.5, 1,['\bf ' str],'HorizontalAlignment','center','VerticalAlignment', 'top')
  colormap(1-gray);
end
