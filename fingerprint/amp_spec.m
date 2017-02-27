function as = amp_spec(y, fftpont, lepes)

ham=hamming(fftpont);

for i=0:floor((length(y)-fftpont)/lepes)
  fr=y(i*lepes+1:i*lepes+fftpont);
  fr=fr.*ham;
  sp=fft(fr,fftpont);
  as(i+1,:)=abs(sp)';
end