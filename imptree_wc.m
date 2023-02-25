%[Dof_arm, arminfo]=importrobot('harm');
[Dof_arm_wc, arminfo_wc]=importrobot('harm2_wc');
%[Dof_arm3, arminfo3]=importrobot('harm3');
%dosa
x = [];
y = [];
z = [];
r = 0.75;
angles = linspace(0, 11*pi, 150);
for id = 1:length(angles)
    x = [x,r*angles(id)*cos(angles(id))/100 + 1.2];
    y = [y,r*angles(id)*sin(angles(id))/100];
    z = [z,0.35];
end
plot(x,y)
b = [];
for i=1:1:150
    b = [b, i];
end

%window
n = 225;

coorx = 0.7; %fixed
coory_start = 0.3;
coory_end = -0.3;
dy = (coory_start - coory_end)/(sqrt(n)-1);
dz = dy;
coorz_start = 0.5 + 0.2;
coorz_end = 0.5 - 0.2;
arrx = zeros(1,n);
arry = zeros(1,n);
arrz = zeros(1,n);
arrtime = zeros(1,n);
county = 1;
countz = 1;
for j=1:1:sqrt(n)
    if(mod(j,2) == 1)
        for i=1:1:sqrt(n)
            arrx(1,county) = coorx;
            arrtime(1,county) = county-1;
            arry(1,county) = coory_start - (i-1)*dy;
            arrz(1,countz) = coorz_start - (j-1)*dy;
            county = county + 1;
            countz = countz + 1;
        end

    else
        for i=1:1:sqrt(n)
            arrx(1,county) = coorx;
            arrtime(1,county) = county-1;
            arry(1,county) = coory_end + (i-1)*dy;
            arrz(1,countz) = coorz_start - (j-1)*dy;
            county = county + 1;
            countz = countz + 1;
        end
    end
end
plot(arry,arrz)
