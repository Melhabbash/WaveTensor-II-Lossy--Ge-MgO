clc;
clear;
Raw_Data='Ge(2020).xlsx';
Ready_Data='Ge_before.xlsx';
Data = xlsread(Raw_Data);
number_of_points=length(Data);

for m=1:number_of_points
    
    lambda(m,1)=Data(m,1)*10^-6;
    refractive_index_real(m,1)=Data(m,2);
    refractive_index_imag(m,1)=Data(m,3);
    Permitivity_real(m,1)=refractive_index_real(m,1)^2;
    Permitivity_imag(m,1)=0;
    
    
end

X=lambda(1,1):0.5e-9:lambda(number_of_points,1);

refractive_index_real=interp1(lambda,refractive_index_real,X,'cubic')'; 
refractive_index_imag=interp1(lambda,refractive_index_imag,X,'cubic')'; 
Permitivity_real=interp1(lambda,Permitivity_real,X,'cubic')';
Permitivity_imag=interp1(lambda,Permitivity_imag,X,'cubic')';


lambda=X';
    start=1;
    End=length(lambda);

    
    xlswrite(Ready_Data, lambda(start:End),'','A1');
    xlswrite(Ready_Data,refractive_index_real(start:End),'','B1');
    xlswrite(Ready_Data,refractive_index_imag(start:End),'','C1');
%     xlswrite(Ready_Data,Permitivity_real(start:End),'','D1');
%     xlswrite(Ready_Data,Permitivity_imag(start:End),'','E1');

ready_data=[lambda,refractive_index_real,refractive_index_imag ];
figure
plot(Data(:,1),Data(:,2))
figure
plot(ready_data(:,1),ready_data(:,2))


