function [ resistivity ] = resistivity( number_of_layers,resis_high,resis_low)
%% Setting resistivity of layers
    % Setting resistivity of layers


resistivity(number_of_layers)=0;

        for n=1:number_of_layers
            if ( mod(n,2) )                 % High condition 
            resistivity(n)=resis_high;        % for Si:  
            else 
            resistivity(n)=resis_low;     % low condition
            end                             % fof Ge: 
        end
end

