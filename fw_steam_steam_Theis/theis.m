%clear all
%close all

%Florian
%t=36000;
t = [1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 .2 .3 .4 .5 .6 .7 .8 0.9 1.0 2.5]*86400;

! 9 MPa and 260 ?C
K=10e-15;
rho=1000;
rho=789.122;
mu=1e-3;
mu=0.000102944;
g=9.81;
d=100;
% Florian example
%T = 1E-5;
T=K*rho*g/mu*d;
alpha = 1e-10;
alpha=0;
beta = 4.4e-10;
beta = 9.92066e-10;
phi=0.2;
Ss = rho*g*(alpha+phi*beta);
% Florian
%S = 0.0001
S = Ss*d;
% Florian
%Q = 1E-5;
Q = 14/rho;
% Florian
%r=linspace(1,100,1000);
r = 0.5;

h = 100.;

u=r.^2*S./(4*T*t);
w= -0.5772-log(u)+u-u.^2./(2*factorial(2)) + u.^3/(3*factorial(3)) - u.^4/(4*factorial(4));
s = Q./(4*pi*T)*w;

% Florian
%figure
%plot(r,s,'bo');
%pause

% figure;
% semilogx(t/86400/r^2,s,'bo-');
% xlabel('t/r^2 [days/m^2]')
% ylabel('Drawdown [m]')

figure(1);
semilogx(t/86400/r^2,(9e6-s*rho*g)/1e6,'ko-');
hold on
xlabel('t/r^2 [days/m^2]')
ylabel('Pressure [MPa]')