function Plotting_Rp_Rs_abs_phase(tag,lambda_0,number_of_layers,V,theta_0_degree,Reflection,tan_Reflection_phase,Reflection_phase,Transmission,tan_Transmission_phase,Transmission_phase) 
K1='Layers';
K2='Volts';
K3=' film at ';
K5=' layer';
K6=' Volts';
K7='degree.jpeg';
K8='Reflection';
K9='Transmission';
K10='Phase of reflection';
K11='Phase of transmission';
K12='Phase of R ';
K13='Phase of T ';
K14='tan(Phase of reflection) ';
K15='tan(Phase of transmission) ';


theta_0_degree=theta_0_degree(1);



h=figure;
plot(lambda_0,Reflection,'r'), grid;
xlabel('Wavelength (m)'); 
ylabel('{\it R}(\lambda)'); 
saveas(h,[K8 num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K7 ]);


h=figure;
plot(lambda_0,tan_Reflection_phase,'r'), grid;
xlabel('Wavelength (m)'); 
ylabel('{\it tan(\phi_R (\lambda) )}'); 
saveas(h,[K14 num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K7 ]);

h=figure;
plot(lambda_0,Reflection_phase,'r'), grid;
xlabel('Wavelength (m)'); 
ylabel('\phi_R(\lambda)'); 
ylim([-2 20])
% legend({'\theta_R_T_M','\theta_R_T_E','\theta_R (average)'},'Location','southeast');
saveas(h,[K12 num2str(number_of_layers) K1  num2str(V) K2 tag num2str(theta_0_degree) K7 ]);




h=figure;
plot(lambda_0,Transmission,'r'), grid;
xlabel('Wavelength (m)'); 
ylabel('{\it T}(\lambda)'); 
% legend({'T_T_M','T_T_E','T(average)'},'Location','southeast');
saveas(h,[K9 num2str(number_of_layers) K1   num2str(V) K2 tag num2str(theta_0_degree) K7 ]);


h=figure;
plot(lambda_0,tan_Transmission_phase,'r'), grid;
xlabel('Wavelength (m)'); 
ylabel('{\it tan(\phi_T (\lambda))}'); 
% legend({'T_T_M','T_T_E','T(average)'},'Location','southeast');
saveas(h,[K15 num2str(number_of_layers) K1   num2str(V) K2 tag num2str(theta_0_degree) K7 ]);



h=figure;
plot(lambda_0,Transmission_phase,'r'), grid;
xlabel('Wavelength (m)'); 
ylabel('\phi_T(\lambda)'); 
% legend({'\theta_T_T_M','\theta_T_T_E','\theta_T (average)'},'Location','northeast');
saveas(h,[K13 num2str(number_of_layers) K1 num2str(V) K2 tag num2str(theta_0_degree) K7 ]);

end