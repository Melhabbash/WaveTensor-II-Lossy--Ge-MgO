function Writting_Results(tag,number_of_layers,number_of_points,V,theta_0_degree,lambda_0,Mp,Ms,yp,zp,ys,zs,Reflection,tan_Reflection_phase,Reflection_phase,Transmission,tan_Transmission_phase,Transmission_phase,rp,tp,rs,ts,q,con)

K1='Layers';
K2='Volts';
K4='degree';
K41=' r and t';
K5='.xlsx';

K6=' Volts';
K8='Refelctivity';
K9='transmittance';
K10='Phase of Reflection';




xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Wavelength'),1,'A1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],lambda_0,1,'A2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('yp '),1,'C1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(yp')),1,'C2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('zp '),1,'E1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(zp')),1,'E2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('ys'),1,'G1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(ys')),1,'G2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('zs'),1,'I1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(zs')),1,'I2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Reflection_abs '),1,'K1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Reflection')),1,'K2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('tan_Reflection_phase '),1,'M1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(tan_Reflection_phase')),1,'M2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Reflection_phase'),1,'O1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Reflection_phase')),1,'O2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Transmission_abs'),1,'Q1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Transmission')),1,'Q2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('tan_Transmission_phase'),1,'S1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(tan_Transmission_phase')),1,'S2');

xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Transmission_phase'),1,'U1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Transmission_phase')),1,'U2');



for i=1:number_of_layers+1
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Wavelength'),i+1,'A1');
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],lambda_0,i+1,'A2');
    
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(['rp' num2str(i)] ),i+1,'C1');  
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(num2str(rp(1,:,i)')),i+1,'C2');
    
    
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(['rs' num2str(i)] ),i+1,'E1');  
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(num2str(rs(1,:,i)')),i+1,'E2');
    
    
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(['tp' num2str(i)] ),i+1,'G1');  
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(num2str(tp(1,:,i)')),i+1,'G2');
    
    
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(['ts' num2str(i)] ),i+1,'I1');  
    xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4  K5],cellstr(num2str(ts(1,:,i)')),i+1,'I2');
    
end

% for m=1:number_of_points
% 
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Wavelength'),number_of_layers+1,'A1');
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],lambda_0(m),number_of_layers+1,['A' num2str(m*3)]);
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('MP'),number_of_layers+1,'C1');
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Mp(1,1,:,m))),number_of_layers+1,['C' num2str(m*3)]);
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Mp(1,2,:,m))),number_of_layers+1,['D' num2str(m*3)]);
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Mp(2,1,:,m))),number_of_layers+1,['C' num2str(m*3+1)]);
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Mp(2,2,:,m))),number_of_layers+1,['D' num2str(m*3+1)]);
% 
%     
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Ms'),number_of_layers+1,'F1');
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Ms(1,1,:,m))),number_of_layers+1,['F' num2str(m*3)]);
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Ms(1,2,:,m))),number_of_layers+1,['G' num2str(m*3)]);
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Ms(2,1,:,m))),number_of_layers+1,['F' num2str(m*3+1)]);
%         xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(Ms(2,2,:,m))),number_of_layers+1,['G' num2str(m*3+1)]);
%              
%     
% end



xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('Wavelength'),number_of_layers+4,'A1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],lambda_0,number_of_layers+4,'A2');


xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('q'),number_of_layers+3,'C1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(q)),number_of_layers+3,'C2');

% for i=1:number_of_layers
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr('conductivity '),number_of_layers+4,'C1');
xlswrite([num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K4 K5],cellstr(num2str(con(:,:))),number_of_layers+4,'C2');
% end







end