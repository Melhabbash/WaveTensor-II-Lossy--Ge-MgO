function [tag,number_of_layers,number_of_points,lambda_0,V,theta_0,refractive_index,resistivity,d,Permittivity_static,m_eff] = reading_data_1()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num='number_of_layers.txt';
number_of_layers = textread(num);
V=textread('Transverse_Voltage.txt');
theta_0 = textread('incident_angle.txt')*pi/180;
label(number_of_layers,(9+numel(num2str(number_of_layers))))=char(number_of_layers);
L(number_of_layers,(6+numel(num2str(number_of_layers))))=char(number_of_layers);
resist(number_of_layers,(17+numel(num2str(number_of_layers))))=char(number_of_layers);
thickness(number_of_layers,(15+numel(num2str(number_of_layers))))=char(number_of_layers);
dielectric_constant(number_of_layers,(25+numel(num2str(number_of_layers))))=char(number_of_layers);
effective_mass(number_of_layers,(20+numel(num2str(number_of_layers))))=char(number_of_layers);


for nl=1:number_of_layers
    
%     if (numel(num2str(number_of_layers))==1)
%         label(nl,:)=['tag_' mat2str(nl) '.txt'];
%         L(nl,:)=[ mat2str(nl) '.xlsx'];
%         resist(nl,:)=['resistivity_' mat2str(nl) '.txt'];
%         thickness(nl,:)=['thickness_' mat2str(nl) '.txt'];
%         dielectric_constant(nl,:)=['dielectric_constant_' mat2str(nl) '.txt'];
%         effective_mass(nl,:)=['effective_mass_' mat2str(nl) '.txt'];
%     end
%     
%     if (numel(num2str(number_of_layers))==2)
%         if (numel(num2str(nl))==1)
%             label(nl,:)=['tag_0' mat2str(nl) '.txt'];
%             L(nl,:)=[ '0' mat2str(nl) '.xlsx'];
%             resist(nl,:)=['resistivity_0' mat2str(nl) '.txt'];
%             thickness(nl,:)=['thickness_0' mat2str(nl) '.txt'];
%             dielectric_constant(nl,:)=['dielectric_constant_0' mat2str(nl) '.txt'];
%             effective_mass(nl,:)=['effective_mass_0' mat2str(nl) '.txt'];
%         end 
%         
%         if (numel(num2str(nl))==2)
%             label(nl,:)=['tag_' mat2str(nl) '.txt'];
%             L(nl,:)=[ mat2str(nl) '.xlsx'];
%             resist(nl,:)=['resistivity_' mat2str(nl) '.txt'];
%             thickness(nl,:)=['thickness_' mat2str(nl) '.txt'];
%             dielectric_constant(nl,:)=['dielectric_constant_' mat2str(nl) '.txt'];
%             effective_mass(nl,:)=['effective_mass_' mat2str(nl) '.txt'];
%             
%         end 
%     end
%     
%     if (numel(num2str(number_of_layers))==3)
        if (numel(num2str(nl))==1)
            label(nl,:)=['tag_00' mat2str(nl) '.txt'];
            L(nl,:)=['00' mat2str(nl) '.xlsx'];
            resist(nl,:)=['resistivity_00' mat2str(nl) '.txt'];
            thickness(nl,:)=['thickness_00' mat2str(nl) '.txt'];
            dielectric_constant(nl,:)=['dielectric_constant_00' mat2str(nl) '.txt'];
            effective_mass(nl,:)=['effective_mass_00' mat2str(nl) '.txt'];
        end 
        
        if (numel(num2str(nl))==2)
            label(nl,:)=['tag_0' mat2str(nl) '.txt'];
            L(nl,:)=['0' mat2str(nl) '.xlsx'];
            resist(nl,:)=['resistivity_0' mat2str(nl) '.txt'];
            thickness(nl,:)=['thickness_0' mat2str(nl) '.txt'];
            dielectric_constant(nl,:)=['dielectric_constant_0' mat2str(nl) '.txt'];
            effective_mass(nl,:)=['effective_mass_0' mat2str(nl) '.txt'];
        end 
        
        if (numel(num2str(nl))==3)
            label(nl,:)=['tag_' mat2str(nl) '.txt'];
            L(nl,:)=[ mat2str(nl) '.xlsx'];
            resist(nl,:)=['resistivity_' mat2str(nl) '.txt'];
            thickness(nl,:)=['thickness_' mat2str(nl) '.txt'];
            dielectric_constant(nl,:)=['dielectric_constant_' mat2str(nl) '.txt'];
            effective_mass(nl,:)=['effective_mass_' mat2str(nl) '.txt'];
        end 
%     end
    

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
refractive_index(:,number_of_layers+1)=1;

lambda_0=Layer(:,1,1);
[number_of_points,column]=size(lambda_0);

tag=char(nl);
tag='';

for nl=1:2
    
    tag=strcat(tag, Label(nl,:));
    
end
tag=strcat(tag,'-');
tag=char(tag);
end

