function [ Critical_Angle ] = Critical (tag, number_of_points,number_of_layers,refractive_index,rp,rs,tp,ts,theta_0,theta )


refractive_index_Air=1;


for m=1: number_of_points
    if (refractive_index_Air > real(refractive_index(m,1)))
        Critical_Angle_0(m,1)=asin(real(refractive_index(m,1))/refractive_index_Air)*180/pi;
    end
end

for m=1: number_of_points
    for n=1:number_of_layers
            if(real(refractive_index(m,n))> real(refractive_index(m,n+1)))
                Critical_Angle(m,n)=asin(real(refractive_index(m,n+1))/real(refractive_index(m,n)))*180/pi;
            end
    end
end

	 

	txt1=' Critical angle between '; 
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
if (refractive_index_Air > real(refractive_index(m,1)))
    h=figure; 
    plot(theta_0(:,1),rp(:,:,1),'--b',theta_0(:,1),rs(:,:,1),'r');
    legend on;
    title({[ txt1 txt2  txt5  ];  txt4} );
    xlabel('\theta_0 (degree)'); 
    ylabel('r_T_M and r_T_E '); 
    legend({'r_T_M','r_T_E'},'Location','northwest');
    hold on;


    a=size(theta_0);
    rp_min=0;
    for i=1:a(1)
        if (round(rp(i,:,1))==-1);
            if(rp(i,:,1)<rp_min)
                j=i;
                rp_min=rp(i,:,1);
                rs_m=(rs(i,:,1));
                tp_m=(tp(i,:,1));
                ts_m=(ts(i,:,1));
            end
        end
    end
    


    y1=get(gca,'ylim');
     plot([theta_0(j) theta_0(j)],[ y1 ],': k');
     plot([theta_0(1) theta_0(j)],[ rp_min rp_min],': k');
     plot([theta_0(1) theta_0(j)],[ rs_m rs_m],': k');
    legend off;

    txt = '\leftarrow r_T_M ';
    text(theta_0(7500),rp(7500),txt,'FontSize',10)
    txt = '\leftarrow r_T_E ';
    text(theta_0(7500),rs(7500),txt,'FontSize',10)
    txt = ['\leftarrow   \theta_c:(exp): ' num2str(theta_0(j)) '^o'];
    text(theta_0(j),rp_min,txt,'FontSize',10)
    xticks([0 10 Critical_Angle_0(m,1) 20 ]);
    xticklabels({'0^o','10^o',['  \theta_c:' num2str(Critical_Angle_0(m,1)) '^o'] ,'20^o'});

    saveas(h,[txt1 txt2 txt5  txt4   txt7 txt6 ]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tp_1  ts_1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (refractive_index_Air > real(refractive_index(m,1)))
		h=figure; 
		plot(theta_0(:,1),tp(:,:,1),'--b',theta_0(:,1),ts(:,:,1),'r');
		title({[ txt1 txt2 txt5  ]; txt4} );
		xlabel('\theta_0 (degree)'); 
		ylabel('t_T_M and t_T_E '); 
		hold on;
		
		 y1=get(gca,'ylim');
		 plot([theta_0(j) theta_0(j)],[ y1 ],': k');
		 plot([theta_0(1) theta_0(j)],[ tp_m tp_m],': k');
		 plot([theta_0(1) theta_0(j)],[ ts_m ts_m],': k');
		 legend off;

		txt = '\leftarrow t_T_M ';
		text(theta_0(7500),tp(7500),txt,'FontSize',10)
		txt = '\leftarrow t_T_E ';
		text(theta_0(7500),ts(7500),txt,'FontSize',10)
		xticks([0 10 Critical_Angle_0(m,1) 20]);
		xticklabels({'0^o','10^o',['  \theta_c:' num2str(Critical_Angle_0(m,1)) '^o'],'20^o'});
		saveas(h,[txt1 txt2  txt5  txt4 txt9 txt6 ]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% (rp_1)^2   (rs_1)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (refractive_index_Air > real(refractive_index(m,1)))
			h=figure;
			plot(theta_0(:,1),rp(:,:,1).*rp(:,:,1),'--b',theta_0(:,1),rs(:,:,1).*rs(:,:,1),'r');
			title({[ txt1 txt2 txt5  ]; txt4} );
			xlabel('\theta_0 (degree)'); 
			ylabel('r_T_M^2 and r_T_E^2 '); 
			ylim([-0.2 1.2])
            xlim([0 20])

				 hold on;
				 rprp_min=0;
				for i=1:a(1)
					if (round(rp(i,:,1).*rp(i,:,1))==1);
						if(rp(i,:,1).*rp(i,:,1)>rprp_min)
							j=i;
							rprp_min=(rp(i,:,1)*rp(i,:,1));
							rsrs_m=(rs(i,:,1)*rs(i,:,1));
							tptp_m=(tp(i,:,1)*tp(i,:,1));
							tsts_m=(ts(i,:,1)*ts(i,:,1));
						end
					end
				end
    
				 y1=get(gca,'ylim');
				 plot([theta_0(j) theta_0(j)],[ y1],': k');
				 plot([theta_0(1) theta_0(j)],[ rprp_min  rprp_min],': k');
				 plot([theta_0(1) theta_0(j)],[ rsrs_m  rsrs_m],': k');

					txt = '\leftarrow r_T_M^2 ';
					text(theta_0(7500),abs(rp(7500)*rp(7500)),txt,'FontSize',10)

					txt = '\leftarrow r_T_E^2 ';
					text(theta_0(7500),abs(rs(7500)*rs(7500)),txt,'FontSize',10)

					txt = ['\leftarrow   \theta_c:(exp): ' num2str(theta_0(j)) '^o'];
					text(theta_0(j),abs(rp(j)*rp(j)),txt,'FontSize',10)

					xticks([0 10 Critical_Angle_0(m,1) 20 ]);
					xticklabels({'0^o', '10^o',['  \theta_c:' num2str(Critical_Angle_0(m,1)) '^o'] ,'20^o'});

				saveas(h,[txt1 txt2  txt5  txt4 txt8 txt6 ]);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%(tp_1)^2   (ts_1)^2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (refractive_index_Air > real(refractive_index(m,1)))
		h=figure;
		plot(theta_0(:,1),tp(:,:,1).*tp(:,:,1),'--b',theta_0(:,1),ts(:,:,1).*ts(:,:,1),'r');
		title({[ txt1 txt2 txt5  ]; txt4} );
		xlabel('\theta_0 (degree)'); 
		ylabel('t_T_M^2 and t_T_E^2 '); 
 		ylim([-0.2 1])
        xlim([0 20])
		legend off;
		hold on;
		
		y1=get(gca,'ylim');
		 plot([theta_0(j) theta_0(j)],[ y1],': k');
		 plot([theta_0(1) theta_0(j)],[ tptp_m  tptp_m],': k');
		 plot([theta_0(1) theta_0(j)],[ tsts_m  tsts_m],': k');

		txt = '\leftarrow t_T_M^2 ';
		text(theta_0(7500),abs(tp(7500)*tp(7500)),txt,'FontSize',10)

		txt = '\leftarrow t_T_E^2 ';
		text(theta_0(7500),abs(ts(7500)*ts(7500)),txt,'FontSize',10)


		xticks([0 10 Critical_Angle_0(m,1) 20]);
		xticklabels({'0^o','10^o', ['  \theta_c:' num2str(Critical_Angle_0(m,1)) '^o'] ,'20^o'});

		saveas(h,[txt1 txt2  txt5  txt4 txt10 txt6 ]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

		if(number_of_layers>2)


			for n=1:number_of_layers
				h=figure;  
				plot(theta_0, theta(:,:,n));
				title('Comparing \theta_i with \theta_0'  );
				xlabel('\theta_0'); 
				ylabel('\theta_i ');
				txt = ['\leftarrow \theta ' num2str(n)];
				text(theta_0(7500),theta(7500,:,n),txt,'FontSize',10)
				hold on;
			end

		 y1=get(gca,'ylim');
			 if (refractive_index_Air > real(refractive_index(m,1)))
				  plot([theta_0(j) theta_0(j)],[ y1 ],': k');
				 xticks([0 10 Critical_Angle_0(m,1) 20 ]);
				 xticklabels({'0^o','10^o',['  \theta_c:' num2str(Critical_Angle_0(m,1)) '^o'] ,'20^o'});
			 end
			 
			saveas(h,['Comparing theta with theta_0 ' txt4 txt6 ]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



				for n=2:number_of_layers
							if (real(refractive_index(m,n)) > real(refractive_index(m,n+1)))
					
						%%%%%%%%%%%%%%%%%%%%%%% rp_n   rs_n %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
						
							h=figure; 
							plot(theta(:,:,n-1),rp(:,:,n),'--b',theta(:,:,n-1),rs(:,:,n),'r');
							title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
							xlabel(['\theta' num2str(n-1) '(degree)']); 
							ylabel('r_T_M and r_T_E '); 
							hold on;
						
						
							a=size(theta_0);
							rp_min=0;
							for i=1:a(1)
								if (round(rp(i,:,n))==-1);
									if(rp(i,:,n)<rp_min)
										jn=i;
										rp_min=rp(i,:,n);
										rs_m=rs(i,:,n);
										tp_m=tp(i,:,n);
										ts_m=ts(i,:,n);
									end
								end
							end
						
							 y1=get(gca,'ylim');
							 plot([theta(jn,:,n-1) theta(jn,:,n-1)],[ y1 ],': k');
							 plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ rp_min rp_min],': k');
							 plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ rs_m rs_m],': k');

						txt = '\leftarrow r_T_M ';
						text(theta(4500,:,n-1),rp(4500,:,n),txt,'FontSize',10)
						txt = '\leftarrow r_T_E ';
						text(theta(5000,:,n-1),rs(5000,:,n),txt,'FontSize',10)
					%     xticks([0 10 Critical_Angle(m,n-1) 20  ]);
					%     xticklabels({'0^o','10^o',num2str(Critical_Angle(m,n-1))  ,'20^o'});

						saveas(h,[txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n) txt4   txt7 txt6 ]);

					%%%%%%%%%%%%%%%%%%%%%%%%%% (rp_n)^2 (rs_n)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%

					h=figure;
					plot(theta(:,:,n-1),rp(:,:,n).*rp(:,:,n),'--b',theta(:,:,n-1),rs(:,:,n).*rs(:,:,n),'r');
					title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
					xlabel(['\theta' num2str(n-1)  '(degree)']); 
					ylabel('r_T_M^2 and r_T_E^2 '); 
				    ylim([-0.2 1.2])
                    xlim([0 20])
					hold on;
					

					a=size(theta_0);
					rprp_min=0;
					for i=1:a(1)
						if (round(rp(i,:,n).*rp(1,:,n))==1);
							if(rp(i,:,n).*rp(i,:,n)>rprp_min)
								jjn=i;
								rprp_min=(rp(i,:,n)*rp(i,:,n));
								rsrs_m=(rs(i,:,n)*rs(i,:,n));
								tptp_m=(tp(i,:,n)*tp(i,:,n));
								tsts_m=(ts(i,:,n)*ts(i,:,n));
							end
						end
					end
					
					
					   
						 y1=get(gca,'ylim');
						 plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ y1],': k');
						 plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ rprp_min  rprp_min],': k');
						 plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ rsrs_m  rsrs_m],': k');
				%       
					
					txt = '\leftarrow r_T_M^2 ';
					text(theta(4500,:,n-1),abs(rp(4500,:,n).*rp(4500,:,n)),txt,'FontSize',10)
					txt = '\leftarrow r_T_E^2 ';
					text(theta(5000,:,n-1),abs(rs(5000,:,n).*rs(5000,:,n)),txt,'FontSize',10)

				%     txt = ['\leftarrow  \theta_B(exp): ' num2str(theta(j,:,n-1)) '^o'];
				%     text(theta(j,:,n-1),abs(rp(j,:,n)*rp(j,:,n)),txt,'FontSize',10)
				% 
				%     xticks([0 10 Critical_Angle(m,n-1) 20  ]);
				%     xticklabels({'0^o','10^o',[' \theta_B(theoretical):' num2str(Critical_Angle(m,n-1)) '^o'] ,'20^o'});

					saveas(h,[txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n) txt4   txt8 txt6 ]);


					
				   
					%%%%%%%%%%%%%%%%%%%%%%%%%%%% tp_n  ts_n %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
					h=figure; 
					plot(theta(:,:,n-1),tp(:,:,n),'--b',theta(:,:,n-1),ts(:,:,n),'r');
					title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
					xlabel(['\theta' num2str(n-1) '(degree)']); 
					ylabel('t_T_M and t_T_E '); 
					hold on;
					
						 y1=get(gca,'ylim');
						 plot([theta(jn,:,n-1) theta(jn,:,n-1)],[ y1 ],': k');
						 plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ tp_m tp_m],': k');
						 plot([theta(1,:,n-1)  theta(jn,:,n-1)],[ ts_m ts_m],': k');

					txt = '\leftarrow t_T_M ';
					text(theta(3500,:,n-1),tp(3500,:,n),txt,'FontSize',10)
					txt = '\leftarrow t_T_E ';
					text(theta(5000,:,n-1),ts(5000,:,n),txt,'FontSize',10)
				%     
				%     xticks([0 10 Critical_Angle(m,n-1) 20  ]);
				%     xticklabels({'0^o','10^o', num2str(Critical_Angle(m,n-1)),'20^o'});  
					saveas(h,[txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n) txt4   txt9 txt6 ]);
					
					
						%%%%%%%%%%%%%%%%%%%%%%%%%% (tp_n)^2 (ts_n)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%
				   
					h=figure;
					plot(theta(:,:,n-1),tp(:,:,n).*tp(:,:,n),'--b',theta(:,:,n-1),ts(:,:,n).*ts(:,:,n),'r');
					title({[ txt1 txt3 num2str(n-1) ' and ' txt3 num2str(n)  ];  txt4} );
					xlabel(['\theta' num2str(n-1) '(degree)']); 
					ylabel('t_T_M^2 and t_T_E^2 '); 
					hold on;
					
						 y1=get(gca,'ylim');
						 plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ y1],': k');
						 plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ tptp_m  tptp_m],': k');
						 plot([theta(jjn,:,n-1) theta(jjn,:,n-1)],[ tsts_m  tsts_m],': k');

					txt = '\leftarrow t_T_M^2 ';
					text(theta(3500,:,n-1),abs(tp(3500,:,n).*tp(3500,:,n)),txt,'FontSize',10)

					txt = '\leftarrow t_T_E^2 ';
					text(theta(5000,:,n-1),abs(ts(5000,:,n).*ts(5000,:,n)),txt,'FontSize',10)


				%     xticks([0 10 Critical_Angle(m,n-1) 20  ]);
				%     xticklabels({'0^o','10^o', num2str(Critical_Angle(m,n-1)),'20^o'});

					saveas(h,[txt1 txt3  num2str(n-1) ' and ' txt3 num2str(n) txt4 txt10 txt6 ]);
					
					
					end
				end
				
				
				
			
			
			
			
	end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rp_1astLayer   rs_1astLayer %%%%%%%%%%%%%%%%%%%%%%%%%%%



