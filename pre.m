clc; clear;
rootDir = fileparts(mfilename('fullpath'));
addpath(rootDir);
setup_ev_wind();
% wind_curtailment1=[];
% totalcost=[];
% for ratio=[0.5,1,1.5,2]%����������Ϊ ��
ratio=1;
     Top_system1;  
%     wind_curtailment1=[wind_curtailment1;zgiveup*sum(P_w_max)/100];%������
%     totalcost=[totalcost;zuacconut];
% end
% % zgiveup=[zgiveup,100*sum(P_w_max-value(P_w))/sum(P_w_max)];%������










%%
% 
% clc; clear;
% ratio=1;   %����������Ϊ ��
% carbon_price;
% wind_curtailment2=zgiveup;


% data = wind_curtailment1;
 data = totalcost;
%  data = wind_curtailment1;
b = bar(data);
   ylim([300000 350000]);
t1 = title('����ܳɱ�','FontSize',24);
x1 = xlabel('��͸�ʣ�ԭ�е�[0.5,1,1.5,2])��','FontSize',18);          %����������tex����
y1 = ylabel('�ܳɱ���$/MWh)','FontSize',18);
t1.FontName = '����';                   %�����ʽ����Ϊ���壬���������
x1.FontName = '����'; 
y1.FontName = '����'; 
legend('������','������ģʽ','������ģʽ');
saveas(gcf,fullfile(rootDir,'����ܳɱ�.jpg')); %���浱ǰ���ڵ�ͼ��
