clear all
close all

% Swr=0.3, Snr=0.05
%mesh=load('mesh2.csv');
% Swr=Snr=0
mesh=load('fault.csv');
time=mesh(:,1);

color = 'b';

I=find(time==1e7);

x=mesh(I(1:end-2),2);
pres=mesh(I(1:end-2),3);
satn = mesh(I(1:end-2),5);
xH20n = mesh(I(1:end-2),8);
xCO2w = mesh(I(1:end-2),9);

% TOUGH2
% Pressure plot
figure(1)
hold on
plot(pres/1e6,x,color);
ylabel('Elevation [m]')
xlabel('Pressure [MPa]');
title('Pressure');
stil;

% Saturation plot
figure(2)
hold on
plot(x,satn,color);
xlabel('Elevation [m]')
ylabel('Saturation [-]');
title('CO2 Saturation');
axis([0 500 0 1]);
stil;

% Dissolved CO2 in water plot
figure(3)
hold on
plot(x,xCO2w,color);
xlabel('Elevation [m]')
ylabel('x^{CO2}_w [?]');
title('CO2 dissolved in water');
axis([0 500 0 0.1]);
stil;

% Dissolved H2O in gas plot
figure(4)
hold on
semilogy(x,xH20n,color);
xlabel('Elevation [m]')
ylabel('x^{H2O}_n [?]');
title('H2O dissolved in gas');
axis([0 500 0 1]);
stil;

% I=find(time==1e7);
% 
% x=mesh(I(1:end-2),2);
% pres=mesh(I(1:end-2),3);
% satn = mesh(I(1:end-2),5);
% xH20n = mesh(I(1:end-2),8);
% xCO2w = mesh(I(1:end-2),9);
% 
% % TOUGH2
% % Pressure plot
% figure(1)
% hold on
% plot(pres/1e6,x,'r');
% ylabel('Elevation [m]')
% xlabel('Pressure [MPa]');
% title('Pressure');
% legend('10^9 s', '10^7 s');
% stil;
% 
% % Saturation plot
% figure(2)
% hold on
% plot(x,satn,'r');
% xlabel('Elevation [m]')
% ylabel('Saturation [-]');
% title('CO2 Saturation');
% axis([0 500 0 1]);
% legend('10^9 s', '10^7 s');
% stil;


hinfo = hdf5info('petsc_coeff_03_10000000.00000.h5');
coeff_shem = hdf5read(hinfo.GroupHierarchy.Datasets(1));
pres_shem = coeff_shem(1,1:end-2);
satn_shem = coeff_shem(3,1:end-2);
cCO2_shem=coeff_shem(4,1:end-2);                                                                                                                    
cH2O_shem=coeff_shem(5,1:end-2);                                                                                                                    


% Pressure plot
figure(1)
hold on
plot(pres_shem/1e6,x,'k');
ylabel('Elevation [m]')
xlabel('Pressure [MPa]');
title('Pressure');
stil;

% Saturation plot
figure(2)
hold on
plot(x,satn_shem,'k');
xlabel('Elevation [m]')
ylabel('Saturation [-]');
title('CO2 Saturation');
axis([0 500 0 1]);
stil;

% Dissolved CO2 in water plot
figure(3)
hold on
plot(x,cCO2_shem,'k');
axis([0 500 0 0.1]);
stil;

% Dissolved H2O in gas plot
figure(4)
hold on
semilogy(x,cH2O_shem,'k');
axis([0 500 0 1]);
stil;
