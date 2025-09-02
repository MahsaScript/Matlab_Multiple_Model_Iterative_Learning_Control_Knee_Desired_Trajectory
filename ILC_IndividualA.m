function [ ] = ILC_IndividualA(Ts, mgl, lambda, Theta0, Mu, J, pw_threshold, pw_saturation)
    % Initial condition x0, time range t - assume 8 second, pure time delay n0, relative
    % degree r, and matrix size N   
    %****Desired=@(t)20*sin(((5*pi*t)/16)-(pi/2))+20;
    load('pulseex.mat','x','t')
    pw = pulsewidth(x,t);
%     pulsewidth(x,t);
    x0 = 0;
    t = 0:Ts:8;
    n0 = 0;
    r = 1;
    N = length(t);
    k=10; %iteration number

     % Define input vector U and reference J - Refernce = input for this example
    y_desired=@(t)20*sin(((5*pi*t)/16)-(pi/2))+20;
    for t=0:0.01:8
        y_desired(t);
    end

    % G0 not formulated as initial condition is 0
    % Formulate G
    mglT= (mgl);
    lambdaT= (lambda);
    Theta0T= (Theta0);
    MuT= (Mu);
    JT= (J);
     pt=zeros(1,801);%p(t)
      pw_MM=zeros(1,801);%p(t)
%      phi=@(t)sin(5*t);
%     phi=@(t)JT*t + mglT*sin(Theta0T*t)+(lambdaT*(abs(Theta0T*t-Theta0T)))+MuT*Theta0T*t;
    for t=0:0.01:8
         pt(1:t)=JT*t + mglT*sin(Theta0T*t)+(lambdaT*(abs(Theta0T*t-Theta0T)))+MuT*Theta0T*t;
    end
        %pulse width sequence calculated by the musculoskeletal model
        %pw_thereshold: if p(t)<=0
        %p(t)(pwsat − pwthr ) + pwthr if: 0<p(t)<1
        %pwsat if  p(t)>=1
         for t=0:0.01:8
             if (pt(1:t)==0)
                pw_MM(1:t)= mean(pw_thereshold)*pt(1:t);
             elseif( (0<pt(1:t)) & (pt(1:t)<1))
                pw_MM(1:t)= pt(1:t)*(mean(pw_saturation) - mean(pw_thereshold)) + mean(pw_thereshold);
             elseif( pt(1:t)>=1)
                pw_MM(1:t)=mean(pw_saturation) ;
             end
        end
        
    % Set up ILC
    k = 10; %iteration number
%     
    kp = 2.35; 
    kd = 7.21; 
    kde=0.05;
    kdeco=0.0000005;
    kdco=0.7;
% %     
    Theta_desired=40;
    Theta0_=20;
    pw0=0;
    Uold=pw0;
    Eold=pw0;
    % Run ILC and plot the response for each iteration
    % kp and kd => are both PID Parameteres
    % u_k+1(t) = uk(t) + kp(Theta_d(t) - Theta(t)) + kd(Theta_prim_d(t) - Theta_prim(t))
    % u0(t) = pw(t)
%         y_desired=@(t)20*sin(((5*pi*t)/16)-(pi/2))+20;
  error_Model_Based_ILC=zeros(1,10);
  error_traditional_ILC=zeros(1,10);
  
    for ii = 1:k
      % Compute y_traditional_ILC
       Utrad=Uold+ kp*(Theta_desired-Theta0_)+kd*mean(pt);
       if (ii>1)& (ii<7)
           y_traditional_ILC=@(t)(Utrad/10)*sin(((((Utrad/25))*pi*t)/16)-(pi/2))+(Utrad/10);
       elseif(ii>8)
            y_traditional_ILC=@(t)(Utrad/10)*sin(((((Utrad/35))*pi*t)/16)-(pi/2))+(Utrad/10);
       else
            y_traditional_ILC=@(t)(Utrad/10)*sin(((((Utrad/10))*pi*t)/16)-(pi/2))+(Utrad/10);
       end 
       
         Etrad=Eold+ kp*(Theta_desired-Theta0_)+kde*mean(pw_MM);
        
        y_Model_Based_ILC=@(t)(Etrad/2.2)*sin((((Etrad/10)*pi*t)/16)-(pi/2))+(Etrad/2);
        for t=0:0.01:8
            y_traditional_ILC(t);
           
            y_Model_Based_ILC(t); 
        end
      Eold = kdeco*ii + kdeco*Etrad;
      Uold = kdco*ii + kdco*Utrad;

      %Compute RMSE
%       error_Model_Based_ILC(1:k)=sqrt(sum((y_Model_Based_ILC(t)- y_desired(t)).^2)/numel(qactual(t)));

  error_Model_Based_ILC(1,ii) = RMSE(y_Model_Based_ILC(ii), y_desired(ii));
  error_traditional_ILC(1,ii) = RMSE(y_traditional_ILC(ii), y_desired(ii));

      if (ii==5 || ii==5 || ii==10)
        plotter_IndividualA(y_desired,y_Model_Based_ILC,y_traditional_ILC);
      end  
    end
    
    plotter_RMSE(error_Model_Based_ILC(:),error_traditional_ILC(:));
end
