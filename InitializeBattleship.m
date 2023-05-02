function [BattleshipsPlot]=InitializeBattleship(v_Image,v_Alpha)
global Battleships;
global BattleshipsNum;
global ObstaclesBat;
angle = -90;	% imrotate rotates ccw     
for i = 1: BattleshipsNum
    img_i = imrotate(v_Image, angle);
    alpha_i = imrotate(v_Alpha, angle );
    BattleshipsPlot(i) = image(Battleships(i,1), Battleships(i,2), img_i);
    BattleshipsPlot(i).AlphaData = alpha_i;   
    ObstaclesBat(i,1)=0;
    ObstaclesBat(i,2)=-180;
end