angle = pi/5;
angles = 0:angle:pi*2;
pole = exp(complex(0, 1)*angles);

[s,e]=size(pole);
new_poles = [];
for a=1:e
    if real(pole(a)) < 0
        new_poles(a) = pole(a);
        disp(pole(a))
    end
end
    
%plot(real(pole), imag(pole))
[num, den] = zp2tf([], new_poles, 1);
res = tf(num, den);
pzmap(res);
%pzmap(pole)

