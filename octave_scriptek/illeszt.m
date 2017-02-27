function e = illeszt (nagy, kicsi)
#i=0;
for t=1:size(nagy, 1)-size(kicsi,1)+1
  e(t)=mean(distancePoints(nagy(t:t+size(kicsi,1)-1,:), kicsi, 'diag'));
#  i=i+1;
#  if i==1000
#    i=0;
#    t
#  end 
end