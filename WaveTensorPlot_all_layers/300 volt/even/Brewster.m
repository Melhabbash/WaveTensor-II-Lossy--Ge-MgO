function [Brewster_Angle_0, Angle_due_to_Brewster ] = Brewster(tag, number_of_points,number_of_layers,refractive_index,rp,rs,tp,ts,theta_0,theta )

refractive_index_Air=1;

for m=1: number_of_points
Brewster_Angle_0(m,1)=atan(refractive_index(m,1)/refractive_index_Air)*180/pi;
end


for m=1: number_of_points
    for n=1:number_of_layers
Angle_due_to_Brewster(m,n)=asin(sin(Brewster_Angle_0(m,1)*pi/180)/refractive_index(m,n))*180/pi;
    end
end


 Brewster_Angle_0
 Angle_due_to_Brewster
 

txt1=' Brewster angle between '; 
txt2='vacuum and ';
txt3='layer';
txt4=tag;
txt5=' layer 1 ';
txt6='.jpeg';
txt7=' r_T_M and r_T_E ';
txt8=' r^2_T_M and r^2_T_E';
txt9=' t_T_M and t_T_E ';
txt10=' t^2_T_M and t^2_T_E';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rp_1   rs_1 %%%%%%%%%%%%%%%%%%%%%%%%%%%

h=figure; 
plot(theta_0(:,1),rp(:,:,1),'--b',theta_0(:,1),rs(:,:,1),'r');
legend on;
% title({[ txt1 txt2  txt5  ];  txt4} );
xlabel('\theta_0 (degree)'); 
ylabel('r_T_M and r_T_E '); 
legend({'r_T_M','r_T_E'},'Location','northwest');
hold on;


    rp_min=abs(rp(1,:,1));
    a=size(theta_0);
    for i=1:a(1)
        if (abs(rp(i,:,1))<abs(rp_min))
            j=i;
            rp_min=(rp(i,:,1));
            rs_min=(rs(i,:,1));
            tp_min=(tp(i,:,1));
            ts_min=(ts(i,:,1));
        end    
    end


     y1=get(gca,'ylim');
     plot([theta_0(j) theta_0(j)],[ y1 ],': k');
     plot([theta_0(1) theta_0(j)],[ rp_min rp_min],': k');
     plot([theta_0(1) theta_0(j)],[ rs_min rs_min],': k');
    legend off;


       
    
txt = ['\leftarrow r_T_M=' num2str(rp_min)];
text(theta_0(j),rp_min,txt,'FontSize',10)
txt = ['\leftarrow r_T_E=' num2str(rs_min)];
text(theta_0(j),rs_min,txt,'FontSize',10)

