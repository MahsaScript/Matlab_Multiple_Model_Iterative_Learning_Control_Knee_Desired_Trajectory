

load('pulseex.mat','x','t')
w = pulsewidth(x,t);
pulsewidth(x,t);


% clear all;clc
% x=[0:.01:16]
% y=sin(3*x)
% figure(1);hold all
% Dx=50;y1=-1.2;y2=1.2;
% for n=1:1:numel(x)
%       plot(x,y);axis([x(n) x(n+Dx) y1 y2]);drawnow
% end
% x=@(t)(sin(4*t)).^2;
%----------------------------------------------
% x=@(t)t^2;
% y=@(t)sin(5*t);
% z=pi;
% figure(1)
% for t=0:0.002:0.5
%     plot(x(t),y(t),'.','MarkerSize',4,'color',[0,(t+z)/(2*z),(t+z)/(2*z)])
%     axis([0  1 -1 1])
%     hold on
%     pause(eps)
% end
%-------------------------------------------------
%  axis([0,11,-1,1]);
%     h=gca;
%     hold on
%     h.YLimMode='manual';
%     for i=1:100, 
%        plot(1:10,rand(1,10));
%        pause(.3); 
%        drawnow
%        cla
%     end
%     hold off

% t = 0:0.01:0.5;
% xmin=0.8;
% xmax=4;
% n=51;
% x=xmin+rand(1,n)*(xmax-xmin);
% 
% H = plot(t,x(1, 51));
% for k = 1:51
%   pause(0.5);
%   set(H, 'YData', x(1, k));
% end
% ydata=rand(2000,2000);xdata=1:size(ydata,1); %random data
% for i=handles.old_pause_data:size(ydata,2)
% delay=str2num(get(handles.delaytime,'String')); % getting delay time from the edit text box
% if get(handles.play_button,'Value')==1 % check to pause or play 
% plot(handles.axes1,xdata,ydata(:,i)) % plot the data
% pause(delay) % delay for the given time
% else
% handles.old_pause_data=i; % save the pasued value. 
% break
% end
% end
% guidata(hObject,handles)

% alpha = 0.4;
% beta = 0.8;
% gamma = 0.7;
% delta = 1;
% epsilon = 0.5;
% eta = 0.9;
% lambda = 0.6;
% xold = 0.8;
% yold = 0.8;
% zold = 0.8;
% tMin = 0;
% tMax = 50;
% tChange = 0.001;
% figure;
% subplot(1,2,1);
% hold on;
% grid on;
% axis( [-0.2 2 0.1 2 0.1 2]);
% title ('Populations of foxes rabbits and chickens');
% xlabel ('Population of chickens');
% ylabel ('Population of rabbits');
% zlabel ('Population of foxes');
% xs = []; ys = []; zs = []; ts = [];
% subplot(1,2,2);
% hold on;
% axis([tMin tMax 0.5 2.2]);
% title('Population');
% xlabel('Time');
% ylabel('Population size');
% for t = tMin:tChange:tMax;
%     xs = [xs, xold]; ys = [ys, yold]; zs = [zs, zold]; ts = [ts, t];
%     yNew = yold+tChange*(delta-epsilon*zold);
%     xNew = xold+tChange*(eta-lambda*zold);
%     zNew = zold+tChange*(beta*yold-alpha*zold+gamma*xold);
%       xold = xNew;
%       yold = yNew;
%       zold = zNew;
%       if mod(t,1)==0
%           subplot(1,2,1);
%           plot3(xs, ys, zs,'r.');
%           grid on
%           subplot(1,2,2);
%           plot(ts,xs,'b.',ts,ys,'g.',ts,zs,'c.');
%           legend('Chickens','Rabbits','Foxes');
%           pause(0.01);
%       end
%   end

% figure;
%  t = 0:Ts:8;
% 
%   Y_desired = 20*sin(((5*pi*t)/16)-(pi/2))+20;
%   t_desired= (0:0.01:8);
%   plot(t_desired,Y_desired);
%   title('Process of 1th Iteration','FontSize',14);
%   ylabel('qd, q(deg)','FontSize',11);
%   xlabel('Time (s)','FontSize',12);
%   ylim([0 50])
%   xlim([0 7])