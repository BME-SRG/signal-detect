% Modified specgram to be compatible with matlab

function [S_r, f_r, t_r] = mspecgram(x, n = min(256, length(x)), Fs = 2, window = hanning(n), overlap = ceil(length(window)/2))

  if nargin < 1 || nargin > 5
    print_usage;
  ## make sure x is a vector
  elseif columns(x) != 1 && rows(x) != 1
    error ("mspecgram data must be a vector");
  endif
  if columns(x) != 1, x = x'; endif

  ## if only the window length is given, generate hanning window
  if length(window) == 1, window = hanning(window); endif

  ## should be extended to accept a vector of frequencies at which to
  ## evaluate the Fourier transform (via filterbank or chirp
  ## z-transform)
  if length(n)>1,
    error("mspecgram doesn't handle frequency vectors yet");
  endif

  if (length (x) <= length (window))
    error ("mspecgram: segment length must be less than the size of X");
  endif

  ## compute window offsets
  win_size = length(window);
  if (win_size > n)
    n = win_size;
    warning ("mspecgram fft size adjusted to %d", n);
  endif
  step = win_size - overlap;

  ## build matrix of windowed data slices
  offset = [ 1 : step : length(x)-win_size ];
  S = zeros (n, length(offset));
  for i=1:length(offset)
    S(1:win_size, i) = x(offset(i):offset(i)+win_size-1) .* window;
  endfor

  ## compute Fourier transform
  S = fft (S);

  ## extract the positive frequency components
  if rem(n,2)==1
      ret_n = (n+1)/2;
  else
      ret_n = n/2 + 1;
  endif
  S = S(1:ret_n, :);

  f = [0:ret_n]*Fs/n;
  t = offset/Fs;
  if nargout==0
    imagesc(t, f, 20*log10(abs(S)));
    set (gca (), "ydir", "normal");
    xlabel ("Time")
    ylabel ("Frequency")
  endif
  if nargout>0, S_r = S; endif
  if nargout>1, f_r = f; endif
  if nargout>2, t_r = t; endif

endfunction