xticks([0 30 Brewster_Angle_0(m,1) 90 ]);
xticklabels({'0^o','30^o',['\theta_B: ' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});

% xticklabels({'0^o','30^o',[' \theta_B(theoretical):' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});

saveas(h,[txt1 txt2 txt5  txt4   txt7 txt6 ]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tp_1  ts_1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=figure; 
plot(theta_0(:,1),tp(:,:,1),'--b',theta_0(:,1),ts(:,:,1),'r');
% title({[ txt1 txt2 txt5  ]; txt4} );
xlabel('\theta_0 (degree)'); 
ylabel('t_T_M and t_T_E '); 
hold on;

y1=get(gca,'ylim');
 plot([theta_0(j) theta_0(j)],[ y1 ],': k');        %Vertical line at theta_0(j)
 plot([theta_0(1) theta_0(j)],[ tp_min tp_min],': k');  %Horizantal line at t_T_M(theta_0_degree(j)) 
 plot([theta_0(1) theta_0(j)],[ ts_min ts_min],': k');  %Horizantal line at  t_T_E(theta_0_degree(j))
legend off;

txt = ['\leftarrow t_T_M= ' num2str(tp_min) ];
text(theta_0(j),tp_min ,txt,'FontSize',10)
txt = ['\leftarrow t_T_E= ' num2str(ts_min) ];
text(theta_0(j),ts_min,txt,'FontSize',10)

xticks([0 30 Brewster_Angle_0(m,1) 90 ]);
xticklabels({'0^o','30^o',['\theta_B: ' num2str(Brewster_Angle_0(m,1)) '^o'], '90^o'});
% xticklabels({'0^o','30^o',[' \theta_B(theoretical):' num2str(Brewster_Angle_0(m,1)) '^o'], '90^o'});

saveas(h,[txt1 txt2  txt5  txt4 txt9 txt6 ]);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%% (rp_1)^2   (rs_1)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=figure;
plot(theta_0(:,1),rp(:,:,1).*rp(:,:,1),'--b',theta_0(:,1),rs(:,:,1).*rs(:,:,1),'r');
% title({[ txt1 txt2 txt5  ]; txt4} );
xlabel('\theta_0 (degree)'); 
ylabel('r_T_M^2 and r_T_E^2 '); 
ylim([-0.2 1.2])

hold on;

rprp_min=abs(rp(1,:,1).*rp(1,:,1));
a=size(theta_0);
for i=1:a(1)
    if (abs(rp(i,:,1).*rp(i,:,1))<abs(rprp_min))
        j=i;
        rprp_min=(rp(i,:,1)*rp(i,:,1));
        rsrs_min=(rs(i,:,1)*rs(i,:,1));
        tptp_min=(tp(i,:,1)*tp(i,:,1));
        tsts_min=(ts(i,:,1)*ts(i,:,1));
    end    
end

y1=get(gca,'ylim');
 plot([theta_0(j) theta_0(j)],[ y1],': k');
 plot([theta_0(1) theta_0(j)],[ rprp_min  rprp_min],': k');
 plot([theta_0(1) theta_0(j)],[ rsrs_min  rsrs_min],': k');



txt = ['\leftarrow r_T_M^2 ' num2str(rprp_min)];
text(theta_0(j),rprp_min,txt,'FontSize',10)
txt = ['\leftarrow r_T_E^2 ' num2str(rsrs_min)];
text(theta_0(j),rsrs_min,txt,'FontSize',10)

xticks([0 30 Brewster_Angle_0(m,1) 90 ]);
xticklabels({'0^o','30^o',['\theta_B: ' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});
% xticklabels({'0^o','30^o',[' \theta_B(theoretical):' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});


saveas(h,[txt1 txt2  txt5  txt4 txt8 txt6 ]);

%%%%%%%%%%%%%%%%%%%%%%%%%%(tp_1)^2   (ts_1)^2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=figure;
plot(theta_0(:,1),tp(:,:,1).*tp(:,:,1),'--b',theta_0(:,1),ts(:,:,1).*ts(:,:,1),'r');
% title({[ txt1 txt2 txt5  ]; txt4} );
xlabel('\theta_0 (degree)'); 
ylabel('t_T_M^2 and t_T_E^2 '); 
ylim([-0.2 1])
legend off;
hold on;

y1=get(gca,'ylim');
 plot([theta_0(j) theta_0(j)],[ y1],': k');
 plot([theta_0(1) theta_0(j)],[ tptp_min  tptp_min],': k');
 plot([theta_0(1) theta_0(j)],[ tsts_min  tsts_min],': k');

txt = ['\leftarrow t_T_M^2=' num2str(tptp_min) ];
text(theta_0(j),tptp_min,txt,'FontSize',10)

txt = ['\leftarrow t_T_E^2=' num2str(tsts_min) ];
text(theta_0(j),tsts_min,txt,'FontSize',10)


xticks([0 30 Brewster_Angle_0(m,1) 90 ]);
xticklabels({'0^o','30^o',['\theta_B: ' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});

% xticklabels({'0^o','30^o',[' \theta_B(theoretical):' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});

saveas(h,[txt1 txt2  txt5  txt4 txt10 txt6 ]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


h=figure;

for n=1:number_of_layers
         
    plot(theta_0, theta(:,:,n));
    title('Comparing \theta_i with \theta_0_degree'  );
    xlabel('\theta_0'); 
    ylabel('\theta_i ');
    txt = ['\leftarrow \theta ' num2str(n)];
    text(theta_0(7500),theta(7500,:,n),txt,'FontSize',10)
    hold on;
end

 y1=get(gca,'ylim');
 plot([theta_0(j) theta_0(j)],[ y1 ],': k');
 xticks([0 30 Brewster_Angle_0(m,1) 90 ]);
 xticklabels({'0^o','30^o',['\theta_B: ' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});
 
%  xticklabels({'0^o','30^o',[' \theta_B(theoretical):' num2str(Brewster_Angle_0(m,1)) '^o'] , '90^o'});
 saveas(h,['Comparing theta with theta_0_degree ' txt4 txt6 ]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(number_of_layers>2)
    



    for n=2:number_of_layers

        %%%%%%%%%%%%%%%%%%%%%%% rp_n   rs_n %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        h=figure; 
        plot(theta(:,:,n-1),rp(:,:,n),'--b',theta(:,:,n-1),rs(:,:,n),'r');
%         title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
        xlabel(['\theta' num2str(n-1) '(degree)']); 
        ylabel('r_T_M and r_T_E '); 
        hold on;

        rp_min=abs(rp(1,:,n));
        a=size(theta(:,:,n-1));
        for i=2:a(1)
            if (abs(rp(i,:,n))<abs(rp_min))
                jn=i;
                rp_min=rp(i,:,n);
                rs_min=rs(i,:,n);
                tp_min=tp(i,:,n);
                ts_min=ts(i,:,n);
            end    
        end

         y1=get(gca,'ylim');
         plot([theta(jn,:,n-1) theta(jn,:,n-1)],[ y1 ],': k');
         plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ rp_min rp_min],': k');
         plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ rs_min rs_min],': k');
         
         txt = ['\leftarrow r_T_M=' num2str(rp_min)];
         text(theta_0(j),rp_min,txt,'FontSize',10)
         txt = ['\leftarrow r_T_E=' num2str(rs_min)];
         text(theta_0(j),rs_min,txt,'FontSize',10)


        xticks([0 30 Angle_due_to_Brewster(m,n-1) 90 ]);
        xticklabels({'0^o','30^o', ['\theta_B: ' num2str(Angle_due_to_Brewster(m,n-1)) '^o']  , '90^o'});

%         xticklabels({'0^o','30^o', [' \theta_B(theoretical):' num2str(Angle_due_to_Brewster(m,n-1)) '^o']  , '90^o'});

        saveas(h,[txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n) txt4   txt7 txt6 ]);

        %%%%%%%%%%%%%%%%%%%%%%%%%% (rp_n)^2 (rs_n)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%

        h=figure;
        plot(theta(:,:,n-1),rp(:,:,n).*rp(:,:,n),'--b',theta(:,:,n-1),rs(:,:,n).*rs(:,:,n),'r');
%         title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
        xlabel(['\theta' num2str(n-1)  '(degree)']); 
        ylabel('r_T_M^2 and r_T_E^2 '); 
    %     ylim([-0.2 1.2])
        hold on;


        rprp_min=abs(rp(1,:,n).*rp(1,:,n));
        a=size(theta(:,:,n-1));
        for i=2:a(1)
            if (abs(rp(i,:,n).*rp(i,:,n))<abs(rprp_min))
                jjn=i;
                rprp_min=(rp(i,:,n)*rp(i,:,n));
                rsrs_min=(rs(i,:,n)*rs(i,:,n));
                tptp_min=(tp(i,:,n)*tp(i,:,n));
                tsts_min=(ts(i,:,n)*ts(i,:,n));               
            end    
        end


         y1=get(gca,'ylim');
         plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ y1],': k');
         plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ rprp_min  rprp_min],': k');
         plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ rsrs_min  rsrs_min],': k');



        txt = '\leftarrow r_T_M^2 ';
        text(theta(4500,:,n-1),abs(rp(4500,:,n).*rp(4500,:,n)),txt,'FontSize',10)
        txt = '\leftarrow r_T_E^2 ';
        text(theta(5000,:,n-1),abs(rs(5000,:,n).*rs(5000,:,n)),txt,'FontSize',10)

    %     txt = ['\leftarrow  \theta_B(exp): ' num2str(theta(j,:,n-1)) '^o'];
    %     text(theta(j,:,n-1),abs(rp(j,:,n)*rp(j,:,n)),txt,'FontSize',10)
    % 
        xticks([0 30 Angle_due_to_Brewster(m,n-1) 90 ]);
        xticklabels({'0^o','30^o',['\theta_B: ' num2str(Angle_due_to_Brewster(m,n-1)) '^o'] , '90^o'});
        
