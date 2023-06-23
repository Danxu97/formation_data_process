function [x,y,yaw]=getStfromTraj(traj,t)
    x = traj(1,1);
    y = traj(1,2);
    yaw=traj(1,3);
    for i=1:size(traj,1)-1
        %先找t所在索引段
        if(t>=traj(i,7)&&t<=traj(i+1,7))
            dt = (t-traj(i,7));
            dx = (traj(i+1,1)-traj(i,1)) * dt/(traj(i+1,7)-traj(i,7));
            dy = (traj(i+1,2)-traj(i,2)) * dt/(traj(i+1,7)-traj(i,7));
            yaw = (traj(i+1,3)-traj(i,3)) * dt/(traj(i+1,7)-traj(i,7));

%             dmx = cos(yaw)*dx -sin(yaw)*dy
%             dmy = cos(yaw)*dy +sin(yaw)*dx
            x = x + dx;
            y = y + dy;
            break;
        end
        %积分到t
        dt = (traj(i+1,7) - traj(i,7));
        dx = dt * (traj(i+1,1)-traj(i,1))/(traj(i+1,7)-traj(i,7));
        dy = dt * (traj(i+1,2)-traj(i,2))/(traj(i+1,7)-traj(i,7));
        yaw = dt * (traj(i+1,3)-traj(i,3))/(traj(i+1,7)-traj(i,7));

%         dmx = cos(yaw)*dx - sin(yaw)*dy;
%         dmy = cos(yaw)*dy + sin(yaw)*dx;
        x = x + dx;
        y = y + dy;
    end
end
