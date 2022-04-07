function [ Ts_abs,Ts_phase ]=Ts_abs_phase ( number_of_points,Ms,theta_0)

a=size(theta_0);
for j_0=1:1:a(1)
    for m=1:number_of_points
        tts(j_0,m)=(1/Ms(1,1,j_0,m));
    end
end

for j_0=1:1:a(1)
    for m=1:number_of_points
        Ts_abs(j_0,m)=abs(tts(j_0,m));
        Ts_phase(j_0,m)=angle(tts(j_0,m))*180/pi;
    end
end

end