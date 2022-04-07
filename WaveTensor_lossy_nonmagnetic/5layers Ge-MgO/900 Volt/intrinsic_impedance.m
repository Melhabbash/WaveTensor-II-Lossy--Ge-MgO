function [ Intrinsic_impedance ] = intrinsic_impedance( number_of_points,number_of_layers,Intrinsic_impedance_Air,Permeability,Permittivity,a )

% Intrinsic_impedance(:,1)=sqrt(Permeability_Air/Permittivity_Air);    
for j_0=1:1:a(1)
    for n= 1:number_of_layers     
        for m=1:number_of_points 
        Intrinsic_impedance(j_0,m,n)=sqrt(Permeability(j_0,m,n)/Permittivity(j_0,m,n));      
        end
    end
end
for j_0=1:1:a(1)
    for m=1:number_of_points    
        Intrinsic_impedance(j_0,m,number_of_layers+1)=Intrinsic_impedance_Air;    
    end
end


end

