clear all
close all
prod=load('producer_Brikowski.PNG.dat');
inj=load('injector_Brikowski.PNG.dat');
twop=load('twophase_cell_Brikowski.PNG.dat');
plot(prod(:,1),prod(:,2),'r');
hold on
plot(inj(:,1),inj(:,2),'b');
plot(twop(:,1),twop(:,2),'g');
axis([100 500 0 30]);
set(gca,'Ydir','reverse')
ylabel('Pressure [MPa]');
xlabel('Temperature [?C]');
stil