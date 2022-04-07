function [inv_Mp,inv_Ms] = inv_Matrix (number_of_points,theta_0,Mp,Ms)

a=size(theta_0);
inv_Mp(2,2,a(1),number_of_points)=0;
inv_Ms(2,2,a(1),number_of_points)=0;


for j_0=1:1:a(1)
    for m=1:number_of_points
        
            inv_Mp(:,:,j_0,m)=Mp(:,:,j_0,m)';
            inv_Ms(:,:,j_0,m)=Ms(:,:,j_0,m)';
        
    end
end

end

