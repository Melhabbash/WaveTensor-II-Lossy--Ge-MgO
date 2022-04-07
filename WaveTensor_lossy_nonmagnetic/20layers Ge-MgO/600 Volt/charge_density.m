function [ q ] = charge_density( number_of_layers,Permittivity_static,Permittivity_Air,resistivity,d ,V)
%%  Calculation of charge density
 % Calculation of charge density
 %%
 % 
 % $$|q_j|=|\frac{{\varepsilon }_{j+1}{\rho }_{j+1}-{\varepsilon }_j{\rho }_j}{\sum^N_{i=1}{d_i{\rho }_i}}|$$
 % 

thicknessis_resistivity= sum(d.*resistivity);
q(1)=0;
q(number_of_layers+1)=0;

if(number_of_layers>1)
    for n=1:number_of_layers-1
    q(n+1)=V*( (  Permittivity_static(n+1)*Permittivity_Air*resistivity(n+1)- Permittivity_static(n)*Permittivity_Air*resistivity(n) )/thicknessis_resistivity);
    end
end

end

