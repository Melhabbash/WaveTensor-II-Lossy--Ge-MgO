  
  %% Initiation of the code, values, and constant
  % Setting values of some constants
clear all;
clc;
Permittivity_Air=8.85418781762039*10^-12;
Permeability_Air=4*pi*10^-7;
Intrinsic_impedance_Air=sqrt(Permeability_Air/Permittivity_Air);
m_0=9.10938356*10^-31; % free electron rest mass
% m_0=1;
electron_charge=1.602176565*10^-19; %%coulomblomb 

c=1/sqrt(Permittivity_Air*Permeability_Air);
h_blank=4.13566766225e-15;

%% Setting pathes of data  files
% Here you write the exact pathes for data files of: (1) High refractive index
% layer  (2) Low refractive index layer  (3) Transverse voltage  (4) Number of layers (5) Incident angle of light  
% h='MgO.xlsx';

num='number_of_layers.txt';

% l='CaF2.xlsx';
V='Transverse_Voltage.txt';

theta_0='incident_angle.txt';
d_1='thickness_1.txt';
d_2='thickness_2.txt';

resis_1='resistivity_1.txt';
resis_2='resistivity_2.txt';

Permittivity_static_1='dielectric_constant_1.txt';
Permittivity_static_2='dielectric_constant_2.txt';

m_1='effective_mass_1.txt';
m_2='effective_mass_2.txt';

[tag,number_of_layers,number_of_points,lambda_0,V,theta_0,refractive_index,resistivity,d,Permittivity_static,m_eff] = reading_data_1();

[ m_eff ] = effective_mass(number_of_layers,m_0,m_eff);


%[high,low,V,number_of_layers,number_of_points,theta_0,d_high,d_low,resis_high,resis_low,Permittivity_static_high,Permittivity_static_low,m_high,m_low] = reading_Data(h,l,V,num,theta_0,d_1,d_2,resis_1,resis_2,Permittivity_static_1,Permittivity_static_2,m_1,m_2)




% 
% 
%  for m=1:number_of_points
%     lambda_0(m)=high(m,1);
%  end
%  

%[ refractive_index ] = refractive( high,low,number_of_points,number_of_layers );
[ theta ] = theta( number_of_points,number_of_layers,theta_0,refractive_index );

%[ d ] = thickness( number_of_layers,d_high,d_low );
     
%[ resistivity ] = resistivity( number_of_layers,resis_high,resis_low);

[w] = angular_frequency(number_of_points,c,lambda_0);
a=size(theta_0);  
[ Permittivity ] = Permittivity( number_of_points,number_of_layers,Permittivity_Air,refractive_index,a);
     
[ Permeability ] = Permeability( number_of_points,number_of_layers,Permeability_Air,a);
%[ Permittivity_static ] = Permittivity_static( number_of_layers,Permittivity_static_high,Permittivity_static_low);
[ q ] = charge_density( number_of_layers,Permittivity_static,Permittivity_Air,resistivity,d ,V);
%[ m_eff ] = effective_mass(number_of_layers, m_0,m_high,m_low);
[ con ] = conductivity(number_of_points,number_of_layers,electron_charge,V, q,m_eff,w );
[ Intrinsic_impedance ] = intrinsic_impedance( number_of_points,number_of_layers,Intrinsic_impedance_Air,Permeability,Permittivity,a );
[wave_vector] = wave_vector (w,c,refractive_index, number_of_points, number_of_layers);
[ beta ] = Beta(  number_of_points,number_of_layers,wave_vector,d,theta );
[ B ] = Beta_Matrix( number_of_points,number_of_layers,beta );
[ rp ] = rp( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );
[ rs ] = rs( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );
[ tp ] = tp( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );
[ ts ] = ts( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );
[ Ap ] = A_p( number_of_points,number_of_layers,rp,tp );
[ As ] = A_s( number_of_points,number_of_layers,rs,ts );
[ Mp ] = Mp( number_of_points,number_of_layers,B,Ap,theta_0); 
[ Ms ] = Ms( number_of_points,number_of_layers,B,As,theta_0);
[ zp ] = Zp( number_of_points,Mp,theta_0);
[ zs ] = Zs( number_of_points,Ms,theta_0);
[ Reflection,tan_Reflection_phase,Reflection_phase] = reflection( number_of_points,zp,zs);
[ yp ] = Yp( number_of_points,Mp,theta_0);
[ ys ] = Ys( number_of_points,Ms,theta_0);
[Transmission,tan_Transmission_phase,Transmission_phase]=transmission (number_of_points,yp,ys);

theta_0_degree=theta_0(1)*180/pi;

Writting_Results(tag,number_of_layers,number_of_points,V,theta_0_degree,lambda_0,Mp,Ms,yp,zp,ys,zs,Reflection,tan_Reflection_phase,Reflection_phase,Transmission,tan_Transmission_phase,Transmission_phase,rp,tp,rs,ts,q,con);
Plotting_Rp_Rs_abs_phase(tag,lambda_0,number_of_layers,V,theta_0_degree,Reflection,tan_Reflection_phase,Reflection_phase,Transmission,tan_Transmission_phase,Transmission_phase); 

