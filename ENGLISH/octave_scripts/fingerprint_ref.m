function fingerprint_ref(FNLIST)
# Creates the fingerprints for the wav files given in the FNLIST cell-array,
# and adds them to the hash table, which is a global variable.
clear_hashtable;
add_tracks(FNLIST);
