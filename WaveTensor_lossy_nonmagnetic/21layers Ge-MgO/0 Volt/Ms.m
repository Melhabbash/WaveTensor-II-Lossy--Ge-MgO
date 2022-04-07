function [ Ms ] = Ms( number_of_points,number_of_layers,B,As,theta_0)

a=size(theta_0);
Ms(2,2,a(1),number_of_points)=0;

for j_0=1:1:a(1)
    for m=1:number_of_points 
        Ms(1,1,j_0,m)=1;
        Ms(2,2,j_0,m)=1;
        Ms(1,2,j_0,m)=0;
        Ms(2,1,j_0,m)=0;
    end
end

for j_0=1:1:a(1)
    for m=1:number_of_points
        for n=1:number_of_layers
            Ms(:,:,j_0,m)=Ms(:,:,j_0,m)*As(:,:,j_0,m,n)*B(:,:,j_0,m,n);
        end
    end
end

end

