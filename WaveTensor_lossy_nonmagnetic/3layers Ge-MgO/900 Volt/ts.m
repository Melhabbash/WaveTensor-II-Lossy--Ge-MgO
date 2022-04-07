function [ ts ] = ts( number_of_points,number_of_layers,Intrinsic_impedance,Intrinsic_impedance_Air,theta,theta_0,con,refractive_index )

a=size(theta_0);

for j_0=1:1:a(1)
    for m=1:number_of_points
        factor(j_0,m,1)=1+Intrinsic_impedance(j_0,m,1)*con(m,1)/cos(theta(j_0,m,1));
        factor(j_0,m,number_of_layers+1)=1+Intrinsic_impedance(j_0,m,number_of_layers+1)*con(m,number_of_layers+1)/cos(theta(j_0,m,number_of_layers+1));
        ts(j_0,m,1)=( 2*Intrinsic_impedance(j_0,m,1)*cos(theta_0(j_0))  )/( Intrinsic_impedance(j_0,m,1)*cos(theta_0(j_0))  + Intrinsic_impedance_Air*cos(theta(j_0,m,1)) *factor(j_0,m,1));
        ts(j_0,m,number_of_layers+1)=( 2*Intrinsic_impedance(j_0,m,number_of_layers+1)*cos(theta(j_0,m,number_of_layers)) )/( Intrinsic_impedance(j_0,m,number_of_layers+1)*cos(theta(j_0,m,number_of_layers))  + Intrinsic_impedance(j_0,m,number_of_layers)*cos(theta(j_0,m,number_of_layers+1)) *factor(j_0,m,number_of_layers+1));

    end
end


if(number_of_layers >1)
    for j_0=1:1:a(1)
        for m=1:number_of_points 
            for n=1:number_of_layers
                factor(j_0,m,n+1)=1+Intrinsic_impedance(j_0,m,n+1)*con(m,n+1)/cos(theta(j_0,m,n+1));
                ts(j_0,m,n+1)=( 2*Intrinsic_impedance(j_0,m,n+1)*cos(theta(j_0,m,n)) )/( Intrinsic_impedance(j_0,m,n+1)*cos(theta(j_0,m,n))  + Intrinsic_impedance(j_0,m,n)*cos(theta(j_0,m,n+1)) *factor(j_0,m,n+1));
            end 
        end
    end
end





end

