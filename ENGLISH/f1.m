# Exercise 1
############

# Write the name of the reference song file:
ref_fn='here';

# Write the name of the test song file:
test_fn='here';




# Loading necessary tools:
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scripts');

# Preprocessing reference
# Amplitude spectrum:
Y=wavread(ref_fn);
#plot (Y); kbhit;
AS=abs(specgram(Y, 512)');
#specgram_plot(AS); kbhit;


# MFCC:
MFCC=melfcc(Y, 16000)';


# Fingerprint
clear_hashtable;
clear tks;
tks{1}=ref_fn;
add_tracks(tks);


# Preprocessing test sample:
# Amplitude spectrum:
Y_test=wavread(test_fn);
#plot (Y_test); kbhit;
AS_test=abs(specgram(Y_test, 512)');
#specgram_plot (AS_test); kbhit;

# MFCC:
MFCC_test=melfcc(Y_test, 16000)';


# Matching
# Waveform matching on a short part
E_y=match(Y(16000*4:16000*11), Y_test);
#plot(E_y, '.-'); kbhit;

# Amplitude spectrum
E_as=match(AS, AS_test);
#plot(E_as, '.-'); kbhit;

# MFCC
E_mfcc=match(MFCC, MFCC_test);
#plot(E_mfcc, '.-'); kbhit;

# Fingerprint
[R,L]=match_query(Y_test, 16000);

#illustrate_match(Y_test, 16000, tks); colormap(1-gray);
