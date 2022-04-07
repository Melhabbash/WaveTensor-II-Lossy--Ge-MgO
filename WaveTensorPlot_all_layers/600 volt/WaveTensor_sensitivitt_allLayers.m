
file2_0_volts='1Layers0Volts-0.5time0degree.xlsx';
file3_0_volts='2Layers600VoltsGe-1time0degree.xlsx';
file4_0_volts='4Layers0VoltsSiCaF2-2time0degree.xlsx';
file5_0_volts='5Layers0VoltsSiCaF2-2.5time0degree.xlsx';

file2_300_volts='2Layers300VoltsSi-1time0degree.xlsx';
file3_300_volts='3Layers300VoltsSi-1.5time0degree.xlsx';
file4_300_volts='4Layers300VoltsSiCaF2-2time0degree.xlsx';
file5_300_volts='5Layers300VoltsSiCaF2-2.5time0degree.xlsx';


f2_0=xlsread(file2_0_volts);
f3_0=xlsread(file3_0_volts);
f4_0=xlsread(file4_0_volts);
f5_0=xlsread(file5_0_volts);

f2_300=xlsread(file2_300_volts);
f3_300=xlsread(file3_300_volts);
f4_300=xlsread(file4_300_volts);
f5_300=xlsread(file5_300_volts);


K1='All layers';
% K2=' film at various ';
% K3='applied voltages';
K4='Sensitivity ';
K7='degree.jpeg';
K8='Reflection';
K9='Transmission';
K10='Phase of reflection';
K11='Phase of transmission';
K12='Phase of Rp';
K13='Phase of Rs'; 


Sen_R2_300=(f2_300(:,11)-f2_0(:,11))/(300);
Sen_R3_300=(f3_300(:,11)-f3_0(:,11))/(300);
Sen_R4_300=(f4_300(:,11)-f4_0(:,11))/(300);
Sen_R5_300=(f5_300(:,11)-f5_0(:,11))/(300);


Sen_phiR2_300=(f2_300(:,13)-f2_0(:,13))/(300);
Sen_phiR3_300=(f3_300(:,13)-f3_0(:,13))/(300);
Sen_phiR4_300=(f4_300(:,13)-f4_0(:,13))/(300);
Sen_phiR5_300=(f5_300(:,13)-f5_0(:,13))/(300);

Sen_T2_300=(f2_300(:,15)-f2_0(:,15))/(300);
Sen_T3_300=(f3_300(:,15)-f3_0(:,15))/(300);
Sen_T4_300=(f4_300(:,15)-f4_0(:,15))/(300);
Sen_T5_300=(f5_300(:,15)-f5_0(:,15))/(300);


Sen_phiT2_300=(f2_300(:,17)-f2_0(:,17))/(300);
Sen_phiT3_300=(f3_300(:,17)-f3_0(:,17))/(300);
Sen_phiT4_300=(f4_300(:,17)-f4_0(:,17))/(300);
Sen_phiT5_300=(f5_300(:,17)-f5_0(:,17))/(300);



h=figure;
plot(lambda_0,Sen_R2_300,'k',lambda_0,Sen_R3_300,': b',lambda_0,Sen_R4_300,'-- g',lambda_0,Sen_R5_300,'-. r'), grid;
title(['Sensitivity of {\it R} to voltage '  K1 ] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_R(\lambda)} '); 
legend({'S_R_2(300-0V)','S_R_3(300-0V)','S_ R_4(300-0V)','S_R_5(300-0V)'},'Location','best');
saveas(h,[ K4 K8  K1  num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,Sen_phiR2_300,'k',lambda_0,Sen_phiR3_300,': b',lambda_0,Sen_phiR4_300,'-- g',lambda_0,Sen_phiR5_300,'-. r'), grid;
title(['Sensitivity of {\it \phi_R} to voltage '   K1 ] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_ \phi_R(\lambda)} '); 
legend({'S_\phi_R_2(300-0V)','S_\phi_R_3(300-0V)','S_\phi_R_4(300-0V)','S_\phi_R_5(300-0V)'},'Location','best');
saveas(h,[ K4 K10  K1  num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,Sen_T2_300,'k',lambda_0,Sen_T3_300,': b',lambda_0,Sen_T4_300,'-- g',lambda_0,Sen_T5_300,'-. r'), grid;
title(['Sensitivity of {\it T} to voltage '   K1 ] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_T(\lambda)} '); 
legend({'S_T_2(300-0V)','S_T_3(300-0V)','S_T_4(300-0V)','S_T_5(300-0V)'},'Location','best');
saveas(h,[ K4 K9  K1 num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,Sen_phiT2_300,'k',lambda_0,Sen_phiT3_300,': b',lambda_0,Sen_phiT4_300,'-- g',lambda_0,Sen_phiT5_300,'-. r'), grid;
title(['Sensitivity of {\it \phi_T} to voltage '  K1 ] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_\phi_T(\lambda)} '); 
legend({'S_\phi_T_2(300-0V)','S_ \phi_T_3(300-0V)','S_ \phi_T_4(300-0V)','S_\phi_T_5(300-0V)'},'Location','best');
saveas(h,[ K4 K11  K1  num2str(theta_0_degree) K7 ]);


