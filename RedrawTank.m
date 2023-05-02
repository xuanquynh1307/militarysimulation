function RedrawTank(v_Image,v_Alpha,TanksPlot)
global TanksNum;
global Tanks;

for i = 1: TanksNum
    angle = 180;	% imrotate rotates ccw     
    img_i = imrotate(v_Image, angle);
    alpha_i = imrotate(v_Alpha, angle);
    TanksPlot(i).CData=img_i;
    TanksPlot(i).AlphaData=alpha_i;
    try
        TanksPlot(i).XData=Tanks(i,1) ;
        TanksPlot(i).YData=Tanks(i,2) ;
    catch Me
        disp('hi')
        [Tanks(i,1),Tanks(i,2)]
    end
end
drawnow;
