function [ ys ]=Ys ( number_of_points,Ms,theta_0)
%s==TE
a=size(theta_0);
for j_0=1:1:a(1)
    for m=1:number_of_points
        ys(j_0,m)=(1/Ms(1,1,j_0,m));
    end
end


end