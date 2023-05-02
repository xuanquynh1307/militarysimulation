function [Fence2Plot]=InitializeFence2(v_ImageFence2,v_AlphaFence2)
%%fence1 field
    angle = 125;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageFence2, angle);
    alpha_i = imrotate(v_AlphaFence2, angle );
    Fence2Plot= image(-220, 205, img_i);
    Fence2Plot.AlphaData = alpha_i;
%%house field
%    angle = 0;	% imrotate rotates ccw     
%    img_i = imrotate(v_ImageHome, angle);
%    alpha_i = imrotate(v_AlphaHome, angle );
%    OtherPlot= image(-600, -600, img_i);
%    OtherPlot.AlphaData = alpha_i;  