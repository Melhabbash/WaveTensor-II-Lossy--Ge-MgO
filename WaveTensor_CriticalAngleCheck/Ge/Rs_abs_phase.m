function [ Rs_abs,Rs_phase ] = Rs_abs_phase( number_of_points,Ms,theta_0)

a=size(theta_0);
for j_0=1:1:a(1)
    for m=1:number_of_points
        rrs(j_0,m)=(Ms(2,1,j_0,m)/Ms(1,1,j_0,m));    
    end
end

for j_0=1:1:a(1)
    for m=1:number_of_points
        Rs_abs(j_0,m)=abs(rrs(j_0,m));
        Rs_phase(j_0,m)=angle(rrs(j_0,m))*180/pi;
        if(Rs_phase(j_0,m)==-180)
            Rs_phase(j_0,m)=180;
        end          
    end
end

end

