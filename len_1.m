n1 = 3000; %row unit number
n2 = 3000; %column unit number
f = 10e-3;
unit_x = 0.3e-6;
unit_y = 0.3e-6;
freq = 0.375e15;
dis = f;
disp_x = 1e-2;
disp_y = 1e-2;
inc = 1e-3;

C = 3e8;
k = 2*pi*freq/C;

[X , Y] = meshgrid((-round(n1/2):round(n1/2))*unit_x , ...
    (-round(n1/2):round(n1/2))*unit_x);

P = k*((X.^2 + Y.^2 + f^2).^0.5 - f);
P = rem(P,2*pi);

disp('The size of the len is:')
disp([n1*unit_x,n2*unit_y])

figure
imagesc(P)
colorbar
title('Phase Distribution')

%%
rec_x = -disp_x/2:inc:disp_x/2;
rec_y = -disp_y/2:inc:disp_y/2;
intensity = zeros(length(rec_x),length(rec_y));
figure
for i = 1:length(rec_x)
    for j = 1:length(rec_y)
%         intensity(i,j) = sum(sum(real(unit_x*unit_y*exp(1i*( k*(dis^2 +...
%             (X-rec_x(i)).^2 + (Y-rec_y(j)).^2).^0.5))./(4*pi*(dis^2+...
%             (X-rec_x(i)).^2 + (Y-rec_y(j)).^2)))));
        disp(sum(sum(real(unit_x*unit_y*exp(1i*( k*(dis^2 +...
            (X-rec_x(i)).^2 + (Y-rec_y(j)).^2).^0.5))./(4*pi*(dis^2+...
            (X-rec_x(i)).^2 + (Y-rec_y(j)).^2))))))
        colorbar
        pause(0.1)
    end
end

figure
imagesc(intensity)
colorbar

