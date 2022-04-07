
file_0_volts=  '2Layers0Volts-MgO-CaF260.1297degree.xlsx';
file_300_volts='2Layers300Volts-MgO-CaF260.1297degree.xlsx';
file_600_volts='2Layers600Volts-MgO-CaF260.1297degree.xlsx';
file_900_volts='2Layers900Volts-MgO-CaF260.1297degree.xlsx';


f0=xlsread(file_0_volts);
f300=xlsread(file_300_volts);
f600=xlsread(file_600_volts);
f900=xlsread(file_900_volts);


K1='-layers';
K2=' film at various ';
K3='applied voltages';
K4='All ';
K7='degree.jpeg';
K8='Reflection';
K9='Transmission';
K10='Phase of reflection';
K11='Phase of transmission';
K12='Phase of Rp';
K13='Phase of Rs'; 

h=figure;
plot(lambda_0,f0(:,11),'k',lambda_0,f300(:,11),': b',lambda_0,f600(:,11),'-- g', lambda_0,f900(:,11),' : r'), grid;
% title(['Average {\it R} for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
ylabel('{\it R(\lambda)} '); 
legend({'R(0V)','R(300V)','R(600V)','R(900V)'},'Location','best');
saveas(h,[K4 K8 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,f0(:,13),'k',lambda_0,f300(:,13),': b',lambda_0,f600(:,13),'-- g', lambda_0,f900(:,13),' : r'), grid;
% title(['Average{\it \phi_R} for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('\phi_R(\lambda)  (degree) '); 
legend({'\phi_R(0V)','\phi_R(300V)','\phi_R(600V)','\phi_R(900V)'},'Location','best');
saveas(h,[K4 K10 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);


h=figure;
plot(lambda_0,f0(:,15),'k',lambda_0,f300(:,15),': b',lambda_0,f600(:,15),'-- g', lambda_0,f900(:,15),' : r'), grid;
% title(['Average {\it T} for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('{\it T(\lambda)} '); 
legend({'T(0V)','T(300V)','T(600V)','T(900V)'},'Location','best');
saveas(h,[K4 K9 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,f0(:,17),'k',lambda_0,f300(:,17),': b',lambda_0,f600(:,17),'-- g', lambda_0,f900(:,17),' : r'), grid;
% title(['Average{\it \phi_T}  for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('\phi_T(\lambda)  (degree) '); 
legend({'\phi_T(0V)','\phi_T(300V)','\phi_T(600V)','\phi_T(900V)'},'Location','best');
saveas(h,[K4 K11 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);

