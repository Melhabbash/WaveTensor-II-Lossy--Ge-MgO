function [ refractive_index ] = refractive( high,low,number_of_points,number_of_layers )
%% Setting refractive index
 % Setting refractive index of layers


refractive_index(number_of_points,number_of_layers)=0;
 for n= 1:number_of_layers 
    for m=1:number_of_points
        if (mod(n,2))   %Odd condition    
        refractive_index(m,n)= high(m,2)+1i*high(m,3);
        else
        refractive_index(m,n)= low(m,2)+1i*low(m,3);
        end
    end
 end
 
 
 for m=1:number_of_points
        refractive_index(m,number_of_layers+1)= 1;
        
    end


end

