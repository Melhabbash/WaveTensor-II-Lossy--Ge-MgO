% file_1_1_layer='1Layers0Volts-0.5time0degree.xlsx';
% file_1_2_layer='1Layers0Volts-GEdegree.xlsx';
file_2_layers= '2Layers0VoltsGe-1time0degree.xlsx';
% file_3_layers= '3Layers0VoltsGe-1.5time0degree.xlsx';
file_4_layers= '4Layers0VoltsGeMgO-2time0degree.xlsx';
% file_5_layers= '5Layers0VoltsGeMgO-2.5time0degree.xlsx';
file_6_layers= '6Layers0VoltsGeMgOGe-3time0degree.xlsx';

% f1_1=xlsread(file_1_1_layer);
% f1_2=xlsread(file_1_2_layer);
f2=xlsread(file_2_layers);
% f3=xlsread(file_3_layers);
f4=xlsread(file_4_layers);
% f5=xlsread(file_5_layers);
f6=xlsread(file_6_layers);


K1='different numbers of layers at ';
K3=' V ';

K4='All ';
K7='degree.jpeg';

K8='Reflection';
K9='Transmission';
K10='Phase of reflection';
K11='Phase of transmission';
K12='tan Phase of reflection';
K13='tan Phase of transmission'; 

theta_0 = textread('incident_angle.txt')*pi/180;
theta_0_degree=theta_0(1)*180/pi;
num='number_of_layers.txt';
number_of_layers = textread(num);
V=textread('Transverse_Voltage.txt');

h=figure;
% plot(f1_1(:,1),f1_1(:,11),f1_1(:,1),f1_2(:,11),'g',f1_1(:,1),f2(:,11),'-. b',f1_1(:,1),f3(:,11),'-- k', f1_1(:,1),f4(:,11),'k',f1_1(:,1),f5(:,11),' r'), grid;
plot(f2(:,1),f2(:,11),'-. b',f2(:,1),f4(:,11),'k',f2(:,1),f6(:,11),' -- r'), grid;

% ylim([0.16 0.37]);
% title(['Average{\it R} of ' K1 num2str(V)   K3 'transverse voltage' ] );
xlabel('Wavelength (m)'); 
ylabel('{\it R(\lambda)} '); 
% legend({'R(1-Layer-Ge)','R(1-Layer-CaF_2)','R(2-Layers)','R(3-Layers)','R(4-Layers)','R(5-Layers)'},'Location','bestoutside');
legend({'R(2-Layers)','R(4-Layers)','R(6-Layers)'},'Location','best');

saveas(h,[K4 K8 K1 num2str(V) K3 num2str(theta_0_degree) K7 ]);


h=figure;
% plot(f1_1(:,1),f1_1(:,13),f1_1(:,1),f1_2(:,13),': g',f1_1(:,1),f2(:,13),'-. b',f1_1(:,1),f3(:,13),'-- k', f1_1(:,1),f4(:,13),'k',f1_1(:,1),f5(:,13),' r'), grid;
plot(f2(:,1),f2(:,13),'-. b', f2(:,1),f4(:,13),'k', f2(:,1),f6(:,13),' -- r'), grid;
ylim([-0.5 1]);
% title(['Average{\it \phi_R} of '  K1 num2str(V) K3 'transverse voltage' ] );
xlabel('Wavelength (m)'); 
ylabel('tan (\phi_R(\lambda))'); 
% legend({'\phi_R(1-Layer-Ge)','\phi_R(1-Layer-CaF_2)','\phi_R(2-Layers)','\phi_R(3-Layers)','\phi_R(4-Layers)','\phi_R(5-Layers)'},'Location','bestoutside');
legend({'tan(\phi_R)(2-Layers)','tan(\phi_R)(4-Layers)','tan(\phi_R)(6-Layers)'},'Location','northeast');

saveas(h,[K4 K12 K1 num2str(V) K3 num2str(theta_0_degree) K7]);


h=figure;
% plot(f1_1(:,1),f1_1(:,13),f1_1(:,1),f1_2(:,13),': g',f1_1(:,1),f2(:,13),'-. b',f1_1(:,1),f3(:,13),'-- k', f1_1(:,1),f4(:,13),'k',f1_1(:,1),f5(:,13),' r'), grid;
plot(f2(:,1),f2(:,15),'-. b',f2(:,1),f4(:,15),'k', f2(:,1),f6(:,15),' -- r'), grid;

