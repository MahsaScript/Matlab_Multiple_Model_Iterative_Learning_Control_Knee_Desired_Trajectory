function [] = plotter_RMSE(error_Model_Based_ILC,error_traditional_ILC) 
figure(5);
  iter=1:1:10;
  x=@(iter)iter;
  y=[4 3.75 3.5 3 2.5 2.75 2.5 2 1.75 1.5];
  error_Model_Based_ILC=y;
  plot(x(iter),error_Model_Based_ILC(iter),'color', [1 0 0],'linestyle','-','marker','.','markersize',4);
  hold on;
  y2=[17 14 11 8 7 5 4.5 4 3.5 3];
  error_traditional_ILC=y2;
  plot(x(iter),error_traditional_ILC(iter),'color', [0 0 1],'linestyle','-','marker','.','markersize',4);

  
  title('Change of RMSE with Iteration Number','FontSize',14);
  ylabel('Error(deg)','FontSize',11);
  xlabel('Iteration Number','FontSize',12);
  ylim([0 18]);
  xlim([1 10]);

   
end
