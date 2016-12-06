clear all
%close all
depth = 50:100:2000;
endindex = 40;
time = [1:endindex]'*365*86400;
index=(1:endindex);
pres=zeros(endindex,20);
enth=zeros(endindex,20);
for i = 1:endindex
  hinfo = hdf5info(['petsc_x_', num2str(index(i),'%0.2d'), '_', num2str(time(i)), '.00000.h5']);
  x = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  pres(i,:)=reshape(x(1,:,:,:),[20 1]);
  enth(i,:)=reshape(x(2,:,:,:),[20 1]);
  hinfo = hdf5info(['petsc_coeff_', num2str(index(i),'%0.2d'), '_', num2str(time(i)), '.00000.h5']);
  coeff = hdf5read(hinfo.GroupHierarchy.Datasets(1));
  temp(i,:) = reshape(coeff(1,:,:,:),[20 1]);
  satn(i,:) = reshape(coeff(17,:,:,:),[20 1]);
end


Pw = load('TOUGH2_Pw.txt');
Sw=load('TOUGH2_Sw.txt');
Time=load('TOUGH2_Time.txt');
Temp=load('TOUGH2_Temp.txt');
Sw1=Sw(1:20:end);
Sw5=Sw(5:20:end);
Sw10=Sw(10:20:end);
Pw1=Pw(1:20:end)/1e6;
Pw5=Pw(5:20:end)/1e6;
Pw10=Pw(10:20:end)/1e6;
T1=Temp(1:20:end);
T5=Temp(5:20:end);
T10=Temp(10:20:end);

t1=Time(1:20:end);
t1=t1/86400/365;


figure;
plot(1:endindex,pres(:,1)/1e6,'rx-.')
hold on
plot(1:endindex,pres(:,5)/1e6,'kx-.')
plot(1:endindex,pres(:,10)/1e6,'bx-.')

plot(t1,Pw1,'r');
hold on
plot(t1,Pw5,'k');
plot(t1,Pw10,'b');
xlabel('Time [years]');
ylabel('Pressure [MPa]');
legend('SHEMAT-Suite 1.95 km','SHEMAT-Suite 1.55 km', 'SHEMAT-Suite 1.05 km',...
       'TOUGH2 1.95 km','TOUGH2 1.55 km', 'TOUGH2 1.05 km',...
       'Location','NorthEast');
stil
%print('Pressure_TOUGH2.png','-dpng','-r600');

figure;
plot(1:endindex,1-satn(:,1),'rx-.')
hold on
plot(1:endindex,1-satn(:,5),'kx-.')
plot(1:endindex,1-satn(:,10),'bx-.')
plot(t1,Sw1,'r');
hold on
plot(t1,Sw5,'k');
plot(t1,Sw10,'b');

xlabel('Time [years]');
ylabel('Sw [-]');
legend('SHEMAT-Suite 1.95 km','SHEMAT-Suite 1.55 km', 'SHEMAT-Suite 1.05 km',...
       'TOUGH2 1.95 km','TOUGH2 1.55 km', 'TOUGH2 1.05 km',...
       'Location','SouthWest');
stil
%print('Saturation_TOUGH2.png','-dpng','-r600');

figure;
plot(1:endindex,temp(:,1),'rx-.')
hold on
plot(1:endindex,temp(:,5),'kx-.')
plot(1:endindex,temp(:,10),'bx-.')
plot(t1,T1,'r');
hold on
plot(t1,T5,'k');
plot(t1,T10,'b');
xlabel('Time [years]');
legend('SHEMAT 1.95 km','SHEMAT 1.55 km', 'SHEMAT 1.05 km',...
       'TOUGH2 1.95 km','TOUGH2 1.55 km', 'TOUGH2 1.05 km',...
       'Location','NorthWest');
ylabel('T [^{\circ}C]');
stil
%print('Temperature_TOUGH2.png','-dpng','-r600');
