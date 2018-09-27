% Compares analyitical to SHEMAT-Suite solution for Buckley-Leverett test
% case
hinfo = hdf5info('petsc_x_07_86400.00000.h5');
data = hdf5read(hinfo.GroupHierarchy.Datasets);
x = [.05:.1:10];
Sn = data(2,:);
Sw = 1-Sn;
figure;plot(bl(:,1),bl(:,2),'k-')
hold on
plot(x,Sw,'k--');

xlabel('x [m]');
ylabel('Se [-]');
legend('analytical solution', 'SHEMAT-Suite, dx=0.1 m');

stil;
print('-dpng','-r600','BL.png')