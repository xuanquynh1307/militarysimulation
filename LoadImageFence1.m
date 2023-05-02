function [v_ImageFence1,v_AlphaFence1]=LoadImageFence1()

[v_ImageFence1, ~, v_AlphaFence1]	= imread('hangRao.png');
v_ImageFence1 = imresize(v_ImageFence1, [33 205], 'lanczos3' );
v_AlphaFence1 = imresize(v_AlphaFence1, [33 205], 'lanczos3' );




%[v_ImageHome, ~, v_AlphaHome]	= imread('6186627.png');
%v_ImageHome = imresize(v_ImageHome, [100 100], 'lanczos3' );
%v_AlphaHome = imresize(v_AlphaHome, [100 100], 'lanczos3' );

