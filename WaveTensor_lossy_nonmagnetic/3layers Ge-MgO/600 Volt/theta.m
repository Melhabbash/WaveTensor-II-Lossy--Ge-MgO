function [ theta ] = theta( number_of_points,number_of_layers,theta_0,refractive_index )
%% Calculation Angels for each layer for each wavelenght
% Calculation Angels for each layer for each wavelenght

%     theta(:,1)=theta_0; 
  a=size(theta_0);
  for j_0=1:1:a(1)
      for m=1:number_of_points
          for n=1:number_of_layers
              theta(j_0,m,n)=asin(1*sin(theta_0(j_0))/real(refractive_index(m,n))); %%theta_0 is in degree so should convert rad/sec     
          end
      end
  end

           theta(:,:,number_of_layers+1)=theta_0(:);


end

