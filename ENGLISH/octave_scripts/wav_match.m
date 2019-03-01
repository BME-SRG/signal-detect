function [ED, MIN_INDEX]=wav_match(REFDB, FNLIST, START, LENGTH)
# Performs Euclidean distance based matching between the waveform reference
# database and the elements of the test wav filename list in all combinations, and
# searches for peaks on it.
# Inputs: REFDB: reference database of waveforms, created by the
#          wav_ref function
#         FNLIST: cell-array of the wav files to be tested
#         START: Start of the matching, measured in seconds from start of the reference file
#         LENGTH: Length of the window sliding of the matching process
#
# Outputs:ED: 2 dimensional cell-array. ED{i,j} is the
#          Euclidean distance sequence produced by matching between
#          the i. element of FNLIST and
#          the j. element of reference database
#         MIN_INDEX: A cell-array that is indexed the same way as ED. Contains the
#          peaks found by edpeak() in ED.
for i=1:length(FNLIST)
  Y=wavread(FNLIST{i});
  for j=1:length(REFDB);
    
    mat=match(REFDB{j}(START*16000+1:(START+LENGTH)*16000+1+length(Y)), Y);
    z=8;
    ED{i,j}=mat;
    MIN_INDEX{i,j}=edpeak(ED{i,j});
  end
end
