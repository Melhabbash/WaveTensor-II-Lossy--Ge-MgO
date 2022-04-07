function [ Permeability ] = Permeability( number_of_points,number_of_layers,Permeability_Air,a )
        
for j_0=1:1:a(1)
    for m=1:number_of_points
        for n=1:number_of_layers
            Permeability(j_0,m,n)=Permeability_Air;
        end
    end 
end

end


