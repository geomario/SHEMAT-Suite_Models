clear all
%close all

radial = true;

b=100;  % reservoir thickness [m]
Kr=1e-12; % permeability [m^2]
t=10^9; % time [s]
Km=2.0; % heat conductivity of wet rock
cr=1e3; % heat capacity rock
rhor=2500; % density rock
cw=4335.081692; % heat capacity water at 165 ?C and 5 MPa
rhow=905.15; % Density of water at 165 ?C and 5 MPa
muw=1.65793e-4; % Viscosity of water at 165 ?C and 5 MPa
phi=0.2; % Porosity
rhocm = phi*rhow*cw+(1-phi)*rhor*cr;  %Density times heat capacity of the water filled medium
tau = 4*Km*t/(rhocm*b^2);
alpha = (Kr*cr*rhor/(Km*rhocm))^.5;


if radial
  % Avdonin solution for radial coordinates
  Q = 10/rhow; % injection rate [m^3/s]
  nu = Q*cw*rhow/(4*pi*b*Km);
  myfun = @(r,s) exp(-(2.*r./b).^2./(4.*tau.*s)).*erfc(alpha.*s.*sqrt(tau)./(2.*sqrt(1-s)))./s.^(nu+1);
  myint = @(r)1./gamma(nu)*((2.*r./b).^2./(4.*tau)).^nu.*integral(@(s)myfun(r,s),0,1,'Waypoints',0)
  %,'AbsTol',1e-24,'RelTol',1e-12);
else
  % cartesian coordinates
  Q = 1.5380832715948038E-006;
  gamma = Q*cw*rhow/(4*Km);
  myfun=@(x,s) exp(-(s.*gamma.*(tau).^0.5 - x./(b.*s.*(tau).^0.5)).^2)./s.^2; 
  myint = @(x)2.*x./b./(pi.*tau)^0.5.*integral(@(s)myfun(x,s),0,1,'Waypoints',0);
  %,'AbsTol',1e-24,'RelTol',1e-12);
end

figure;
Ti=160; % injection temperature
T0=170; % initial temperature
T = @(x)myint(x)*(Ti-T0)+T0;
fplot(@(x)T(x),[0,500],'k-');
axis([0 500 160 170])
hold on

% Temp, rhof, rhon, visf, visn, por, log10(kx), log10(ky), log10(kz), uindex, sigx, sigy, sigz, cplx, cply, cplz
hinfo = hdf5info('petsc_coeff_10_1000000000.00000.h5');
coeff = hdf5read(hinfo.GroupHierarchy.Datasets(1));

x=25:25:1000;
plot(x,coeff(1,:),'gx-.');
legend('Avdonin','SHEMAT-Suite','Location','SouthEast');
xlabel('Extension [m]');
ylabel('Temperature [^{\circ}C]');
for i=1:40
  val=x(i);
  TT(i)=T(val);
end
stil
save('T_ana2.txt','TT','-ascii','-double');

Tout=load('Tout');
%plot(Tout(:,1),Tout(:,4),'b-')
