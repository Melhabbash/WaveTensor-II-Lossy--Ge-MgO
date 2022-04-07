


clear all;
clc;
num='number_of_layers.txt';
number_of_layers = textread(num);
V=textread('Transverse_Voltage.txt');
theta_0 = textread('incident_angle.txt');
label(number_of_layers,(8+numel(num2str(number_of_layers))))=char(number_of_layers);
L(number_of_layers,(5+numel(num2str(number_of_layers))))=char(number_of_layers);
resist(number_of_layers,(16+numel(num2str(number_of_layers))))=char(number_of_layers);
thickness(number_of_layers,(14+numel(num2str(number_of_layers))))=char(number_of_layers);
dielectric_constant(number_of_layers,(24+numel(num2str(number_of_layers))))=char(number_of_layers);
effective_mass(number_of_layers,(19+numel(num2str(number_of_layers))))=char(number_of_layers);


for nl=1:number_of_layers
    label(nl,:)=['tag_' mat2str(nl) '.txt'];
    L(nl,:)=[mat2str(nl) '.xlsx'];
    resist(nl,:)=['resistivity_' mat2str(nl) '.txt'];
    thickness(nl,:)=['thickness_' mat2str(nl) '.txt'];
    dielectric_constant(nl,:)=['dielectric_constant_' mat2str(nl) '.txt'];
    effective_mass(nl,:)=['effective_mass_' mat2str(nl) '.txt'];
  
end 


for nl=1:number_of_layers
    Label(nl,:)=string(textread(label(nl,:),'%q')');
    Layer(:,:,nl)=xlsread(L(nl,:));
    refractive_index(:,nl)=Layer(:,2,nl)+i*Layer(:,3,nl);
    resistivity(nl,:)=textread(resist(nl,:));
    d(nl,:)=textread(thickness(nl,:));
    Permittivity_static(nl,:)=textread(dielectric_constant(nl,:));
    m_eff(nl,:)=textread(effective_mass(nl,:));
    
    
end
lambda_0=Layer(:,1,1);
[number_of_points,column]=size(lambda_0);
tag=char(nl);
tag='';

for nl=1:number_of_layers
    
    tag=strcat(tag,'-', Label(nl,:),'-');
    
end

tag=char(tag);
lambda_0=Layer(:,1,:);
[number_of_points,column]=size(lambda_0);

