function [ED, MIN_INDEX]=mfcc_match(REFDB, FNLIST)
# Performs Euclidean distance based matching between the reference database of
# extracted features and the elements of the test wav filename list in all combinations, and
# searches for peaks on it.
# Inputs: REFDB: reference database in form of extracted features, created by the
#          mfcc_ref function
#         FNLIST: cell-array of the wav files to be tested
#
# Outputs:ED: 2 dimensional cell-array. ED{i,j} is the
#          Euclidean distance sequence produced by matching between
#          the i. element of FNLIST and
#          the j. element of reference database
#         MIN_INDEX: A cell-array that is indexed the same way as ED. Contains the
#          peaks found by edpeak() in ED
for i=1:length(FNLIST)
  Y=wavread(FNLIST{i});
  mfcc=melfcc(Y,16000)';
  for j=1:length(REFDB);
    ED{i,j}=match(REFDB{j}, mfcc);
    MIN_INDEX{i,j}=edpeak(ED{i,j});
  end
end
