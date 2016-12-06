clear all
close all
%theis
plot_time
stil
%legend('Theis','SHEMAT-Suite','TOUGH2');
%legend('SHEMAT-Suite','TOUGH2');
legend('TOUGH2','SHEMAT-Suite');
set(gca,'XTick'       , [1e-6 1e-4 1e-2 1e0 1e2])
print('-dpng','-r600','Theis.png')

