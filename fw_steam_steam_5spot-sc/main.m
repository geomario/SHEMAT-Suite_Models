clear all
close all

% Digitalized data from Brikowski
prod=load('Brikowski_data/producer_Brikowski.PNG.dat');
inj=load('Brikowski_data/injector_Brikowski.PNG.dat');
twop=load('Brikowski_data/twophase_cell_Brikowski.PNG.dat');

lstr = {'Injector (SHEMAT-Suite)', 'Cell (3,3) (SHEMAT-Suite)', 'Producer (SHEMAT-Suite)'};
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
plot(time(1:endindex),pres(:,3,3)/1e6,'go--')
plot(time(1:endindex),pres(:,10,10)/1e6,'ro--')
axis([0 time(endindex) 5 10])
axis tight
legend(lstr);
xlabel('Time [years]');
ylabel('Pressure [MPa]');
title('Pressure evolution');

%SHEMAT Temperature Data 
figure(2);
plot(time(1:endindex),temp(:,1,1),'bo--')
hold on
plot(time(1:endindex),temp(:,3,3),'go--')
plot(time(1:endindex),temp(:,10,10),'ro--')
axis([0 time(endindex) 275 305])
axis tight
legend(lstr);
xlabel('Time [years]');
ylabel('Temperature [?C]');
title('Temperature evolution');


%SHEMAT Saturation Data
figure(3);
plot(time(1:endindex), satn(:,1,1),'bo--')
hold on
plot(time(1:endindex), satn(:,3,3),'go--')
plot(time(1:endindex), satn(:,10,10),'ro--')
axis([0 time(endindex) 0 1])    
axis tight
legend(lstr);
xlabel('Time [years]');
ylabel('Saturation [-]');
title('Saturation evolution');

load('psatot.txt')
T=psatot(:,1);
P=psatot(:,2);


figure(4);
h=plot(T,P,'k-');
set(h,'LineWidth',1);
hold on
h=plot(temp(:,1,1),pres(:,1,1)/1e6,'bx');
set(h,'LineWidth',2);
h=plot(temp(:,3,3),pres(:,3,3)/1e6,'gx');
set(h,'LineWidth',2);
h=plot(temp(:,10,10),pres(:,10,10)/1e6,'rx');
set(h,'LineWidth',2);
xlabel('Temperature [{^\circ}C]')
ylabel('Pressure [MPa]');
set(gca,'Ydir','reverse')

% Brikowski data
plot(inj(:,1),inj(:,2),'b');
plot(twop(:,1),twop(:,2),'g');
plot(prod(:,1),prod(:,2),'r');
axis([100 500 0 30]);
legend('Two-phase envelope', 'Injector (SHEMAT-Suite)', 'Cell (3,3) (SHEMAT-Suite)', 'Producer (SHEMAT-Suite)','Injector (Brikowski)', 'Cell (x,x) (Brikowski)', 'Producer (Brikowski)', 'Location','NorthEast');
stil

%print('-dpng','-r600','Brikowski2.png')

