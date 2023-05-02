function [TanksPlot]=InitializeTank(v_Image,v_Alpha)
global Tanks;
global TanksNum;
global ObstaclesTa;
angle = -90;	% imrotate rotates ccw     
for i = 1: TanksNum
    img_i = imrotate(v_Image, angle);
    alpha_i = imrotate(v_Alpha, angle );
    TanksPlot(i) = image(Tanks(i,1), Tanks(i,2), img_i);
    TanksPlot(i).AlphaData = alpha_i;   
    %ObstaclesBat(i,1)=Battleships(i,2);
    %ObstaclesBat(i,2)=Battleships(i,1);
    ObstaclesTa(i,1)=-400;
    ObstaclesTa(i,2)=-400;
end