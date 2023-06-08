clear all; close all

data = importdata('output_PLM_limiter_1.dat');

x = linspace(0,1,length(data(1,2:end)));

figure(1)
plot(x,data(1,2:end))
hold on
grid minor
plot(x,data(end,2:end))
hold off

%figure(2)
 %   for t = 1:length(data(:,1))
  %      u = data(t,2:end);
   %     plot(x,u,'linewidth',1.5)
        %xlim([0,1])
        %ylim([-1.1,1.1])
    %    grid minor
     %  pause(2.0)

        %if t == 12
        %    break 
        %end
    %end