% title(['Average{\it \phi_R} of '  K1 num2str(V) K3 'transverse voltage' ] );
xlabel('Wavelength (m)'); 
ylabel('\phi_R(\lambda)  (degree) '); 
% legend({'\phi_R(1-Layer-Ge)','\phi_R(1-Layer-CaF_2)','\phi_R(2-Layers)','\phi_R(3-Layers)','\phi_R(4-Layers)','\phi_R(5-Layers)'},'Location','bestoutside');
legend({'\phi_R(2-Layers)','\phi_R(4-Layers)','\phi_R(6-Layers)'},'Location','east');

saveas(h,[K4 K10 K1 num2str(V) K3 num2str(theta_0_degree) K7]);






h=figure;
% plot(f1_1(:,1),f1_1(:,15),f1_1(:,1),f1_2(:,15),'g',f1_1(:,1),f2(:,15),'-. b',f1_1(:,1),f3(:,15),'-- k', f1_1(:,1),f4(:,15),'k',f1_1(:,1),f5(:,15),' r'), grid;
plot(f2(:,1),f2(:,17),'-. b', f2(:,1),f4(:,17),'k', f2(:,1),f6(:,17),' -- r'), grid;

ylim([-0.1 0.9]);
% title(['Average{\it T} of '  K1 num2str(V)   K3 'transverse voltage' ] );
xlabel('Wavelength (m)'); 
ylabel('{\it T(\lambda)} '); 
% legend({'T(1-Layer-Ge)','T(1-Layer-CaF_2)','T(2-Layers)','T(3-Layers)','T(4-Layers)','T(5-Layers)'},'Location','bestoutside');
legend({'T(2-Layers)','T(4-Layers)','T(6-Layers)'},'Location','best');

saveas(h,[K4 K9 K1 num2str(V) K3 num2str(theta_0_degree) K7 ]);

h=figure;
% plot(f1_1(:,1),f1_1(:,17),f1_1(:,1),f1_2(:,17),'g',f1_1(:,1),f2(:,17),'-. b',f1_1(:,1),f3(:,17),'-- k', f1_1(:,1),f4(:,17),'k',f1_1(:,1),f5(:,17),' r'), grid;
plot(f2(:,1),f2(:,19),'-. b',f2(:,1),f4(:,19),'k', f2(:,1),f6(:,19),' -- r'), grid;

% ylim([-200 200]);
% title(['Average{\it \phi_T} of '  K1 num2str(V)   K3 'transverse voltage' ] );
xlabel('Wavelength (m)'); 
ylabel('tan (\phi_R(\lambda)) '); 
% legend({'\phi_T(1-Layer-Ge)','\phi_T(1-Layer-CaF_2)','\phi_T(2-Layers)','\phi_T(3-Layers)','\phi_T(4-Layers)','\phi_T(5-Layers)'},'Location','bestoutside');
legend({'tan (\phi_R(\lambda))(2-Layers)','tan (\phi_R(\lambda))(4-Layers)','tan (\phi_R(\lambda))(6-Layers)'},'Location','best');

saveas(h,[K4 K13 K1 num2str(V) K3 num2str(theta_0_degree) K7]);



h=figure;
% plot(f1_1(:,1),f1_1(:,17),f1_1(:,1),f1_2(:,17),'g',f1_1(:,1),f2(:,17),'-. b',f1_1(:,1),f3(:,17),'-- k', f1_1(:,1),f4(:,17),'k',f1_1(:,1),f5(:,17),' r'), grid;
plot(f2(:,1),f2(:,21),'-. b',f2(:,1),f4(:,21),'k', f2(:,1),f6(:,21),' -- r'), grid;

% ylim([-200 200]);
% title(['Average{\it \phi_T} of '  K1 num2str(V)   K3 'transverse voltage' ] );
xlabel('Wavelength (m)'); 
ylabel('\phi_T(\lambda)  (degree) '); 
% legend({'\phi_T(1-Layer-Ge)','\phi_T(1-Layer-CaF_2)','\phi_T(2-Layers)','\phi_T(3-Layers)','\phi_T(4-Layers)','\phi_T(5-Layers)'},'Location','bestoutside');
legend({'\phi_T(2-Layers)','\phi_T(4-Layers)','\phi_T(6-Layers)'},'Location','best');

saveas(h,[K4 K11 K1 num2str(V) K3 num2str(theta_0_degree) K7]);
