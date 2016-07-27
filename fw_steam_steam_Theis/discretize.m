
r=@(n)0.5*2.^((n-1)/2);
radius = r(1:26)';

delx(1) = radius(1);
for i=2:26
    delx(i) = radius(i)-radius(i-1);
end

delxa = 0.5*delx(1);
for i=2:26
    delxa(i) = delxa(i-1) + 0.5*(delx(i-1)+delx(i));
end

delxa'+0.25