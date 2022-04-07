function [ Permittivity ] = Permittivity( number_of_points,number_of_layers,Permittivity_Air,refractive_index,a )

for j_0=1:1:a(1)
    for m=1:number_of_points
        for n=1:number_of_layers
%             for non-magnetic , lossy material::  
%             Permittivity = Permittivity_Air*refractive_index(m,n)*refractive_index(m,n))*refractive_index(m,n)
              Permittivity(j_0,m,n)=Permittivity_Air*refractive_index(m,n)*refractive_index(m,n);
        end
    end
end
    
    
end












