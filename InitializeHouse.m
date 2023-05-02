function [HousePlot]=InitializeHouse(v_ImageHome,v_AlphaHome)
 
%%house field
    angle = 180;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageHome, angle);
    alpha_i = imrotate(v_AlphaHome, angle );
    HousePlot= image(-450, 15, img_i);
    HousePlot.AlphaData = alpha_i;  