function [mult_p,mult_s] = multiplication_Matrix (number_of_points,theta_0,Mp,Ms,inv_Mp,inv_Ms)

a=size(theta_0);
Q1p(1,2,a(1),number_of_points)=0;
Q2p(1,2,a(1),number_of_points)=0;

Q1s(1,2,a(1),number_of_points)=0;
Q2s(1,2,a(1),number_of_points)=0;

o=[1 0; 0 -1];


for j_0=1:1:a(1)
    for m=1:number_of_points
        
            Q1p(:,:,j_0,m)=;
            mult_s(:,:,j_0,m)=inv_Ms(:,:,j_0,m)*o*Ms(:,:,j_0,m);
        
    end
end

end