if (real(refractive_index(m,number_of_layers)) > real(refractive_index(m,number_of_layers+1)))

    h=figure; 
    plot(theta(:,:,number_of_layers),rp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),rs(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum' ];  txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('r_T_M and r_T_E '); 
    xlim([0 20])
    ylim([-1.2 1.2])
    hold on;
    box off;


    a=size(theta_0);
    rp_min=0;
    for i=1:a(1)
        if (round(rp(i,:,number_of_layers+1))==-1);
            if(rp(i,:,number_of_layers+1)<rp_min)
                jl=i;
                rp_min=rp(i,:,number_of_layers+1);
                rs_m=rs(i,:,number_of_layers+1);
                tp_m=tp(i,:,number_of_layers+1);
                ts_m=ts(i,:,number_of_layers+1);           
            end
        end
    end
    theta(jl,:,number_of_layers)
    cosd(theta(jl,:,number_of_layers))
    cos(theta(jl,:,number_of_layers))
    
    
    jl
    rs_m
	
	if(jl)
    
     y1=get(gca,'ylim');
     plot([theta(jl,:,number_of_layers) theta(jl,:,number_of_layers)],[ y1 ],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ rp_min rp_min],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ rs_m rs_m],': k');
    end
    
    txt = ['\leftarrow r_T_M=' num2str(abs(rp_min)) ];
    text(theta(jl,:,number_of_layers),rp_min ,txt,'FontSize',9)
    txt = ['\leftarrow r_T_E=' num2str(abs(rs_m)) ];
    text(theta(jl,:,number_of_layers),rs_m,txt,'FontSize',9)   
    xticks([0 10 Critical_Angle(m,number_of_layers) 20]);
    xticklabels({'0^o','10^o',['  \theta_c:' num2str(Critical_Angle(m,number_of_layers)) '^o'] ,'20^o'});

    saveas(h,[txt1 txt3 num2str(number_of_layers) ' and vacuum '  txt4   txt7 txt6 ]);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% (rp_1astLayer)^2   (rs_1astLayer)^2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    h=figure;
    plot(theta(:,:,number_of_layers),rp(:,:,number_of_layers+1).*rp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),rs(:,:,number_of_layers+1).*rs(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum'  ]; txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('r_T_M^2 and r_T_E^2 ');
    xlim([0 20])
    ylim([-0.2 1.2])
    hold on;
    box off;
    
    rprp_min=0;
    for i=1:a(1)
        if (round(rp(i,:,number_of_layers+1).*rp(i,:,number_of_layers+1))==1);
            if(rp(i,:,number_of_layers+1).*rp(i,:,number_of_layers+1)>rprp_min)
                jjl=i;
                rprp_min=(rp(i,:,number_of_layers+1)*rp(i,:,number_of_layers+1));
                rsrs_m=(rs(i,:,number_of_layers+1)*rs(i,:,number_of_layers+1));
                tptp_m=(tp(i,:,number_of_layers+1)*tp(i,:,number_of_layers+1));
                tsts_m=(ts(i,:,number_of_layers+1)*ts(i,:,number_of_layers+1));        
            end
        end
    end
    
    
    if(jjl)
     y1=get(gca,'ylim');
     plot([theta(jjl,:,number_of_layers) theta(jjl,:,number_of_layers)],[ y1],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ rprp_min  rprp_min],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ rsrs_m rsrs_m],': k');
	 end 

    
    txt = ['\leftarrow r_T_M^2= r_T_E^2=' num2str(abs(rprp_min)) ];
    text(theta(jjl,:,number_of_layers),rprp_min ,txt,'FontSize',9)
