function [ Mp ] = Mp( number_of_points,number_of_layers,B,Ap,theta_0)

a=size(theta_0);
Mp(2,2,a(1),number_of_points)=0;

for j_0=1:1:a(1)
    for m=1:number_of_points 
        Mp(1,1,j_0,m)=1; 
        Mp(2,2,j_0,m)=1; 
        Mp(1,2,j_0,m)=0; 
        Mp(2,1,j_0,m)=0;
    end
end

for j_0=1:1:a(1)
    for m=1:number_of_points
        for n=1:number_of_layers
            Mp(:,:,j_0,m)=Mp(:,:,j_0,m)*Ap(:,:,j_0,m,n)*B(:,:,j_0,m,n);
        end
    end
end

end

