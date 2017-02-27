function amp_spec_plot (as)
image([1:size(as,1)], [size(as,2)/2:-1:1], as(:,1:size(as,2)/2)');