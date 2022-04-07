function [ m_eff ] = effective_mass(number_of_layers, m_0,m_e);


% m_eff(number_of_layers-1)=0;

if(number_of_layers>1)
        for n=1:number_of_layers-1
           m_eff(n)=m_0;
%             m_eff(n)=(m_high*m_0)*(m_low*m_0)/(m_high*m_0+m_low*m_0);
                       
            
%             
%             if ( mod(n,2) )                 % High condition 
%             m_eff(n)=m_high*m_0;        % for Si:  
%             else 
%             m_eff(n)=m_low*m_0;         % low condition
%             end                             % fof Ge: 
        end
else 
    m_eff(:)=m_0;
end

end


