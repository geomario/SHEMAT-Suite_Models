clear all
close all
depth = 50:100:2000;
delx = [500.000000000000e-003
    207.106781186548e-003
    292.893218813452e-003
    414.213562373095e-003
    585.786437626905e-003
    828.427124746190e-003
    1.17157287525381e+000
    1.65685424949238e+000
    2.34314575050762e+000
    3.31370849898476e+000
    4.68629150101524e+000
    6.62741699796952e+000
    9.37258300203048e+000
    13.2548339959390e+000
    18.7451660040610e+000
    26.5096679918781e+000
    37.4903320081219e+000
    53.0193359837562e+000
    74.9806640162438e+000
    106.038671967512e+000
    149.961328032488e+000
    212.077343935025e+000
    299.922656064975e+000
    424.154687870049e+000
    599.845312129951e+000
    848.309375740098e+000];
I0=26;
delxa(1) = delx(1)/2;
for i = 2:I0
    delxa(i) = delxa(i-1) + .5*(delx(i-1)+delx(i));
    %delxa(i) =  sum(delx(1+i-1:I0));
end
time =     [86.4000000000000e-003
    864.000000000000e-003
    8.64000000000000e+000
    86.4000000000000e+000
    864.000000000000e+000
    1.72800000000000e+003
    2.59200000000000e+003
    3.45600000000000e+003
    4.32000000000000e+003
    5.18400000000000e+003
    6.04800000000000e+003
    6.91200000000000e+003
    7.77600000000000e+003
    8.64000000000000e+003
    21.6000000000000e+003
    43.2000000000000e+003
    64.8000000000000e+003
    86.4000000000000e+003
    108.000000000000e+003
    129.600000000000e+003
    151.200000000000e+003
    172.800000000000e+003];
index=1:22;
endindex=22;
for i = 1:endindex
    str=num2str(time(i),'%0.5f');
    if time(i)<1
        str=num2str(time(i),'%0.5f');
        str=str(2:end);
    end
    file=['petsc_x_', num2str(index(i),'%0.2d'), '_', str, '.h5'];
  hinfo = hdf5info(file);
  x = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  pres(i,:)=reshape(x(1,:,:,:),[26 1]);
  enth(i,:)=reshape(x(2,:,:,:),[26 1]);
  hinfo = hdf5info(['petsc_coeff_', num2str(index(i),'%0.2d'), '_', str, '.h5']);
  coeff = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  temp(i,:) = reshape(coeff(1,:,:,:),[26 1]);
  satn(i,:) = reshape(coeff(17,:,:,:),[26 1]);
end

cell = 5;
T2 = load('TOUGH2_Flash.txt');
pw = T2(cell:26:end,4);
Sw = T2(cell:26:end,7);
tempT2 = T2(cell:26:end,5);
%pw=load('TOUGH2_Pw_Flash.txt');
%Sw=load('TOUGH2_Sw_Flash.txt');
%tempT2=load('TOUGH2_Temp_Flash.txt');
pw=pw/1e6;
figure;
semilogx(time/delxa(cell)^2/86400,pw,'ko-.')
hold on
semilogx(time(1:endindex)/delxa(cell)^2/86400,pres(:,cell)/1e6,'gx-.')
hold on
xlabel('t r^{-2} [Days m^{-2}]');
ylabel('Pressure [MPa]');
legend('TOUGH2','SHEMAT-Suite','Location','SouthWest');
axis([1e-4 10 1.95 9])
stil;
axis tight
print('Pressure_TOUGH2.png','-dpng','-r600');


%-----------------------------------
% csv
% S_t = load('Sg-Time_flash_2c.csv');
figure;
semilogx(time/delxa(cell)^2/86400,Sw,'ko-.')
hold on
semilogx(time(1:endindex)/delxa(cell)^2/86400,1.0-satn(:,cell),'gx-')
% csv
% semilogx(S_t(:,1)/delxa(cell)^2/86400,1.0-S_t(:,2),'kv-')
xlabel('t/r^2 [Days/m^2]');
ylabel('Saturation []');
legend('TOUGH2','SHEMAT-Suite','Location','SouthWest');
axis([1e-4 10 0 1.1])
stil;
axis tight
print('Saturation_TOUGH2.png','-dpng','-r600');

figure;
semilogx(time/delxa(cell)^2/86400,tempT2,'ko-.')
hold on
semilogx(time(1:endindex)/delxa(cell)^2/86400,temp(:,cell),'gx-')
xlabel('t/r^2 [Days/m^2]');
ylabel('Temperature [?C]');
legend('TOUGH2','SHEMAT-Suite','Location','SouthWest');
axis([1e-4 10 200 300])
stil;
axis tight
print('Temperature_TOUGH2.png','-dpng','-r600');
% 
% figure;
% semilogx(time(1:endindex),enth(:,cell),'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Enthalpy [J/kg]');

% figure;
% plot(time/delxa(cell)^2/86400,pres(:,1)/1e6,'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Pressure [MPa]');
% figure;
% semilogx(time(1:endindex)/delxa(cell)^2/86400,temp(:,1),'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Temp [?C]');


% % Verify time integration
% figure;
% semilogx(time(1:endindex),pres(:,1)/1e6,'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Pressure [Pa]');
% hold on
% semilogx(time(1:endindex),9*exp(1e-8/phi*time(1:endindex)),'bx-');
% 
% for i=1:22
%     figure
% plot(delxa,pres(i,:)/1e6)
% xlabel('Distance [m]')
% ylabel('Pressure [MPa]');
% end