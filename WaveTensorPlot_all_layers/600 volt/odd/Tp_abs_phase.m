function [ Tp_abs,Tp_phase ] = Tp_abs_phase ( number_of_points,Mp,theta_0)

a=size(theta_0);
for j_0=1:1:a(1)
    for m=1:number_of_points
        ttp(j_0,m)=(1/Mp(1,1,j_0,m));
    end
end

for j_0=1:1:a(1)
    for m=1:number_of_points   
        Tp_abs(j_0,m)=abs(ttp(j_0,m));
        Tp_phase(j_0,m)=angle(ttp(j_0,m))*180/pi;
    end
end

end