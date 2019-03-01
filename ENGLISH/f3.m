# Exercise 3
############

clear test;
# Write the name of the test wav file:
test{1}='here';
# Now check if the matching methods can find it!



# Loading necessary tools:
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scripts');

# Preparation of reference database (1 song)
clear tks;
tks{1}='tracks/lvnp.wav';
refdb_mfcc=mfcc_ref(tks);
fingerprint_ref(tks);

# Matching test samples
# MFCC matching
[ed_mfcc, min_index_mfcc]=mfcc_match(refdb_mfcc, test);
# Fingerprint matching
rt=fingerprint_match(test);

# Displaying the resuts on figures and text
disp ("MFCC match:");
if (min_index_mfcc{1}==0)
  disp ("No match");
else
  disp (min_index_mfcc{1});
end

disp ("Fingerprint match (index, number of landmarks with matches on correct time, time of match, number of all matching landmarks):");
if ((size(rt{1,1},1)==0)||(rt{1,1}(2)<3))
  disp ("No match");
else
  disp (rt{1});
end

figure 1;
subplot(1,1,1);
plot (ed_mfcc{1});
Y=wavread(test{1});
figure 2;
if (size(rt{1,1},1)>0)
  illustrate_match(Y, 16000, tks);
  colormap(1-gray);
end
