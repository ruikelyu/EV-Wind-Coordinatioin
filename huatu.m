if ~exist('rootDir', 'var')
    rootDir = setup_ev_wind();
end


stairs(P_C,'r','LineWidth',1); hold on;
stairs(value(P_w),'b--','LineWidth',2);  ylim([-25 200]);
ha=gca;
%����figure��������

t1 = title('������ģʽ','FontSize',24);
x1 = xlabel('ʱ��㣨18:00-8:00��15minΪ�����','FontSize',18);          %����������tex����
y1 = ylabel('����/MW','FontSize',18);
t1.FontName = '����';                   %�����ʽ����Ϊ���壬���������
x1.FontName = '����'; 
y1.FontName = '����'; 
legend('EV��繦��','ʵ�ʷ������');
saveas(gcf,fullfile(rootDir,'������.jpg')); %���浱ǰ���ڵ�ͼ��
zacconut=[Z_CD];%��¼�ܳɱ�
zuacconut=[value(Z_u)];%��¼�ܳɱ�
zgiveup=100*sum(P_w_max-value(P_w))/sum(P_w_max);%������
zshuju=[P_C,value(sum(P_u,2)),value(P_w)];