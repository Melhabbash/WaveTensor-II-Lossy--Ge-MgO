function [wave_vector] = wave_vector (w,c,refractive_index, number_of_points, number_of_layers)

for n= 1:number_of_layers 
    for m=1:number_of_points
        wave_vector(m,n) = w(m)*refractive_index(m,n)/c;
    end
 end




end

