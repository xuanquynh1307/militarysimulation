function [v_ImageFence,v_AlphaFence, v_ImageHome,v_AlphaHome]=LoadImageOther()

[v_ImageFence, ~, v_AlphaFence]	= imread('hangRao.png');
v_ImageFence = imresize(v_ImageFence, [100 100], 'lanczos3' );
v_AlphaFence = imresize(v_AlphaFence, [100 100], 'lanczos3' );

[v_ImageHome, ~, v_AlphaHome]	= imread('6186627.png');
v_ImageHome = imresize(v_ImageHome, [100 100], 'lanczos3' );
v_AlphaHome = imresize(v_AlphaHome, [100 100], 'lanczos3' );

