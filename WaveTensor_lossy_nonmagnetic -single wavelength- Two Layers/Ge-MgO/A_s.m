function [ As ] = A_s( number_of_points,number_of_layers,rs,ts )

a=size(rs);
for j_0=1:1:a(1)
    for m=1:number_of_points  
        for n=1:number_of_layers 
            As(:,:,j_0,m,n)=(1/(ts(j_0,m,n)))*[ 1 (rs(j_0,m,n)) ;(rs(j_0,m,n)) 1 ];
        end
    end
end

end

