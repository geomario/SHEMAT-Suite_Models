% clear all
% close all
depth = 50:100:2000;
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
index=1:24;
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

pw=load('TOUGH2_Pw_Theis.txt');
pw=pw/1e6;
cell = 1;
figure(1);
semilogx(time(1:endindex)/0.5^2/86400,pw,'ko-.')
hold on
semilogx(time(1:endindex)/0.5^2/86400,pres(:,cell)/1e6,'gx-.')
hold on
xlabel('t r^{-2} [Days m^{-2}]');
ylabel('Pressure [MPa]');
axis([1e-6 1e2 6.5 9])

% figure;
% semilogx(time(1:endindex),satn(:,cell),'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Saturation []');
% 
% figure;
% semilogx(time(1:endindex),temp(:,cell),'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Temperature [?C]');
% 
% figure;
% semilogx(time(1:endindex),enth(:,cell),'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Enthalpy [J/kg]');

% figure;
% plot(time/0.5^2/86400,pres(:,1)/1e6,'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Pressure [MPa]');
% figure;
% semilogx(time(1:endindex)/0.5^2/86400,temp(:,1),'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Temp [?C]');


% % Verify time integration
% figure;
% semilogx(time(1:endindex),pres(:,1)/1e6,'go-')
% xlabel('t/r^2 [Days/m^2]');
% ylabel('Pressure [Pa]');
% hold on
% semilogx(time(1:endindex),9*exp(1e-8/phi*time(1:endindex)),'bx-');