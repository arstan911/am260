clear all; close all

data1 = importdata('output_FOG.dat');
data2 = importdata('output_PLM_limiter_4.dat');
data3 = importdata('output_PLM_limiter_5.dat');
data4 = importdata('output_PLM_limiter_6.dat');

x1 = linspace(0,1,length(data1(1,2:end)));
x2 = linspace(0,1,length(data2(1,2:end)));
x3 = linspace(0,1,length(data3(1,2:end)));
x4 = linspace(0,1,length(data4(1,2:end)));


figure(1)
plot(x1,data1(1,2:end),'DisplayName','INITIAL')
hold on
grid minor
plot(x1,data1(end,2:end),'-','LineWidth',1.5, 'DisplayName','FOG')
plot(x2,data2(end,2:end),'--o','LineWidth',1.5,'DisplayName','PLM minmod')
plot(x3,data3(end,2:end),'--x','LineWidth',1.5,'DisplayName','PLM MC')
plot(x4,data4(end,2:end),'--square','LineWidth',1.5,'DisplayName','PLM van Leer')

legend()
title("Solutions for case 1, Ca = 0.9, N = 32")
hold off

%figure(2)
 %   for t = 1:length(data1(:,1))
  %      u = data1(t,2:end);
   %     plot(x,u,'linewidth',1.5)
    %    xlim([0,1])
     %   ylim([-1.1,1.1])
      %  grid minor
       % pause(1.0)

 
     %end
