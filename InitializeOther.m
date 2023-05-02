function [OtherPlot]=InitializeOther(v_ImageFence,v_AlphaFence, v_ImageHome,v_AlphaHome)
%%fence field
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageFence, angle);
    alpha_i = imrotate(v_AlphaFence, angle );
    OtherPlot= image(-40, -40, img_i);
    OtherPlot.AlphaData = alpha_i;  
%%house field
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageHome, angle);
    alpha_i = imrotate(v_AlphaHome, angle );
    OtherPlot= image(-600, -600, img_i);
    OtherPlot.AlphaData = alpha_i;  