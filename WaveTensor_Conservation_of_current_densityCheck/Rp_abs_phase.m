function [ Rp_abs,Rp_phase ] = Rp_abs_phase( number_of_points,Mp,theta_0)

a=size(theta_0);
for j_0=1:1:a(1)
    for m=1:number_of_points
        rrp(j_0,m)=(Mp(2,1,j_0,m)/Mp(1,1,j_0,m));
    end
end

for j_0=1:1:a(1)
    for m=1:number_of_points   
        Rp_abs(j_0,m)=abs(rrp(j_0,m));   
        Rp_phase(j_0,m)=angle(rrp(j_0,m))*180/pi;
        if(Rp_phase(j_0,m)==-180)
            Rp_phase(j_0,m)=180;
        end
    end
end

end

