function [ B ] = Beta_Matrix( number_of_points,number_of_layers,beta )
%% Formation Of Beta Matrix
% Formation Of Beta Matrix
 
% B(2,2,number_of_points,number_of_layers)=0;

a=size(beta);
for j_0=1:1:a(1)
for m=1:number_of_points  
    for n=1:number_of_layers 
        B(:,:,j_0,m,n)=[ exp(1i*beta(j_0,m,n)) 0 ;0 exp(-1i*beta(j_0,m,n))];
    end 
end
end

end

