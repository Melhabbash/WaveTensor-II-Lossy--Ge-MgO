function [w] = angular_frequency(number_of_points,c,lambda_0)
%%   Angular Frequency
 % Calculation of angular frequency for each layer
 
 
 % $$\omega =\frac{2\pi }{\lambda \ n}$$


for m=1:number_of_points
              w(m)=2*pi*c/lambda_0(m);  %angular frequency of light
    
end
end

