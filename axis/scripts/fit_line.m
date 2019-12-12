% function [a,resnorm] = fit_line(a0,data)
%     % 对三维数据进行直线拟合，将直线拟合成如下形式：
%     % x-a(1)    y-a(2)    z-a(3)
%     % ------ = ------ = ------
%     %  a(4)        a(5)       a(6)
%     % 原理：下面的 d 是各数据点到拟合直线的距离，利用 lsqnonlin 对 d 进行最小二乘
%
%     % a0 是初始值，data 是三维数据，第一行是 x，第二行是 y，第三行是 z
%     % by GoKu
%     [a,resnorm] = lsqnonlin(@fit_line_fun,a0);
%
%     function d=fit_line_fun(a)
%         % 传给主函数的子函数
%         xdata=data(1,:);
%         ydata=data(2,:);
%         zdata=data(3,:);
%
%         point=a(1:3);
%         v=a(4:6);
%
%         d(1:length(xdata))=0;
%
%         for n=1:length(xdata)
%             m=[xdata(n);ydata(n);zdata(n)]-point(:);
%             d(n)=norm(cross(m,v(:)))/norm(v(:));
%             % 利用解析几何的知识求距离 d
%         end
%
%     end
%
% end

function [a,resnorm] = fit_line(a0,data)
% 对三维数据进行直线拟合，将直线拟合成如下形式：
% x-a(1)    y-a(2)  z-a(3)
% ------ = ------ = ------
%  a(4)     a(5)     a(6)
% 原理：下面的 d 是各数据点到拟合直线的距离，利用 lsqnonlin 对 d 进行最小二乘
% a0 是初始值，data 是三维数据，第一行是 x，第二行是 y，第三行是 z
[a,resnorm] = lsqnonlin(@fit_line_fun,a0);
    function d=fit_line_fun(a)
        % 传给主函数的子函数
        xdata=data(1,:);
        ydata=data(2,:);
        zdata=data(3,:);
        
        point=a(1:3);
        v=a(4:6);
        d(1:length(xdata))=0;
        for n=1:length(xdata)
            m=[xdata(n);ydata(n);zdata(n)]-point(:);
            d(n)=norm(cross(m,v(:)))/norm(v(:));% 利用解析几何的知识求距离d
        end
    end
end
