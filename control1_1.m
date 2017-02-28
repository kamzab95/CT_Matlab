%a
angle = pi/5;
angles = 0:angle:pi*2;
pole = exp(complex(0, 1)*angles);

[s,e]=size(pole);
itr = 1;
new_poles = [];
for a=1:e
    if real(pole(a)) < 0
        new_poles(itr) = pole(a);
        itr = itr+1;
    end
end
new_poles
figure(3);
plot(real(pole), imag(pole));
[num, den] = zp2tf([], new_poles, 1);
res = tf(num, den);
pzmap(res);

%b
figure(2);
step(res);

%test

