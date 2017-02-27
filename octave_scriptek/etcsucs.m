function I = etcsucs(ET);
# Az illeszt() függvénnyel készült euklidészi távolság vektorban elég meredek csúcsot (minimumot) keres.
# A visszatérési érték a megtalált minimumhely indexe az ET tömbben. Ha nincs találat, akkor 0-t ad vissza.

K=15;    # A megtalálható csúcs "határozottságára" vonatkozó paraméter. 
         # Akkor tekinti találatnak a 2. deriváltbeli maximumot, ha a 2. derivált értéke leglább K-szor
         # nagyobb, mint a 2. derivált szórása.
         # Ezt esetleg érdemes lehet hangolni.
dt=10;   # A megtalált 2. deriváltbeli csúcs ekkora környezetében keresi az eredeti függvény minimumát.

d=ET(:,1:end-1)-ET(:,2:end);
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
  [m,I]=min(ET+((a(dt+1:size(ET,2)+dt).*ET)==0)*max(ET));
end


#d=et(:,1:end-1)-et(:,2:end);
#add=abs(d(:,1:end-1)-d(:,2:end));
#a=conv(add>std(add)*K,ones(1,2*dt+1))>0;
#[m,i]=min(et+((a(dt+1:size(et,2)+dt).*et)==0)*max(add));
