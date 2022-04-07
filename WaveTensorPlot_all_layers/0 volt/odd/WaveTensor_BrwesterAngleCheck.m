
  %% Initiation of the code, values, and constant
  % Setting values of some constants
clear all;
clc;
Permittivity_Air=8.85418781762039*10^-12;
Permeability_Air=4*pi*10^-7;
Intrinsic_impedance_Air=sqrt(Permeability_Air/Permittivity_Air);
m_0=9.10938356*10^-31; % free electron rest mass
% m_0=1;
electron_charge=1.602176565*10^-19;

c=1/sqrt(Permittivity_Air*Permeability_Air);
h_blank=4.13566766225e-15;

%% Setting pathes of data  files
% Here you write the exact pathes for data files of: (1) High refractive index
% layer  (2) Low refractive index layer  (3) Transverse voltage  (4) Number of layers (5) Incident angle of light  
% h='MgO.xlsx';



[tag,number_of_layers,number_of_points,lambda_0,V,theta_0,refractive_index,resistivity,d,Permittivity_static,m_eff] = reading_data_1();
[ m_eff ] = effective_mass(number_of_layers,m_0,m_eff);

 for j_0=1:1:9001
    theta_0(j_0,:)=((j_0-1)/100)*pi/180;
end
 

[ theta ] = theta( number_of_points,number_of_layers,theta_0,refractive_index );

[w] = angular_frequency(number_of_points,c,lambda_0);
a=size(theta_0);  
[ Permittivity ] = Permittivity( number_of_points,number_of_layers,Permittivity_Air,refractive_index,a);
     
[ Permeability ] = Permeability( number_of_points,number_of_layers,Permeability_Air,a);




 
[ q ] = charge_density( number_of_layers,Permittivity_static,Permittivity_Air,resistivity,d ,V);
[ con ] = conductivity(number_of_points,number_of_layers,electron_charge,V, q,m_eff,w );
[ Intrinsic_impedance ] = intrinsic_impedance( number_of_points,number_of_layers,Intrinsic_impedance_Air,Permeability,Permittivity,a );
[ beta ] = Beta(  number_of_points,number_of_layers,refractive_index,d,theta,lambda_0) ;
[ B ] = Beta_Matrix( number_of_points,number_of_layers,beta );
[ rp ] = rp( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );

[ rs ] = rs( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );
[ tp ] = tp( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );
[ ts ] = ts( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index );
[ Ap ] = A_p( number_of_points,number_of_layers,rp,tp );
[ As ] = A_s( number_of_points,number_of_layers,rs,ts );
[ Mp ] = Mp( number_of_points,number_of_layers,B,Ap,theta_0); 
[ Ms ] = Ms( number_of_points,number_of_layers,B,As,theta_0);
[ Rp_abs,Rp_phase ] = Rp_abs_phase( number_of_points,Mp,theta_0);
[ Rs_abs,Rs_phase ] = Rs_abs_phase( number_of_points,Ms,theta_0);
[ Reflection, Reflection_phase ] = reflection( number_of_points,Rp_abs,Rp_phase,Rs_abs,Rs_phase);
[ Tp_abs,Tp_phase ]=Tp_abs_phase ( number_of_points,Mp,theta_0);
[ Ts_abs,Ts_phase ]=Ts_abs_phase ( number_of_points,Ms,theta_0);
[Transmission,Transmission_phase]=transmission (number_of_points,Tp_abs,Tp_phase,Ts_abs,Ts_phase);

theta_0(:,:)=theta_0(:,:)*180/pi;
theta(:,:)=theta(:,:)*180/pi;


[Brewster_Angle_0, Angle_due_to_Brewster ] = Brewster(tag, number_of_points,number_of_layers,refractive_index,rp,rs,tp,ts,theta_0,theta );
