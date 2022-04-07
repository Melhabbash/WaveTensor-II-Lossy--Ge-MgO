function [mult_p,mult_s] = conservation_of_current_density (number_of_points,theta_0,Mp,Ms)

a=size(theta_0);
mult_p(a(1),number_of_points)=0;
mult_s(a(1),number_of_points)=0;


for j_0=1:1:a(1)
    for m=1:number_of_points
        
            mult_p(j_0,m)=det(Mp(:,:,j_0,m)')*det(Mp(:,:,j_0,m));
            mult_s(j_0,m)=det(Ms(:,:,j_0,m)')*det(Ms(:,:,j_0,m));
        
    end
end

end

