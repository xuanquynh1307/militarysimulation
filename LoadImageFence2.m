function [v_ImageFence2,v_AlphaFence2]=LoadImageFence2()

[v_ImageFence2, ~, v_AlphaFence2]	= imread('hangRao.png');
v_ImageFence2 = imresize(v_ImageFence2, [33 205], 'lanczos3' );
v_AlphaFence2 = imresize(v_AlphaFence2, [33 205], 'lanczos3' );




%[v_ImageHome, ~, v_AlphaHome]	= imread('6186627.png');
%v_ImageHome = imresize(v_ImageHome, [100 100], 'lanczos3' );
%v_AlphaHome = imresize(v_AlphaHome, [100 100], 'lanczos3' );

