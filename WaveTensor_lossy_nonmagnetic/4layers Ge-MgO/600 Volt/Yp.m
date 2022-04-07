function [ yp ] = Yp( number_of_points,Mp,theta_0)
%p==TM

a=size(theta_0);
for j_0=1:1:a(1)
    for m=1:number_of_points
        yp(j_0,m)=(1/Mp(1,1,j_0,m));
    end
end

end