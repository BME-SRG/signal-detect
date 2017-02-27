function specgram_plot (as)
image([1:size(as,1)], [size(as,2):-1:1], as(:,1:size(as,2))');