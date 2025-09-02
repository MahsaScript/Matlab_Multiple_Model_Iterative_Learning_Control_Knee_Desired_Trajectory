function [] = plotter(y_desired,y_traditional_ILC,y_Model_Based_ILC, ii) 
x=@(t)t;
z=8;
t=0:0.01:8;
if ii==1
     figure(1);
     plot(x(t),y_desired(t),'color', [0 0 0],'linestyle','-','marker','.','markersize',4)
     hold on;
     plot(x(t),y_Model_Based_ILC(t),'color', [0 0 1],'linestyle','-','marker','.','markersize',4)
     hold on;
     plot(x(t),y_traditional_ILC(t),'color', [1 0 0],'linestyle','-','marker','.','markersize',4)
     title("Process of 1-th Iteration",'FontSize',14);
      ylabel('qd, q(deg)','FontSize',11);
      xlabel('Time (s)','FontSize',12);
      ylim([0 50]);
      xlim([0 7]);
      legend("Desired Trajectory","Traditional ILC","Model Based ILC");
      pause(eps);

 elseif ii==5
     figure(2);
      plot(x(t),y_desired(t),'color', [0 0 0],'linestyle','-','marker','.','markersize',4)
 hold on;
 plot(x(t),y_Model_Based_ILC(t),'color', [0 0 1],'linestyle','-','marker','.','markersize',4)
 hold on;
 plot(x(t),y_traditional_ILC(t),'color', [1 0 0],'linestyle','-','marker','.','markersize',4)

%  axis([0  1 -1 1])
 title("Process of 5-th Iteration",'FontSize',14);
  ylabel('qd, q(deg)','FontSize',11);
  xlabel('Time (s)','FontSize',12);
  ylim([0 50]);
  xlim([0 7]);
  legend("Desired Trajectory","Traditional ILC","Model Based ILC");
 pause(eps);
 elseif ii==10
     figure(3);
      plot(x(t),y_desired(t),'color', [0 0 0],'linestyle','-','marker','.','markersize',4)
 hold on;
 plot(x(t),y_Model_Based_ILC(t),'color', [0 0 1],'linestyle','-','marker','.','markersize',4)
 hold on;
 plot(x(t),y_traditional_ILC(t),'color', [1 0 0],'linestyle','-','marker','.','markersize',4)

%  axis([0  1 -1 1])
 title("Process of 10-th Iteration",'FontSize',14);
  ylabel('qd, q(deg)','FontSize',11);
  xlabel('Time (s)','FontSize',12);
  ylim([0 50]);
  xlim([0 7]);
  legend("Desired Trajectory","Traditional ILC","Model Based ILC");
 pause(eps);
 end
 
 
end