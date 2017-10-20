clear all
close all

hinfo = hdf5info('petsc_x_06_1000000000.00000.h5');
x = hdf5read(hinfo.GroupHierarchy.Datasets(1));

% for i=1:500
%     disp(['1*',num2str(x(1,i)/1e6,20)]);
% end
% 
% pause
% 
for i=1:500
    disp(['1*',num2str(x(2,i),20)]);
end
    
% Concentration cCO2
% hinfo = hdf5info('petsc_coeff_06_1000000000.00000.h5');
% x = hdf5read(hinfo.GroupHierarchy.Datasets(1));
% x(1,:)'
% 
% plot(x(1,:))