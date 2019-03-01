function I = edpeak(ED);
# Searches for a peak (minimum) that is steep enough in the vector of Euclidean distances
# created by match() function.
# The return value is the index of the minimum in the ED array, or 0 if no steep peak found.

K=15;   # A parameter that is related to the "definiteness" of the peak to be found.
        # A maximum value of the 2nd derivative is considered to be a hit, if the value
        # of the 2nd derivative is at least K times greater than the variance of the
        # 2nd derivative.
dt=10;	# The minimum of the original function will be searched in the dt wide interval of the
        # found peak of 2nd derivative.

d=ED(:,1:end-1)-ED(:,2:end);
add=abs(d(:,1:end-1)-d(:,2:end));
#subplot(3,1,1);
#plot(et,'.-');
#subplot(3,1,2);
#plot(add, '.-');
a=conv(add>std(add)*K,ones(1,2*dt+1))>0;
#subplot(3,1,3);
#plot(a,'.-');
if (sum(a)==0)
  I=0;
else
  [m,I]=min(ED+((a(dt+1:size(ED,2)+dt).*ED)==0)*max(ED));
end


#d=et(:,1:end-1)-et(:,2:end);
#add=abs(d(:,1:end-1)-d(:,2:end));
#a=conv(add>std(add)*K,ones(1,2*dt+1))>0;
#[m,i]=min(et+((a(dt+1:size(et,2)+dt).*et)==0)*max(add));
