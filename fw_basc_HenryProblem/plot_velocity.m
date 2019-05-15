% Author:       Ariel T Thomas
% Project:      NJ Deep offshore groundwater
% Purpose:      Plot velocity field and other 2D images from SHEMAT
% simulations

clc 
close all

% Read in data file
conc      = dlmread('col_tracer1_bmSim6.txt');
tracer    = dlmread('col_tracer1_bmSim6.txt');
head      = dlmread('col_head_bmSim6.txt');
data      = dlmread('henry_final_bmSim6_vectors.txt');
u = data(1:end,1);
v = data(1:end,2);
w = data(1:end,3);
grid = dlmread('henry_XYZ.txt');
X = grid(1:end,1);
Y = grid(1:end,2);
Z = grid(1:end,3);

% Define Model Dimensions
n_i = 100;
n_j = 1;
n_k = 50;

% Model Discretization
d_i = 0.02;
d_j = 0.02;
d_k = 0.02;


%% Velocity Plots

%Plots Z-X axis

x_dist = 2;
z_dist = 1;
x_range = 100;
z_range = 50;
x = linspace(0,x_dist,x_range);
z = linspace(0,z_dist,z_range);

figure
ax1 = axes;
quiver3(X,Y,Z,u,v,w,1)
xlabel('X')
ylabel('Y')
zlabel('Z')
set(ax1,'Zdir','normal')
title('\fontsize{18}Top View')
% top view
view(0,90)

% front view
figure
ax2 = axes;
X1=X(1:2:end)
Z1=Z(1:2:end)
u1=u(1:2:end)
w1=w(1:2:end)
q = quiver(X1,Z1,u1,w1,5);
xlabel('X ','FontSize',16)
ylabel('Z ','FontSize',16)
%zlabel('Z')
set(ax2,'Ydir','reverse')
title('\fontsize{18}Fluid Velocity Field')
pbaspect([2 1 1])

%view(0,0)


%HEAD

val_head  = reshape(head,[x_range,z_range]);
val_head  = val_head';

figure
ax3=axes;
[C1,h1] = contourf(x,z,val_head,10);
colormap(winter);
colormap(flipud(colormap))
clabel(C1,h1,'Color','white','LabelSpacing',1000,'FontSize',8);
%caxis([0 1])
pbaspect([2 1 1])
title('\fontsize{18} Hydraulic Head')
xlabel('X (m)','FontSize',16)
ylabel('Z (m)','FontSize',16)
set(ax3,'Ydir','normal')
cb1 = colorbar
cb1.Label.String = '\fontsize{12} Hydraulic Head(m)';


%% TRACER
saline=dlmread('salinity_scale.txt');
init_trac = 0.61;
t         = max(tracer);
tracer    = (tracer(1:end)/t)*100;
val_conc  = reshape(tracer,[x_range,z_range]);
val_conc  = val_conc';
%val_conc  = (val_conc/norm(val_conc,2))*100

figure
ax4 = axes;
[C2,h2] = contourf(x,z,val_conc);
h2.LevelList=[0 10 20 30 40 50 60 70 80 90];
clabel(C2,'manual','Color','red','LabelSpacing',1500,'FontSize',20)
colormap(saline)
% colormap(flipud(colormap))

%caxis([0 0.1])
pbaspect([2 1 1])
title({'Modified Henry Problem';'    '},'FontSize',22);
xlabel('X (m)','FontSize',22)
ylabel('Z (m)','FontSize',22)
set(ax4,'Ydir','normal')
ax4.FontSize =18;
cb2 = colorbar;
caxis([0 100])
cb2.Label.String = '\fontsize{18} Normalized Salt Conc.(%)';
hold on
xpos=ones(length(z),1);
plot(0.75*xpos,z,'r--','LineWidth',2)
text(0.74,1.05,'i','FontSize',14)
plot(1.05*xpos,z,'r--','LineWidth',2)
text(1.04,1.05,'ii','FontSize',14)
plot(1.35*xpos,z,'r--','LineWidth',2)
text(1.34,1.05,'iii','FontSize',14)
plot(1.65*xpos,z,'r--','LineWidth',2)
text(1.64,1.05,'iv','FontSize',14)
plot(1.95*xpos,z,'r--','LineWidth',2)
text(1.94,1.05,'v','FontSize',14)


%% Compare Results
sol = dlmread('analytic_sol.txt');
sol = [sol(1:end,1)/100,sol(:,2:end)];
sol_z = sol(:,1);
% retrieve shemat results

conc    = conc(1:end)./max(conc);
conc    = (reshape(conc,[x_range,z_range]))';
conc    = flipud(conc);
Shem_x_75  = (conc([1:5:end end],37)+conc([1:5:end end],38))/2;
Shem_x_105 = (conc([1:5:end end],52)+conc([1:5:end end],53))/2;
Shem_x_135 = (conc([1:5:end end],67)+conc([1:5:end end],68))/2;
Shem_x_165 = (conc([1:5:end end],82)+conc([1:5:end end],83))/2;
Shem_x_195 = (conc([1:5:end end],97)+conc([1:5:end end],98))/2;
delta_C = [sqrt(mean((Shem_x_75 - sol(:,2)).^2)) ...
           sqrt(mean((Shem_x_105 - sol(:,3)).^2)) ...
           sqrt(mean((Shem_x_135 - sol(:,4)).^2)) ...
           sqrt(mean((Shem_x_165 - sol(:,5)).^2)) ...
           sqrt(mean((Shem_x_195 - sol(:,6)).^2))];
%%
%import analytical solutions from Simpson and Clement 2004

x_dom = [75 105 135 165 195];
figure
ax5 = axes;
sim = plot(sol(:,2),sol_z,'ks','MarkerFaceColor','black','MarkerSize',15);
pbaspect([1 1 1])
set(ax5,'Xdir','normal')
ax5.FontSize = 18;
title({'\fontsize{20} Salinity Profiles ';'     '});
xlabel('Concentration (-)','FontSize',22);
ylabel('Z (m)','FontSize',22)

hold on
plot(sol(:,3),sol_z,'ks','MarkerFaceColor','black','MarkerSize',15);
plot(sol(:,4),sol_z,'ks','MarkerFaceColor','black','MarkerSize',15);
plot(sol(:,5),sol_z,'ks','MarkerFaceColor','black','MarkerSize',15);
plot(sol(:,6),sol_z,'ks','MarkerFaceColor','black','MarkerSize',15);
shem = plot(Shem_x_75,sol_z,'r--*','MarkerSize',12,'LineWidth',2);
plot(Shem_x_105,sol_z,'r--*','MarkerSize',12,'LineWidth',2);
plot(Shem_x_135,sol_z,'r--*','MarkerSize',12,'LineWidth',2);
plot(Shem_x_165,sol_z,'r--*','MarkerSize',12,'LineWidth',2);
plot(Shem_x_195,sol_z,'r--*','MarkerSize',12,'LineWidth',2);

l5 = legend ([sim,shem],'Semi-Analytical solution','SHEMAT-Suite Solution','Location','southoutside');
l5.FontSize = 18;

figure 

plot(x_dom,delta_C,'r--*','MarkerSize',15)
title('\fontsize{18} RMS Error')
xlabel('Horizontal Distance (cm)','FontSize',2216)
ylabel('RMS error (-)','FontSize',22)


