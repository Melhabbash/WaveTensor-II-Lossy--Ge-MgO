function [ con ] = conductivity(number_of_points,number_of_layers,electron_charge,V, q,m_eff,w )

%% Calculation of conductivity
% Calculation of conductivity

%%
% 
% $$\sigma_j=-i\frac{eV}{m^*\omega }|\frac{{\varepsilon }_{j+1}{\rho }_{j+1}-{\varepsilon }_j{\rho }_j}{\sum^N_{i=1}{d_i{\rho }_i}}$$
%
for m=1:number_of_points
con(m,1)=0;
con(m,number_of_layers+1)=0;
end

if(number_of_layers>1)
for m=1:number_of_points
    for n=1:number_of_layers-1
        con(m,n+1)=-i*( electron_charge* abs(q(n+1)))/( m_eff(n)*w(m)) ;                        
    end   
end
end

end