%     txt = ['\leftarrow r_T_E^2=' num2str(rsrs_m) ];
%     text(theta(jjl,:,number_of_layers),rsrs_m,txt,'FontSize',9)
    
    
    xticks([0 10 Critical_Angle(m,number_of_layers) 20]);
    xticklabels({'0^o','10^o',['  \theta_c:' num2str(Critical_Angle(m,number_of_layers)) '^o'] ,'20^o'});

    saveas(h,[txt1 txt3  num2str(number_of_layers) ' and vacuum' txt4 txt8 txt6 ]);



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tp_1astLayer  ts_1astLayer %%%%%%%%%%%%%%%%%%%%%%%%%%%%

    h=figure; 
    plot(theta(:,:,number_of_layers),tp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),ts(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum' ]; txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('t_T_M and t_T_E '); 
    hold on;
    box off;
    xlim([0 20])
    ylim([1 8.5])
    
    if(jl)
    y1=get(gca,'ylim');
     plot([theta(jl,:,number_of_layers) theta(jl,:,number_of_layers)],[ y1 ],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ tp_m tp_m],': k');
     plot([theta(1,:,number_of_layers) theta(jl,:,number_of_layers)],[ ts_m ts_m],': k');
    end
	
    txt = ['\leftarrow t_T_M=' num2str(abs(tp_m)) ];
    text(theta(jl,:,number_of_layers),tp_m ,txt,'FontSize',9)
    txt = ['\leftarrow t_T_E=' num2str(abs(ts_m)) ];
    text(theta(jl,:,number_of_layers),ts_m,txt,'FontSize',9)
    
    xticks([0 10 Critical_Angle(m,number_of_layers) 20]);
    xticklabels({'0^o','10^o',['  \theta_c:' num2str(Critical_Angle(m,number_of_layers)) '^o'],'20^o'});
    saveas(h,[txt1 txt3  num2str(number_of_layers) ' and vacuum' txt4 txt9 txt6 ]);

    %%%%%%%%%%%%%%%%%%%%%%%%%%(tp_1astLayer)^2   (ts_1astLayer)^2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    h=figure;
    plot(theta(:,:,number_of_layers),tp(:,:,number_of_layers+1).*tp(:,:,number_of_layers+1),'--b',theta(:,:,number_of_layers),ts(:,:,number_of_layers+1).*ts(:,:,number_of_layers+1),'r');
