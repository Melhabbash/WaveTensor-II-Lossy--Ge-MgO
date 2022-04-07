function [ Ap ] = A_p( number_of_points,number_of_layers,rp,tp )
 
a=size(rp);
for j_0=1:1:a(1)
    for m=1:number_of_points 
        for n=1:number_of_layers 
            Ap(:,:,j_0,m,n)=(1/(tp(j_0,m,n)))*[ 1 (rp(j_0,m,n)) ;(rp(j_0,m,n)) 1 ];
        end
    end
end

end

