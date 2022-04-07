function [Transmission,tan_Transmission_phase,Transmission_phase]=transmission (number_of_points,yp,ys)
a=size(yp);
for j_0=1:1:a(1)
    for m=1:number_of_points 
        y(j_0,m)=(yp(j_0,m)+ys(j_0,m))/2;  
        Transmission(j_0,m)=abs(y(j_0,m));
        tan_Transmission_phase(j_0,m)=round(imag(y(j_0,m))/real(y(j_0,m)),3);
        Transmission_phase(j_0,m)=atan(tan_Transmission_phase(j_0,m))*180/pi;        
    end
end
end