%     title({[ txt1 txt3  num2str(number_of_layers) ' and vacuum'  ]; txt4} );
    xlabel(['\theta_' num2str(number_of_layers) '(degree)']); 
    ylabel('t_T_M^2 and t_T_E^2 '); 
    hold on;
    box off;
    xlim([0 20])
    
	if(jjl)
    y1=get(gca,'ylim');
     plot([theta(jjl,:,number_of_layers) theta(jjl,:,number_of_layers)],[ y1],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ tptp_m  tptp_m],': k');
     plot([theta(1,:,number_of_layers) theta(jjl,:,number_of_layers)],[ tsts_m  tsts_m],': k');
    end 
     
    txt = ['\leftarrow t_T_M^2=' num2str(abs(tptp_m)) ];
    text(theta(jjl,:,number_of_layers),tptp_m,txt,'FontSize',9)

    txt = ['\leftarrow t_T_E^2=' num2str(abs(tsts_m)) ];
    text(theta(jjl,:,number_of_layers),tsts_m,txt,'FontSize',9)


    
    xticks([0 10 Critical_Angle(m,number_of_layers) 20]);
    xticklabels({'0^o', '10^o',['  \theta_c:' num2str(Critical_Angle(m,number_of_layers)) '^o'],'20^o'});

    saveas(h,[txt1 txt3  num2str(number_of_layers) ' and vacuum' txt4 txt10 txt6 ]);
end

end