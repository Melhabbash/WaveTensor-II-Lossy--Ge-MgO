function [Ip,Is] = conservation_of_current_density (number_of_points,theta_0,theta,Intrinsic_impedance_Air,Intrinsic_impedance,Mp,Ms)

a=size(theta_0);
Q1p(1,2,a(1),number_of_points)=0;
Q2p(1,2,a(1),number_of_points)=0;

Q1s(1,2,a(1),number_of_points)=0;
Q2s(1,2,a(1),number_of_points)=0;

 Ip(1,2,a(1),number_of_points)=10;
 Is(1,2,a(1),number_of_points)=10;


for j_0=1:1:a(1)
    for m=1:number_of_points
        
            Q1p(1,1,j_0,m)=1/Intrinsic_impedance_Air -cos(theta_0)/(Intrinsic_impedance(j_0,m,1)*cos(theta(j_0,m,1)));
            Q1p(1,2,j_0,m)=1/Intrinsic_impedance_Air +cos(theta_0)/(Intrinsic_impedance(j_0,m,1)*cos(theta(j_0,m,1)));
            
            Q2p(1,1,j_0,m)=1/Intrinsic_impedance(j_0,m,1)- cos(theta(j_0,m,1))/(Intrinsic_impedance_Air*cos(theta_0));
            Q2p(1,2,j_0,m)=1/Intrinsic_impedance(j_0,m,1)+ cos(theta(j_0,m,1))/(Intrinsic_impedance_Air*cos(theta_0));
            
            Q1s(1,1,j_0,m)=cos(theta_0)/Intrinsic_impedance_Air- cos(theta(j_0,m,1))/Intrinsic_impedance(j_0,m,1);
            Q1s(1,2,j_0,m)=cos(theta_0)/Intrinsic_impedance_Air+ cos(theta(j_0,m,1))/Intrinsic_impedance(j_0,m,1);
            
            Q2s(1,1,j_0,m)=cos(theta(j_0,m,1))/Intrinsic_impedance(j_0,m,1)- cos(theta_0)/Intrinsic_impedance_Air ;
            Q2s(1,2,j_0,m)=cos(theta(j_0,m,1))/Intrinsic_impedance(j_0,m,1)+ cos(theta_0)/Intrinsic_impedance_Air ;
           
            
            
            Ip(:,:,j_0,m)=Q1p(:,:,j_0,m)*Mp(:,:,j_0,m)-Q2p(:,:,j_0,m);
            Is(:,:,j_0,m)=Q1s(:,:,j_0,m)*Ms(:,:,j_0,m)-Q2s(:,:,j_0,m);
    end
end



end

