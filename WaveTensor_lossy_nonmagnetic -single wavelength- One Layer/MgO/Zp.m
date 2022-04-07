function [ zp ] = Zp( number_of_points,Mp,theta_0)
%p==TM

a=size(theta_0);
for j_0=1:1:a(1)
    for m=1:number_of_points
        zp(j_0,m)=(Mp(2,1,j_0,m)/Mp(1,1,j_0,m));
    end
end

end

