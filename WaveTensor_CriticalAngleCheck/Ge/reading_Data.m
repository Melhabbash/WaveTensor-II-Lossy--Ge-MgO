function [high,low,V,number_of_layers,number_of_points,theta_0,d_high,d_low,resis_high,resis_low,Permittivity_static_high,Permittivity_static_low,m_high,m_low] = reading_Data(h,l,V,num,theta_0,d_1,d_2,resis_1,resis_2,Permittivity_static_1,Permittivity_static_2,m_1,m_2)

%% Reading Initial Data
% A function called "reading_Data" is used to read: (1) Excel file contains
% data of high refractive index layer (see ...)  (2) Excel file contains
% data of low refractive index layer (see ...) (3) Text file contains the
% value of transverse voltage across multilayer structure  (4) Text file
% contains the number of layers of multilayer structure (5) Text file contains the
% incident angle of light on multilayer structure.


high=xlsread(h);
low=xlsread(l);
V=textread(V);


num='number_of_layers.txt';
number_of_layers = textread(num);
[number_of_points,column]=size(high);

theta_0 = textread(theta_0);
d_high = textread(d_1);
d_low = textread(d_2);
resis_high= textread(resis_1);
resis_low= textread(resis_2);
Permittivity_static_high= textread(Permittivity_static_1);
Permittivity_static_low= textread(Permittivity_static_2);
m_high=textread(m_1);
m_low=textread(m_2);



end

