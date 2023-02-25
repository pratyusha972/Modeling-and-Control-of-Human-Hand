[Dof_arm, arminfo]=importrobot('harm_dosa');
[Dof_arm2, arminfo2]=importrobot('harm2');
[Dof_arm3, arminfo3]=importrobot('harm_inv');
%dosa
x = [];
y = [];
z = [];
r = 0.75;
angles = linspace(0, 11*pi, 300);
for id = 1:length(angles)
    x = [x,r*angles(id)*cos(angles(id))/100 + 0.8];
    y = [y,r*angles(id)*sin(angles(id))/100];
    z = [z,0.17];
end
plot(x,y)
b = [];
for i=1:1:300
    b = [b, i];
end

%window
n = 225;

coorx = 0.8; %fixed
coory_start = 0.3;
coory_end = -0.3;
dy = (coory_start - coory_end)/(sqrt(n)-1);
dz = dy;
coorz_start = 0.5 + 0.3;
coorz_end = 0.5 - 0.3;
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
            arrtime(1,county) = county;
            arry(1,county) = coory_start - (i-1)*dy;
            arrz(1,countz) = coorz_start - (j-1)*dy;
            county = county + 1;
            countz = countz + 1;
        end

    else
        for i=1:1:sqrt(n)
            arrx(1,county) = coorx;
            arrtime(1,county) = county;
            arry(1,county) = coory_end + (i-1)*dy;
            arrz(1,countz) = coorz_start - (j-1)*dy;
            county = county + 1;
            countz = countz + 1;
        end
    end
end
arrx_f = arrx(1:163);
arry_f = arry(1:163);
arrz_f = arrz(1:163);
arrtime_f = arrtime(1:163);
%plot(arry,arrz)
