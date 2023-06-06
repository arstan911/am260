clear all; close all; 
data = importdata('output.dat');
x = linspace(0,1,length(data(1,2:end)));

% *** time-series solution ***
% figure
% for t = 1:length(data(:,1))
%     u = data(t,2:end);
%     plot(x,u,'ro:','linewidth',1.2); grid minor
%     ylabel('u(x,t)'); xlabel('x(t)')
%     xlim([0,1]); ylim([0.8,2.1])
%     pause(0.1)
% end

% *** Continuous IC ***
% uncomment for setup
%U = sin(2 * pi * x);

% *** Discontinuous IC ***
% uncomment for setup
% U = []; 
% xd = 0.5;
% uL = -1.0;
% uR = 1.0;
% 
% for i = 1:length(x)
%     if x(i) <= xd
%         U(i) = uL;
%     else
%         U(i) = uR;
%     end
% end 

% *** Discontinuous IC with two intervals *** 
% uncomment for setup
% !U = []; 


for i = 1:length(x)
    U(i)=2.0
    if x(i) > 0.5
        U(i) = -1
    end 
end 

% plotting data 
figure
    hold on
    plot(x,data(1,2:end),'ro:','linewidth',1.2, ...
        'displayname','FOG'); 
    plot(x,U,'linewidth',1.0,'color','k','displayname','Actual')
    grid minor
    ylabel('u(x,t)'); xlabel('x(t)')
    xlim([0,1]); ylim([-8.1,5.1])
    title('nonlinear two oppositely-moving shocks evolving into one standing shock')
    legend('location','northeast')
    hold off

