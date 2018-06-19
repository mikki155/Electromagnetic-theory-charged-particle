dstep = 0.01;
x = [];
z = [];
R = [];
Bx = [];
Bz = [];
j = 1;

for i = -3:dstep:3
    x(end+1) = i;
    z(end+1) = i;
    R(end+1) = sqrt(x(j)^2 + z(j)^2);
    
    if R(j) == 0
        Bx(end+1) = 0;
        Bz(end+1) = 0;
    else
        Bx(end+1) = (3*x(j)*z(j))/R(j)^5;
        Bz(end+1) = (3*z(j)^2 - R(j)^2)/R(j)^5;
    end

    j = j + 1;
end

[X, Z] = meshgrid(x, z);
R = meshgrid(R);
[Bx, Bz] = meshgrid(Bx, Bz);


quiver(X, Z, Bx, Bz);
axis([-3 3 -3 3]);