function [HousePlot]=InitializeHouse(v_ImageHome,v_AlphaHome)
 
%%house field
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageHome, angle);
    alpha_i = imrotate(v_AlphaHome, angle );
    HousePlot= image(-600, -600, img_i);
    HousePlot.AlphaData = alpha_i;  