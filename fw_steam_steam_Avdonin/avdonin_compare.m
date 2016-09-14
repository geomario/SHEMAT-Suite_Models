
% load numerical solution
hinfo = hdf5info('petsc_coeff_10_1000000000.00000.h5');
coeff = hdf5read(hinfo.GroupHierarchy.Datasets(1));

% load analytical solution
x=25:25:1000;
Tana = load('T_ana2.txt');
figure;
plot(x,Tana,'k');
hold on
plot(x,coeff(1,:),'gx-.');
axis([0 500 160 170])
legend('Analytical','SHEMAT-Suite','Location','SouthEast');
xlabel('Extension [m]');
ylabel('Temperature [^{\circ}C]');
stil
print('-dpng','-r600','Avdonin.png')
