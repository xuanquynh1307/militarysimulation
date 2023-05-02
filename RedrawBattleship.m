function RedrawBattleship(v_Image,v_Alpha,BattleshipsPlot)
global BattleshipsNum;
global Battleships;

for i = 1: BattleshipsNum
    angle = 180;	% imrotate rotates ccw     
    img_i = imrotate(v_Image, angle);
    alpha_i = imrotate(v_Alpha, angle);
    BattleshipsPlot(i).CData=img_i;
    BattleshipsPlot(i).AlphaData=alpha_i;
    try
        BattleshipsPlot(i).XData=Battleships(i,1) ;
        BattleshipsPlot(i).YData=Battleships(i,2) ;
    catch Me
        disp('hi')
        [Battleships(i,1),Battleships(i,2)]
    end
end
drawnow;
