# Exercise 4
############

T=20  # This is the threshold parameter to be adjusted



# Loading necessary tools:
pkg load geometry signal;
addpath('rastamat', 'fingerprint', 'octave_scripts');


# Loading matrix of cross-test results
ct=csvread ('csv/cross_test_2000.csv' );

N=2000;

# Calculating true, false positive, negative counts
TP=sum(sum((ct>=T).*eye(N)))
FN=N-TP
FP=sum(sum((ct>=T).*(!eye(N))))
TN=N*(N-1)-FP

# Calculating metrics derived from the above counts
Accuracy=(TP+TN)/(TP+TN+FP+FN)
Recall=TP/(TP+FN)
Precision=TP/(TP+FP)
Fmeasure=2*Precision*Recall/(Precision+Recall)
