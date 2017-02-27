# 1. feladat
############

# Írja be a referencia zeneszám fájl nevét:
ref_fn='ide';

# Írja be a keresendő zeneszám fájl nevét:
test_fn='ide';




# Szükséges eszközök elérhetőségének biztosítása:
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scriptek');

# Referencia előfeldolgozása
# Amplitúdóspektrum:
Y=wavread(ref_fn);
#plot (Y); kbhit;
AS=abs(specgram(Y, 512)');
#specgram_plot(AS); kbhit;


# MFCC:
MFCC=melfcc(Y, 16000)';


# Ujjlenyomat
clear_hashtable;
clear tks;
tks{1}=ref_fn;
add_tracks(tks);


# Illesztendő minta előfeldolgozása:
# Amplitúdóspektrum:
Y_test=wavread(test_fn);
#plot (Y_test); kbhit;
AS_test=abs(specgram(Y_test, 512)');
#specgram_plot (AS_test); kbhit;

# MFCC:
MFCC_test=melfcc(Y_test, 16000)';


# Illesztés
# Hullámforma, röviden
E_y=illeszt(Y(16000*4:16000*11), Y_test);
#plot(E_y, '.-'); kbhit;

# Amplitúdóspektrum
E_as=illeszt(AS, AS_test);
#plot(E_as, '.-'); kbhit;

# MFCC
E_mfcc=illeszt(MFCC, MFCC_test);
#plot(E_mfcc, '.-'); kbhit;

# Ujjlenyomat
[R,L]=match_query(Y_test, 16000);

#illustrate_match(Y_test, 16000, tks); colormap(1-gray);
