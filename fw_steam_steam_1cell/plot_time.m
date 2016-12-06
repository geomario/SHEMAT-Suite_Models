clear all
close all
depth = 50:100:2000;
time =     [1.000000000000000e+02
     3.000000000000000e+02
     6.999999999999999e+02
     1.500000000000000e+03
     3.100000000000000e+03
     6.300000000000000e+03
     1.270000000000000e+04
     2.550000000000000e+04
     5.110000000000001e+04
     1.023000000000000e+05
     2.047000000000000e+05
     4.094999999999999e+05
     8.191000000000001e+05
     1.638300000000000e+06
     3.276700000000000e+06
     6.553500000000000e+06
     1.310710000000000e+07
     2.621430000000000e+07
     5.242870000000000e+07
     1.048580000000000e+08
     1.572860000000000e+08
     2.097150000000000e+08
     2.621440000000000e+08
     3.145730000000000e+08
     3.670019999999999e+08
     4.194300000000000e+08
     4.718590000000000e+08
     5.242880000000000e+08
     5.767170000000000e+08
     6.291460000000000e+08
     6.815740000000000e+08
     7.00000000000000e+08];
index=1:29;
endindex=29;
for i = 1:endindex
    str=num2str(time(i),'%0.5f');
    if time(i)<1
        str=num2str(time(i),'%0.5f');
        str=str(2:end);
    end
  file=['petsc_x_', num2str(index(i),'%0.2d'), '_', str, '.h5'];
  hinfo = hdf5info(file);
  x = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  pres(i,:)=reshape(x(1,:,:,:),[1 1]);
  enth(i,:)=reshape(x(2,:,:,:),[1 1]);
  hinfo = hdf5info(['petsc_coeff_', num2str(index(i),'%0.2d'), '_', str, '.h5']);
  coeff = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  temp(i,:) = reshape(coeff(1,:,:,:),[1 1]);
  satn(i,:) = reshape(coeff(17,:,:,:),[1 1]);
end

foft=load('FOFT');
time_T2=foft(:,2)/86400/365;
pres_T2=foft(:,4);
temp_T2=foft(:,5);
satn_T2 = foft(:,6);
pres_T2=pres_T2/1e6;
cell = 1;

time=time/86400/365;
time = time(1:endindex);
pres=pres/1e6;

figure
plot(time_T2,pres_T2,'ko-.');
hold on
plot(time,pres,'gx-')
title('Pressure')
xlabel('Time [years]')
ylabel('Pressure [MPa]')
legend('TOUGH2','SHEMAT-Suite')
stil;
print('Pressure.png','-dpng','-r600');

figure
plot(time_T2,temp_T2,'ko-.')
hold on
plot(time,temp,'gx-')
title('Temperature')
xlabel('Time [years]')
ylabel('Temperature [?C]')
legend('TOUGH2','SHEMAT-Suite')
stil;
print('Temperature.png','-dpng','-r600');

figure
plot(time_T2,satn_T2,'ko-.')
hold on
plot(time,satn,'gx-')
title('Saturation')
xlabel('Time [years]');
ylabel('Saturation [-]');
legend('TOUGH2','SHEMAT-Suite','Location','SouthEast');
stil;
print('Saturation.png','-dpng','-r600');

figure
plot(pres_T2,temp_T2,'ko-.');
hold on
plot(pres,temp,'gx-')
title('p-T')
xlabel('Pressure [MPa]')
ylabel('Temperature [?C]')
legend('TOUGH2','SHEMAT-Suite','Location','SouthEast')
stil;
print('p-T.png','-dpng','-r600');

figure
plot(enth,satn,'gx-')
title('h-Sn')
xlabel('Enthalpy [kJ/kg]');
ylabel('Saturation [-]');
legend('SHEMAT-Suite');
stil;