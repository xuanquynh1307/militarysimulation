function [v_ImageHome,v_AlphaHome]=LoadImageHome()

[v_ImageHome, ~, v_AlphaHome]	= imread('6186627.png');
v_ImageHome = imresize(v_ImageHome, [180 100], 'lanczos3' );
v_AlphaHome = imresize(v_AlphaHome, [180 100], 'lanczos3' );

