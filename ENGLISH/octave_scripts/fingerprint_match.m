function RT=fingerprint_match(FNLIST)
# Performs fingerprint based matching between the elements of the reference database
# and elements of the list of wav files, in all combination. The reference database is
# stored in a global variable.
# Inputs: FNLIST: cell-array of wav files to be tested
# Outputs: RT: 1 dimensional cell-array.
#              ED{i} is the R array returned by match_query when running with the i. file of FNLIST
for i=1:length(FNLIST)
  Y=wavread(FNLIST{i});
  [R,L]=match_query(Y, 16000);
  RT{i}=R;
end
