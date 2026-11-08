n = 3;
%�Ա���
P_w = sdpvar(TIME,1,'full');                                                %������ MW
P_u = sdpvar(TIME,NUMOFTHERMAL,'full');                                     %�ȵ糧���� MW
P_z = binvar(TIME,1,'full');
P_C = sdpvar(TIME,1,'full');                                                %EV��繦�� MW
P_D = sdpvar(TIME,1,'full');                                                %EV�ŵ繦�� MW
if ~exist('rootDir', 'var')
    rootDir = setup_ev_wind();
end

Constraints = [];
% EVԼ��, ����
EV_Aggregator3;
Constraints = [Constraints,constraints1];

%�ȵ糧ģ�� OMEGA2 Լ��������
Thermal_constraints;
Constraints = [Constraints,Constraints2];

%ϵͳԼ��
for k=1:TIME
    Constraints = [Constraints,0 <= P_w(k) <= P_w_max(k)];              %������Լ��
    Constraints = [Constraints,P_w(k)+sum(P_u(k,:))-P_ld(k)-P_C(k)+P_D(k) == 0];%����ƽ��
end
%ʵ��
shiji;
P_C_pai = sum(P_C_shiji(:,2:end),1)'/1000; 
for k=1:TIME
    Constraints = [Constraints, -0.1 <= P_C_pai(k)- P_C(k)+ P_D(k) <= 0.1];              %ʵ�ʳ���Լ��
end

Z_u = 0;
for k=1:TIME
    Z_u = Z_u+sum(P_u(k,:).^2*a_f'+b_f*P_u(k,:)'+c_f);           %�ȵ糧�ɱ�
end
Z_u = Z_u/4;
Z_CD = (-PI_C(n)*sum(P_C)*1000 + PI_D(n)*sum(P_D)*1000)*delta_t;               %EV��ŵ�ɱ�
Z = Z_u+Z_CD;


ops = sdpsettings('debug',1,'solver','cplex','savesolveroutput',1,'savesolverinput',1);
optimize(Constraints,Z,ops)

%%
stairs(P_C,'y','LineWidth',2); hold on;
stairs(value(P_D),'m','LineWidth',2); hold on;
stairs(value(sum(P_u,2)),'r','LineWidth',2); hold on;
stairs(P_w_max,'b--','LineWidth',1); hold on;
stairs(value(P_w),'b','LineWidth',2);hold on;
stairs(P_ld,'black'); 

%����figure��������
t1 = title('������ģʽ(ʵ�ʣ�','FontSize',24);
x1 = xlabel('ʱ��㣨18:00-8:00��15minΪ�����','FontSize',18);          %����������tex����
y1 = ylabel('����/MW','FontSize',18);
t1.FontName = '����';                   %�����ʽ����Ϊ���壬���������
x1.FontName = '����'; 
y1.FontName = '����'; 
legend('�綯��������ܹ���','�綯�����ŵ��ܹ���','��糧�ܳ���', ...
    '��������','ʵ�ʷ������','��������');
saveas(gcf,fullfile(rootDir,'�����ţ�ʵ�ʣ�.jpg')); %���浱ǰ���ڵ�ͼ��
zacconut=[zacconut,value(Z)];
zgiveup=[zgiveup,100*sum(P_w_max-value(P_w))/sum(P_w_max)];%������
zshuju=[zshuju,value(P_C),value(P_D),value(sum(P_u,2)),value(P_w)];
% close;
% P_u_result = [P_u_result(:,1:8),value(P_u)];
% P_w_result = [P_w_result(:,1:2),value(P_w)];
% P_C_result = [P_C_result(:,1),value(P_C)];
% P_D_result = value(P_D);