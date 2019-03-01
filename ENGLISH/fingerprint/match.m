function e = match (big, small)
#i=0;
for t=1:size(big, 1)-size(small,1)+1
  e(t)=mean(distancePoints(big(t:t+size(small,1)-1,:), small, 'diag'));
#  i=i+1;
#  if i==1000
#    i=0;
#    t
#  end 
end
