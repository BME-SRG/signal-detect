# 4. feladat
############

K=20  # ez az állítgatandó küszöb paraméter



# Szükséges eszközök elérhetőségének biztosítása:
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scriptek');


# Kereszt-teszt eredmény mátrix beolvasása
kt=csvread ('csv/kereszt_teszt_2000.csv' );

N=2000;

# true, false positive, negative darabszámok megszámolása
TP=sum(sum((kt>=K).*eye(N)))
FN=N-TP
FP=sum(sum((kt>=K).*(!eye(N))))
TN=N*(N-1)-FP

# A fentiekből származtatott mérőszámok kiszámítása
Accuracy=(TP+TN)/(TP+TN+FP+FN)
Recall=TP/(TP+FN)
Precision=TP/(TP+FP)
Fmeasure=2*Precision*Recall/(Precision+Recall)