%         xticklabels({'0^o','30^o',[' \theta_B(theoretical):' num2str(Angle_due_to_Brewster(m,n-1)) '^o'] , '90^o'});

        saveas(h,[txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n) txt4   txt8 txt6 ]);




        %%%%%%%%%%%%%%%%%%%%%%%%%%%% tp_n  ts_n %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        h=figure; 
        plot(theta(:,:,n-1),tp(:,:,n),'--b',theta(:,:,n-1),ts(:,:,n),'r');
%         title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
        xlabel(['\theta' num2str(n-1) '(degree)']); 
        ylabel('t_T_M and t_T_E '); 
        hold on;

         y1=get(gca,'ylim');
         plot([theta(jn,:,n-1) theta(jn,:,n-1)],[ y1 ],': k');
         plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ tp_min tp_min],': k');
         plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ ts_min ts_min],': k');


        txt = '\leftarrow t_T_M ';
        text(theta(3500,:,n-1),tp(3500,:,n),txt,'FontSize',10)
        txt = '\leftarrow t_T_E ';
        text(theta(5000,:,n-1),ts(5000,:,n),txt,'FontSize',10)
         
        xticks([0 30 Angle_due_to_Brewster(m,n-1) 90 ]);
        xticklabels({'0^o','30^o', ['\theta_B: ' num2str(Angle_due_to_Brewster(m,n-1)) '^o']  , '90^o'});  
        saveas(h,[txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n) txt4   txt9 txt6 ]);


            %%%%%%%%%%%%%%%%%%%%%%%%%% (tp_n)^2 (ts_n)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%

        h=figure;
        plot(theta(:,:,n-1),tp(:,:,n).*tp(:,:,n),'--b',theta(:,:,n-1),ts(:,:,n).*ts(:,:,n),'r');
