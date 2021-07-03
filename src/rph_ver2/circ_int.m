tic
clear all % clear all variables
close all  

%% ASD
jasd=7;
jvsd=8;
jd=9;

int_vec = (0 : 0.2 : 1) / 100
m_vec = 50.08;
ncase_asd = length(int_vec);

num_cycles_for_mean = 5;

disease_state = true;
do_exercise = true;
disease_state_pre = false;
Rp_state = false

% mean value for above variables
if (disease_state == true) 
    qs_asd_vecA = zeros(1,ncase_asd);
    ppa_asd_vecA = zeros(1,ncase_asd);
    ppv_asd_vecA = zeros(1,ncase_asd);
    psa_asd_vecA = zeros(1,ncase_asd);
    oxy_sa_asd_vecA = zeros(1,ncase_asd);
    oxy_pa_asd_vecA = zeros(1,ncase_asd);
    
    for iA = 1:length(int_vec)
        j_shunt = jasd
        Ashunt = int_vec(iA);
        for iEE = 1:length(m_vec)
            m_set = m_vec(iEE);
            HR_set = 0.94 * (m_set - 16.8) + 80;
            Rs_set = (17.5 * 80)/HR_set;
            circ;     
            qs_asd_vecA(iA) = meanvalue(Q_plot(js,:), klokmax, T, dt, num_cycles_for_mean);
            ppa_asd_vecA(iA) = meanvalue(P_plot(ipa,:), klokmax, T, dt, num_cycles_for_mean);
            ppv_asd_vecA(iA) = meanvalue(P_plot(ipv,:), klokmax, T, dt, num_cycles_for_mean);
            psa_asd_vecA(iA) = meanvalue(P_plot(isa,:), klokmax, T, dt, num_cycles_for_mean);
            oxy_sa_asd_vecA(iA) = meanvalue(O2_plot(isa,:), klokmax, T, dt, num_cycles_for_mean);
            oxy_pa_asd_vecA(iA) = meanvalue(O2_plot(ipa,:), klokmax, T, dt, num_cycles_for_mean);
        end
    end
end

%% VSD
jasd=7;
jvsd=8;
jd=9;

int_vec = (0 : 0.2 : 1) / 100
m_vec = 50.08;
ncase_vsd = length(int_vec);

num_cycles_for_mean = 5;

disease_state = true;
do_exercise = true;
disease_state_pre = false;
Rp_state = false

if (disease_state == true)
    qs_vsd_vecV = zeros(1,ncase_vsd);
    ppa_vsd_vecV = zeros(1,ncase_vsd);
    ppv_vsd_vecV = zeros(1,ncase_vsd);
    psa_vsd_vecV = zeros(1,ncase_vsd);
    oxy_sa_vsd_vecV = zeros(1,ncase_vsd);
    oxy_pa_vsd_vecV = zeros(1,ncase_vsd);
    
    for iV = 1:length(int_vec)
        j_shunt = jvsd
        Ashunt = int_vec(iV);
        for iEE = 1:length(m_vec)
            m_set = m_vec(iEE);
            HR_set = 0.94 * (m_set - 16.8) + 80;
            Rs_set = (17.5 * 80)/HR_set;
            circ; 
            qs_vsd_vecV(iV) = meanvalue(Q_plot(js,:), klokmax, T, dt, num_cycles_for_mean);
            ppa_vsd_vecV(iV) = meanvalue(P_plot(ipa,:), klokmax, T, dt, num_cycles_for_mean);
            ppv_vsd_vecV(iV) = meanvalue(P_plot(ipv,:), klokmax, T, dt, num_cycles_for_mean);
            psa_vsd_vecV(iV) = meanvalue(P_plot(isa,:), klokmax, T, dt, num_cycles_for_mean);
            oxy_sa_vsd_vecV(iV) = meanvalue(O2_plot(isa,:), klokmax, T, dt, num_cycles_for_mean);
            oxy_pa_vsd_vecV(iV) = meanvalue(O2_plot(ipa,:), klokmax, T, dt, num_cycles_for_mean);
        end
    end
end 

%% Potts shunt
jasd=7;
jvsd=8;
jd=9;

int_vec = (0 : 0.2 : 1) / 100
m_vec = 50.08;
ncase_d = length(int_vec);

num_cycles_for_mean = 5;

disease_state = true;
do_exercise = true;
disease_state_pre = false;
Rp_state = false

if (disease_state == true)
    qs_d_vecD = zeros(1,ncase_d);
    ppa_d_vecD = zeros(1,ncase_d);
    ppv_d_vecD = zeros(1,ncase_d);
    psa_d_vecD = zeros(1,ncase_d);
    oxy_sa_d_vecD = zeros(1,ncase_d);
    oxy_pa_d_vecD = zeros(1,ncase_d);
    for iDD = 1:length(int_vec)
        j_shunt = jd
        Ashunt = int_vec(iDD);
        for iEE = 1:length(m_vec)
            m_set = m_vec(iEE);
            HR_set = 0.94 * (m_set - 16.8) + 80;
            Rs_set = (17.5 * 80)/HR_set;
            circ; 
            qs_d_vecD(iDD) = meanvalue(Q_plot(js,:), klokmax, T, dt, num_cycles_for_mean);
            ppa_d_vecD(iDD) = meanvalue(P_plot(ipa,:), klokmax, T, dt, num_cycles_for_mean);
            ppv_d_vecD(iDD) = meanvalue(P_plot(ipv,:), klokmax, T, dt, num_cycles_for_mean);
            psa_d_vecD(iDD) = meanvalue(P_plot(isa,:), klokmax, T, dt, num_cycles_for_mean);
            oxy_sa_d_vecD(iDD) = meanvalue(O2_plot(isa,:), klokmax, T, dt, num_cycles_for_mean);
            oxy_pa_d_vecD(iDD) = meanvalue(O2_plot(ipa,:), klokmax, T, dt, num_cycles_for_mean);
        end
    end
