function [ d ] = thickness( number_of_layers,d_high,d_low )
%%  Setting thickness of layers
 % Setting thickness of layers


d(number_of_layers)=0;

 for n= 1: number_of_layers
    if ( mod(n,2) )   % Odd condition 
    d(n)=d_high;
    else 
    d(n)=d_low;  % Even condition
    end 
 end
end

