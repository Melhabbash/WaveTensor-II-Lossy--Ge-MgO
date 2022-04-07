function [ Reflection,tan_Reflection_phase,Reflection_phase] = reflection( number_of_points,zp,zs)
a=size(zp);
for j_0=1:1:a(1)
    for m=1:number_of_points
        z(j_0,m)=(zp(j_0,m)+zs(j_0,m))/2;  
        Reflection(j_0,m)=abs(z(j_0,m));
        tan_Reflection_phase(j_0,m)=round(imag(z(j_0,m))/real(z(j_0,m)),3);
        Reflection_phase(j_0,m)=atan(tan_Reflection_phase(j_0,m))*180/pi;  
    end
end
end

