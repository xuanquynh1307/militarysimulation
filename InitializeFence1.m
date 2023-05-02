function [Fence1Plot]=InitializeFence(v_ImageFence1,v_AlphaFence1)
%%fence1 field
    angle = 135;	% imrotate rotates ccw     
    img_i = imrotate(v_ImageFence1, angle);
    alpha_i = imrotate(v_AlphaFence1, angle );
    Fence1Plot= image(-405, -90, img_i);
    Fence1Plot.AlphaData = alpha_i;

%%house field
%    angle = 0;	% imrotate rotates ccw     
%    img_i = imrotate(v_ImageHome, angle);
%    alpha_i = imrotate(v_AlphaHome, angle );
%    OtherPlot= image(-600, -600, img_i);
%    OtherPlot.AlphaData = alpha_i;  