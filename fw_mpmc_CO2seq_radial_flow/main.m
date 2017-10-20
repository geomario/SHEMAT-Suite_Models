clear all
%close all
mesh=load('mesh.csv');

x=mesh(end-434:end,2);
pres=mesh(end-434:end,4);
satn = mesh(end-434:end,6);
xH20n = mesh(end-434:end,9);
xCO2w = mesh(end-434:end,10);

x(1) = 0.3;

xx=logspace(log10(0.3),log10(1e3),201);
x(2:201)=xx(2:end);
xx=logspace(log10(1e3),log10(3e3),101);
x(202:301) = xx(2:end);
xx=logspace(log10(3e3),log10(1e4),101);
x(302:401)=xx(2:end);
xx=logspace(log10(1e4),log10(1e5),35);
x(402:435)=xx(2:end);

csize(1) = x(1);
for i=1:434
  csize(i+1) = x(i+1)-x(i);
end

% TOUGH2
% Pressure plot
figure
semilogx(x.^2/8.64e8,pres/1e6);
xlabel('Similarity variable R^2/t [m^2/s]')
ylabel('Pressure [MPa]');
title('Pressure');
stil;

% Saturation plot
figure
semilogx(x.^2/8.64e8,satn);
xlabel('Similarity variable R^2/t [m^2/s]')
ylabel('Saturation [-]');
title('CO2 Saturation');
stil;
axis([1e-10 1e5 0 1])

% % Dissolved CO2 in water plot
% figure
% semilogx(x.^2/8.64e8,xCO2w);
% xlabel('Similarity variable R^2/t [m^2/s]')
% ylabel('x^{CO2}_w [?]');
% title('CO2 dissolved in water');
% stil;
% 
% % Dissolved H2O in gas plot
% figure
% semilogx(x.^2/8.64e8,xH20n);
% xlabel('Similarity variable R^2/t [m^2/s]')
% ylabel('x^{H2O}_n [?]');
% title('H2O dissolved in gas');
% stil;

% SHEMAT-Suite
hinfo = hdf5info('petsc_x_75_864000000.00000.h5');
x_shem = hdf5read(hinfo.GroupHierarchy.Datasets(1));
pres_shem = x_shem(1,:);
satn_shem = x_shem(2,:);

% Pressure plot
figure(1)
hold on
semilogx(x.^2/8.64e8,pres_shem/1e6,'r');
xlabel('Similarity variable R^2/t [m^2/s]')
ylabel('Pressure [MPa]');
title('Pressure');
stil;

% Saturation plot
figure(2)
hold on
semilogx(x.^2/8.64e8,satn_shem,'r');
xlabel('Similarity variable R^2/t [m^2/s]')
ylabel('Saturation [-]');
title('CO2 Saturation');
stil;
axis([1e-10 1e5 0 1])