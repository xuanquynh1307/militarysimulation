function [BasesPlot]=InitializeBase(v_ImageBF,v_AlphaBF)
%%base field
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageBF, angle);
    alpha_i = imrotate(v_AlphaBF, angle );
    BasesPlot= image(-600, -600, img_i);
    BasesPlot.AlphaData = alpha_i;  