%         title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
        xlabel(['\theta' num2str(n-1) '(degree)']); 
        ylabel('t_T_M^2 and t_T_E^2 '); 
        hold on;

        y1=get(gca,'ylim');
         plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ y1],': k');
         plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ tptp_min  tptp_min],': k');
         plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ tsts_min  tsts_min],': k');


        txt = '\leftarrow t_T_M^2 ';
        text(theta(3500,:,n-1),abs(tp(3500,:,n).*tp(3500,:,n)),txt,'FontSize',10)

        txt = '\leftarrow t_T_E^2 ';
        text(theta(5000,:,n-1),abs(ts(5000,:,n).*ts(5000,:,n)),txt,'FontSize',10)


        xticks([0 30 Angle_due_to_Brewster(m,n-1) 90 ]);
        xticklabels({'0^o','30^o',[' \theta_B(theoretical):' num2str(Angle_due_to_Brewster(m,n-1)) '^o'] , '90^o'});

        saveas(h,[txt1 txt3  num2str(n-1) ' and ' txt3 num2str(n) txt4 txt10 txt6 ]);


    end
    
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rp_1astLayer   rs_1astLayer %%%%%%%%%%%%%%%%%%%%%%%%%%%
if (number_of_layers>1)
    h=figure; 
    plot(theta(:,:,number_of_layers),rp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),rs(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum' ];  txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('r_T_M and r_T_E ');
    xlim([0 90])
    ylim([-1.1 1.1])
    hold on;


    
    
    
    rp_min=abs(rp(1,:,number_of_layers+1));
    a=size(theta);
    for i=2:a(1)
        if (abs(rp(i,:,number_of_layers+1))<abs(rp_min))
            jl=i;
            rp_mlast=(rp(i,:,number_of_layers+1));
            rs_mlast=(rs(i,:,number_of_layers+1));
            tp_mlast=(tp(i,:,number_of_layers+1));
            ts_mlast=(ts(i,:,number_of_layers+1));                   
        end    
    end


     y1=get(gca,'ylim');
     plot([theta(jl,:,number_of_layers) theta(jl,:,number_of_layers)],[ y1 ],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ rp_mlast rp_mlast],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ rs_mlast rs_mlast],': k');
     

    txt = ['\leftarrow r_T_M=' num2str(rp_mlast)];
    text(theta(jl,:,number_of_layers),rp_mlast,txt,'FontSize',10)
    txt = ['\leftarrow r_T_E=' num2str(rs_mlast)];
    text(theta(jl,:,number_of_layers),rs_mlast,txt,'FontSize',10)

     
    xticks([0 20  Angle_due_to_Brewster(m,number_of_layers) 90 ]);
    xticklabels({'0^o','20^o',['\theta_B: ' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});
%     xticklabels({'0^o','20^o',[' \theta_B(theoretical):' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});

    saveas(h,[txt1 txt3 num2str(number_of_layers) ' and vacuum '  txt4   txt7 txt6 ]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% (rp_1astLayer)^2   (rs_1astLayer)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    h=figure;
    plot(theta(:,:,number_of_layers),rp(:,:,number_of_layers+1).*rp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),rs(:,:,number_of_layers+1).*rs(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum'  ]; txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('r_T_M^2 and r_T_E^2 '); 
    ylim([-0.1 1.1])
    hold on;

    rprp_min=abs(rp(1,:,number_of_layers+1).*rp(1,:,number_of_layers+1));
    a=size(theta);
    for i=2:a(1)
        if (abs(rp(i,:,number_of_layers+1).*rp(i,:,number_of_layers+1))<abs(rprp_min))
            jjl=i;
            rprp_mlast=(rp(i,:,number_of_layers+1).*rp(i,:,number_of_layers+1));
            rsrs_mlast=(rs(i,:,number_of_layers+1).*rs(i,:,number_of_layers+1));
            tptp_mlast=(tp(i,:,number_of_layers+1).*tp(i,:,number_of_layers+1));
            tsts_mlast=(ts(i,:,number_of_layers+1).*ts(i,:,number_of_layers+1));                  
        end    
    end

    y1=get(gca,'ylim');
     plot([theta(jjl,:,number_of_layers) theta(jjl,:,number_of_layers)],[ y1],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ rprp_mlast  rprp_mlast],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ rsrs_mlast  rsrs_mlast],': k');

     txt = ['\leftarrow r_T_M^2 ' num2str(rprp_mlast)];
     text(theta(jjl,:,number_of_layers),rprp_mlast,txt,'FontSize',10)
     txt = ['\leftarrow r_T_E^2 ' num2str(rsrs_mlast)];
     text(theta(jjl,:,number_of_layers),rsrs_mlast,txt,'FontSize',10)

    xticks([0 20  Angle_due_to_Brewster(m,number_of_layers) 90 ]);
    xticklabels({'0^o','20^o',['\theta_B: ' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});

%     xticklabels({'0^o','20^o',[' \theta_B(theoretical):' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});

    saveas(h,[txt1 txt3  num2str(number_of_layers) ' and vacuum' txt4 txt8 txt6 ]);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tp_1astLayer  ts_1astLayer %%%%%%%%%%%%%%%%%%%%%%%%%%%%

    h=figure; 
    plot(theta(:,:,number_of_layers),tp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),ts(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum' ]; txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('t_T_M and t_T_E '); 
%     xlim([0 50])
    hold on;
    
     y1=get(gca,'ylim');
     plot([theta(jl,:,number_of_layers) theta(jl,:,number_of_layers)],[ y1 ],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ tp_mlast tp_mlast],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ ts_mlast ts_mlast],': k');
    

    txt = ['\leftarrow t_T_M= ' num2str(tp_mlast) ];
    text(theta(jl,:,number_of_layers),tp_mlast ,txt,'FontSize',10)
    txt = ['\leftarrow t_T_E= ' num2str(ts_mlast) ];
    text(theta(jl,:,number_of_layers),ts_mlast,txt,'FontSize',10)
 
     
    xticks([0 20  Angle_due_to_Brewster(m,number_of_layers) 90 ]);
    xticklabels({'0^o','20^o',['     \theta_B: ' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});
 
    %xticklabels({'0^o','20^o',[' \theta_B(theoretical):' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});

    saveas(h,[txt1 txt3  num2str(number_of_layers) ' and vacuum' txt4 txt9 txt6 ]);



%%%%%%%%%%%%%%%%%%%%%%%%%%(tp_1astLayer)^2   (ts_1astLayer)^2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    h=figure;
    plot(theta(:,:,number_of_layers),tp(:,:,number_of_layers+1).*tp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),ts(:,:,number_of_layers+1).*ts(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum'  ]; txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('t_T_M^2 and t_T_E^2 '); 
%     xlim([0 50])
    ylim([1 8.5])
    hold on;
    
    y1=get(gca,'ylim');
     plot([theta(jjl,:,number_of_layers) theta(jjl,:,number_of_layers)],[ y1],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ tptp_mlast  tptp_mlast],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ tsts_mlast  tsts_mlast],': k');

     txt = ['\leftarrow t_T_M^2=' num2str(tptp_mlast) ];
     text(theta(jjl,:,number_of_layers),tptp_mlast,txt,'FontSize',10)

     txt = ['\leftarrow t_T_E^2=' num2str(tsts_mlast) ];
     text(theta(jjl,:,number_of_layers),tsts_mlast,txt,'FontSize',10)


    xticks([0 20  Angle_due_to_Brewster(m,number_of_layers) 90 ]);
    xticklabels({'0^o','20^o',['\theta_B: ' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});
    
%   xticklabels({'0^o','20^o',[' \theta_B(theoretical):' num2str(Angle_due_to_Brewster(m,number_of_layers)) '^o'] , '90^o'});


    saveas(h,[txt1 txt3  num2str(number_of_layers) ' and vacuum' txt4 txt10 txt6 ]);
end
end