end 
%, int_vec*100, qs_vsd_vecV, int_vec*100, qs_d_vecD

if (length(int_vec) > 0)

      ns = (T/dt)*10;
      Vtot = sum(V_plot, 1);      
      fprintf('\n%s %f %s\n','Total blood volume is ', Vtot(end), ' liters');
      fprintf('%s %f %s\n\n','Cardiac ouput is ', qs_asd_vecA(end), ' (L/min)');
      fprintf('%s %f %s\n','Stroke volume from LV is ', 1000*(max(V_plot(iLV,(klokmax-ns+1):klokmax)) - min(V_plot(iLV,(klokmax-ns+1):klokmax))), ' mL');
      fprintf('%s %f %s\n','Stroke volume from RV is ', 1000*(max(V_plot(iRV,(klokmax-ns+1):klokmax)) - min(V_plot(iRV,(klokmax-ns+1):klokmax))), ' mL');
      
      fprintf('%s %f %s\n','Diastolic systemic arterial pressure is ', min(P_plot(isa,(klokmax-ns+1):klokmax)), ' mmHg');
      fprintf('%s %f %s\n','Systolic systemic arterial pressure is ', max(P_plot(isa,(klokmax-ns+1):klokmax)), ' mmHg');
      fprintf('%s %f %s\n','Mean systemic arterial pressure is ', psa_asd_vecA(1), ' mmHg');

      fprintf('%s %f %s\n','Diastolic pulmonary arterial pressure is ', min(P_plot(ipa,(klokmax-ns+1):klokmax)), ' mmHg');
      fprintf('%s %f %s\n','Systolic pulmonary arterial pressure is ', max(P_plot(ipa,(klokmax-ns+1):klokmax)), ' mmHg');
      fprintf('%s %f %s\n\n','Mean pulmonary arterial pressure is ', ppa_asd_vecA(1), ' mmHg');
 
      

figure(500)
plot(int_vec*100, ppa_asd_vecA, '-o', int_vec*100, ppa_vsd_vecV, '-o', int_vec*100, ppa_d_vecD, '-o','linewidth', 4)
set(gca,'FontSize',25)
title('Pulmonary Artery Pressure','FontSize',22,'FontWeight','Normal')
legend({'ASD','VSD','Potts Shunt'},'Location', 'best','FontSize',18) 
legend boxoff                  
xlabel('Shunt Area (cm^2)','FontSize', 22) 
ylabel('Pressure (mmHg)','FontSize', 22)
grid on

figure(501)
plot(int_vec*100, psa_asd_vecA, '-o', int_vec*100, psa_vsd_vecV, '-o', int_vec*100, psa_d_vecD, '-o','linewidth', 4)
set(gca,'FontSize',25)
title('Systemic Artery Pressure','FontSize', 22,'FontWeight','Normal')
legend({'ASD','VSD','Potts Shunt'},'Location', 'best','FontSize',18) 
legend boxoff 
xlabel('Shunt Area (cm^2)','FontSize', 22) 
ylabel('Pressure (mmHg)','FontSize', 22)
grid on

figure(502)
plot(int_vec*100, ppv_asd_vecA, '-o', int_vec*100, ppv_vsd_vecV, '-o', int_vec*100, ppv_d_vecD, '-o','linewidth', 4)
set(gca,'FontSize',25)
title('Pulmonary Vein Pressure','FontSize', 22,'FontWeight','Normal')
legend({'ASD','VSD','Potts Shunt'},'Location', 'best','FontSize',18) 
legend boxoff 
xlabel('Shunt Area (cm^2)','FontSize', 22) 
ylabel('Pressure (mmHg)','FontSize', 22)
grid on

figure(600)
plot(int_vec*100, qs_asd_vecA, '-o', int_vec*100, qs_vsd_vecV, '-o', int_vec*100, qs_d_vecD, '-o','linewidth', 4)
title('Systemic Flow','FontWeight','Normal')
legend({'ASD','VSD', 'Potts Shunt'},'Location', 'best','FontSize',17, 'Box','off') 
xlabel('Shunt Area (cm^2)') 
ylabel('Systemic Flow (L/min)')
set(gca,'FontSize',20)
grid on

figure(601)
plot(int_vec*100, 10.*oxy_sa_asd_vecA, '-o', int_vec*100, 10.*oxy_sa_vsd_vecV, '-o', int_vec*100, 10.*oxy_sa_d_vecD,'-o','linewidth', 4)
title('Oxygen Saturation','FontWeight','Normal')
legend({'ASD','VSD', 'Potts Shunt'},'Location', 'best','FontSize',17, 'Box','off') 
xlabel('Shunt Area (cm^2)') 
ylabel('Oxygen Saturation (%)')
set(gca,'FontSize',20)
grid on

figure(602)
plot(int_vec*100, qs_asd_vecA.*oxy_sa_asd_vecA, '-o', int_vec*100, qs_vsd_vecV.*oxy_sa_vsd_vecV, '-o',int_vec*100, qs_d_vecD.*oxy_sa_d_vecD,'-o','linewidth', 4)
title('Oxygen Delivery','FontWeight','Normal')
legend({'ASD','VSD', 'Potts Shunt'},'Location', 'best','FontSize',17, 'Box','off') 
xlabel('Shunt Area (cm^2)') 
ylabel('Oxygen Delivery (mmol/min)')
set(gca,'FontSize',20)
grid on

end

toc
