function [ Permittivity_static ] = Permittivity_static( number_of_layers,Permittivity_static_high,Permittivity_static_low)
%%  Setting relaxation time of layers
%  DESCRIPTIVE TEXT


Permittivity_static(number_of_layers)=0;

        for n=1:number_of_layers
            if ( mod(n,2) )                 % High condition 
            Permittivity_static(n)=Permittivity_static_high;        % for Si:  
            else 
            Permittivity_static(n)=Permittivity_static_low;         % low condition
            end                             % fof Ge: 
        end
end


