clear all
close all

lstr = {'Injector (TOUGH2)', 'Center (5,5) (TOUGH2)', 'Producer (TOUGH2)', 'Injector (SHEMAT-Suite)', 'Center (5,5) (SHEMAT-Suite)', 'Producer (SHEMAT-Suite)'};
foft=load('FOFT');
time = foft(:,2);
time=time/365/86400;

inj_pres = foft(:,4);
inj_temp = foft(:,5);
inj_satn = foft(:,6);

center_pres = foft(:,9);
center_temp = foft(:,10);
center_satn = foft(:,11);

prod_pres = foft(:,14);
prod_temp = foft(:,15);
prod_satn = foft(:,16);

% Pressure
hp=figure;
plot(time,inj_pres/1e6,'b.-');
hold on
plot(time,center_pres/1e6,'g.-');
plot(time,prod_pres/1e6,'r.-');
xlabel('Time [years]');
ylabel('Pressure [MPa]');
legend('Injector', 'Center (5,5)', 'Producer');
title('Pressure evolution');

% Temperature
hT=figure;
plot(time,inj_temp,'b.-');
hold on
plot(time,center_temp,'g.-');
plot(time,prod_temp,'r.-');
xlabel('Time [years]');
ylabel('Temperature [?C]');
legend('Injector', 'Center (5,5)', 'Producer');
title('Temperature evolution');

% Saturation
hS=figure;
plot(time,inj_satn,'b.-');
hold on
plot(time,center_satn,'g.-');
plot(time,prod_satn,'r.-');
xlabel('Time [years]');
ylabel('Saturation [-]');
title('Saturation evolution');

%============================================================

time = [3.10000e+3
    1.02300e+5
    5.11900e+5
    1.12630e+6
    3.17430e+6
    7.27030e+6
    1.62854e+7
    3.26655e+7
    5.88799e+7
    1.17862e+8
    2.48934e+8
    3.14470e+8
    3.80006e+8
    4.45542e+8
    5.11078e+8
    5.76614e+8
    6.42150e+8
    7.07686e+8
    7.73222e+8
    8.91187e+8
    1.02226e+9
    1.15183e+9];

index=1:24;
endindex=22; %% SHould be changed depending on the time-steps run to plot untill then
for i = 1:endindex
    str=num2str(time(i),'%0.5f');
    if time(i)<1
        str=num2str(time(i),'%0.5f');
        str=str(2:end);
    end
    file=['petsc_x_', num2str(index(i),'%0.2d'), '_', str, '.h5'];
  hinfo = hdf5info(file);
  x = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  pres(i,:,:)=reshape(x(1,:,:,:),[10 10]);
  enth(i,:,:)=reshape(x(2,:,:,:),[10 10]);
  hinfo = hdf5info(['petsc_coeff_', num2str(index(i),'%0.2d'), '_', str, '.h5']);
  coeff = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  temp(i,:,:) = reshape(coeff(1,:,:,:),[10 10]);
  satn(i,:,:) = reshape(coeff(17,:,:,:),[10 10]);
end

time = time/86400/365;
%SHEMAT Pressure Data
figure(1);
plot(time(1:endindex),pres(:,1,1)/1e6,'bo--')
hold on
plot(time(1:endindex),pres(:,5,5)/1e6,'go--')
plot(time(1:endindex),pres(:,10,10)/1e6,'ro--')
axis([0 time(endindex) 5 10])
axis tight
legend(lstr);

%SHEMAT Temperature Data 
figure(2);
plot(time(1:endindex),temp(:,1,1),'bo--')
hold on
plot(time(1:endindex),temp(:,5,5),'go--')
plot(time(1:endindex),temp(:,10,10),'ro--')
axis([0 time(endindex) 275 305])
axis tight
legend(lstr);

%SHEMAT Saturation Data
figure(3);
plot(time(1:endindex), satn(:,1,1),'bo--')
hold on
plot(time(1:endindex), satn(:,5,5),'go--')
plot(time(1:endindex), satn(:,10,10),'ro--')
axis([0 time(endindex) 0 1])    
axis tight
legend(lstr);

figure;
plot(temp(:,1,1),pres(:,1,1)/1e6,'b-')
hold on
plot(temp(:,5,5),pres(:,5,5)/1e6,'g-')
plot(temp(:,10,10),pres(:,10,10)/1e6,'r-')
xlabel('Temperature [{^\circ}C]')
ylabel('Pressure [MPa]');
set(gca,'Ydir','reverse')
legend('Injector', 'Center', 'Producer','Location','NorthWest');

