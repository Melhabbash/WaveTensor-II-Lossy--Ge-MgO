
file_0_volts=  '5Layers0Volts-MgO-CaF2-MgO-CaF2-MgO20degree.xlsx';
file_300_volts='5Layers300Volts-MgO-CaF2-MgO-CaF2-MgO20degree.xlsx';
file_600_volts='5Layers600Volts-MgO-CaF2-MgO-CaF2-MgO20degree.xlsx';
file_900_volts='5Layers900Volts-MgO-CaF2-MgO-CaF2-MgO20degree.xlsx';


f0=xlsread(file_0_volts);
f300=xlsread(file_300_volts);
f600=xlsread(file_600_volts);
f900=xlsread(file_900_volts);


K1='-layers';
K2=' film at various ';
K3='applied voltages';
K4='Sensitivity ';
K7='degree.jpeg';
K8='Reflection';
K9='Transmission';
K10='Phase of reflection';
K11='Phase of transmission';
K12='Phase of Rp';
K13='Phase of Rs'; 


Sen_R_300=(f300(:,11)-f0(:,11))/(300);
Sen_phi_R_300=(f300(:,13)-f0(:,13))/(300);
Sen_T_300=(f300(:,15)-f0(:,15))/(300);
Sen_phi_T_300=(f300(:,17)-f0(:,17))/(300);

Sen_R_600=(f600(:,11)-f300(:,11))/(300);
Sen_phi_R_600=(f600(:,13)-f300(:,13))/(300);
Sen_T_600=(f600(:,15)-f300(:,15))/(300);
Sen_phi_T_600=(f600(:,17)-f300(:,17))/(300);

Sen_R_900=(f900(:,11)-f600(:,11))/(300);
Sen_phi_R_900=(f900(:,13)-f600(:,13))/(300);
Sen_T_900=(f900(:,15)-f600(:,15))/(300);
Sen_phi_T_900=(f900(:,17)-f600(:,17))/(300);






h=figure;
plot(lambda_0,Sen_R_300,'k',lambda_0,Sen_R_600,': b',lambda_0,Sen_R_900,'-- g'), grid;
title(['Sensitivity of {\it R} to voltage '  num2str(number_of_layers) K1 ] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_R(\lambda)} '); 
legend({'S_R(300-0V)','S_R(600-300V)','S_R(900-600V)'},'Location','best');
saveas(h,[ K4 K8 num2str(number_of_layers) K1 tag num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,Sen_phi_R_300,'k',lambda_0,Sen_phi_R_600,': b',lambda_0,Sen_phi_R_900,'-- g'), grid;
title(['Sensitivity of {\it \phi_R} to voltage '  num2str(number_of_layers) K1 tag] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_ \phi_R(\lambda)} '); 
legend({'S_ \phi_R(300-0V)','S_ \phi_R(600-300V)','S_ \phi_R(900-600V)'},'Location','best');
saveas(h,[ K4 K10 num2str(number_of_layers) K1 tag num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,Sen_T_300,'k',lambda_0,Sen_T_600,': b',lambda_0,Sen_T_900,'-- g'), grid;
title(['Sensitivity of {\it T} to voltage '  num2str(number_of_layers) K1 ] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_T(\lambda)} '); 
legend({'S_T(300-0V)','S_T(600-300V)','S_T(900-600V)'},'Location','best');
saveas(h,[ K4 K9 num2str(number_of_layers) K1 tag num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,Sen_phi_T_300,'k',lambda_0,Sen_phi_T_600,': b',lambda_0,Sen_phi_T_900,'-- g'), grid;
title(['Sensitivity of {\it \phi_T} to voltage '  num2str(number_of_layers) K1 tag] );
xlabel('Wavelength (m)'); 
ylabel('{\it S_ \phi_T(\lambda)} '); 
legend({'S_ \phi_T(300-0V)','S_ \phi_T(600-300V)','S_ \phi_T(900-600V)'},'Location','best');
saveas(h,[ K4 K11 num2str(number_of_layers) K1 tag num2str(theta_0_degree) K7 ]);


