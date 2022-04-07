
file_0_volts=  '4Layers0VoltsGeMgO-2time0degree.xlsx';
file_300_volts='4Layers300VoltsGeMgO-2time0degree.xlsx';
file_600_volts='4Layers600VoltsGeMgO-2time0degree.xlsx';
file_900_volts='4Layers900VoltsGeMgO-2time0degree.xlsx';


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
K12='tan Phase of reflection';
K13='tan Phase of transmission'; 

theta_0 = textread('incident_angle.txt')*pi/180;
theta_0_degree=theta_0(1)*180/pi;
num='number_of_layers.txt';
number_of_layers = textread(num);
label(number_of_layers,(10+numel(num2str(number_of_layers))))=char(number_of_layers);

for nl=1:number_of_layers
     if (numel(num2str(nl))==1)
            label(nl,:)=['tag_00' mat2str(nl) '.txt'];
     end
     if (numel(num2str(nl))==2)
            label(nl,:)=['tag_0' mat2str(nl) '.txt'];
     end
     if (numel(num2str(nl))==3)
            label(nl,:)=['tag_' mat2str(nl) '.txt'];
     end
end

for nl=1:number_of_layers    
    Label(nl,:)=string(textread(label(nl,:),'%q')');
end
tag=char(nl);
tag='';
for nl=1:number_of_layers
    tag=strcat(tag,'-', Label(nl,:));  
end

tag=char(tag);


h=figure;
plot(f0(:,1),f0(:,11),'k',f0(:,1),f300(:,11),': b',f0(:,1),f600(:,11),'-- g', f0(:,1),f900(:,11),' : r'), grid;
% title(['Average {\it R} for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
ylabel('{\it R(\lambda)} '); 
legend({'R(0V)','R(300V)','R(600V)','R(900V)'},'Location','best');
saveas(h,[K4 K8 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);

h=figure;
plot(f0(:,1),f0(:,13),'k',f0(:,1),f300(:,13),': b',f0(:,1),f600(:,13),'-- g', f0(:,1),f900(:,13),' : r'), grid;
% title(['Average tan({\it \phi_R}) for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('tan (\phi_R(\lambda)) '); 
legend({'tan(\phi_R)(0V)','tan(\phi_R)(300V)','tan(\phi_R)(600V)','tan(\phi_R)(900V)'},'Location','best');
saveas(h,[K4 K12 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);



h=figure;
plot(f0(:,1),f0(:,15),'k',f0(:,1),f300(:,15),': b',f0(:,1),f600(:,15),'-- g', f0(:,1),f900(:,15),' : r'), grid;
% title(['Average{\it \phi_R} for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('\phi_R(\lambda)  (degree) '); 
legend({'\phi_R(0V)','\phi_R(300V)','\phi_R(600V)','\phi_R(900V)'},'Location','best');
saveas(h,[K4 K10 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);

 

h=figure;
plot(f0(:,1),f0(:,17),'k',f0(:,1),f300(:,17),': b',f0(:,1),f600(:,17),'-- g', f0(:,1),f900(:,17),' : r'), grid;
% title(['Average {\it T} for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('{\it T(\lambda)} '); 
legend({'T(0V)','T(300V)','T(600V)','T(900V)'},'Location','best');
saveas(h,[K4 K9 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);

h=figure;
plot(f0(:,1),f0(:,19),'k',f0(:,1),f300(:,19),': b',f0(:,1),f600(:,19),'-- g', f0(:,1),f900(:,19),' : r'), grid;
% title(['Average tan({\it \phi_T})  for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('tan(\phi_T(\lambda))   '); 
legend({'tan(\phi_T)(0V)','tan(\phi_T)(300V)','tan(\phi_T)(600V)','tan(\phi_T)(900V)'},'Location','best');
saveas(h,[K4 K13 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);


h=figure;
plot(f0(:,1),f0(:,21),'k',f0(:,1),f300(:,21),': b',f0(:,1),f600(:,21),'-- g', f0(:,1),f900(:,21),' : r'), grid;
% title(['Average{\it \phi_T}  for '  num2str(number_of_layers) K1 tag K2  K3] );
xlabel('Wavelength (m)'); 
 ylabel('\phi_T(\lambda)  (degree) '); 
legend({'\phi_T(0V)','\phi_T(300V)','\phi_T(600V)','\phi_T(900V)'},'Location','best');
saveas(h,[K4 K11 num2str(number_of_layers) K1 tag  K2 K3 num2str(theta_0_degree) K7 ]);

