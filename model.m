robot_draw(0,0,1,3.1415926/3,'b')
axis equal;
 
function robot_draw(x,y,r,theta,color)
% x y圆心坐标，r圆半径，theta小车行驶角度，color小车颜色
% 调用示例： robot_draw(4,7,1,3.1415926/5,'b')
%     figure('visible','off');
    rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'LineWidth',1.5,'EdgeColor',color);
    a=1;
    b=0.8*a;
    %车架
    rectangle('Position',[x-b,y-a,2*b,2*a],'LineWidth',1.5,'EdgeColor',color);
    hold on;
    %方向线
    x1 = x+1.2*r*cos(theta);
    y1 = y+1.2*r*sin(theta);
    line([x,x1],[y,y1],'Color',color,'LineWidth',1.5)
    hold on;
    %左轮
    ecc = axes2ecc(r/2,r/8);
    wheel_left = [x+9*r/8*cos(theta+3.1415926/2), y+9*r/8*sin(theta+3.1415926/2)];
    [elat,elon]=ellipse1(wheel_left(1),wheel_left(2),[r/2 ecc],rad2deg(theta));
    line(elat,elon,'Color',color,'LineWidth',1.2);
    hold on;
    %右轮
    wheel_right = [x+9*r/8*cos(theta-3.1415926/2), y+9*r/8*sin(theta-3.1415926/2)];
    [elat,elon]=ellipse1(wheel_right(1),wheel_right(2),[r/2 ecc],rad2deg(theta));
    line(elat,elon,'Color',color,'LineWidth',1.2);
end