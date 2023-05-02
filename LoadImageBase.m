function [v_ImageBF,v_AlphaBF,...
    v_ImageF,v_AlphaF,v_ImageBat,v_AlphaBat,v_ImageTa,v_AlphaTa]=LoadImageBase()

[v_ImageBF, ~, v_AlphaBF]	= imread('base.png');
v_ImageBF = imresize(v_ImageBF, [1200 1200], 'lanczos3' );
v_AlphaBF = imresize(v_AlphaBF, [1200 1200], 'lanczos3' );

[v_ImageF, ~, v_AlphaF]	= imread('Fight.png');
v_ImageF = imresize(v_ImageF, [100 100], 'lanczos3' );
v_AlphaF = imresize(v_AlphaF, [100 100], 'lanczos3' );

[v_ImageBat, ~, v_AlphaBat]	= imread('Battleship.png');
v_ImageBat = imresize(v_ImageBat, [100 100], 'lanczos3' );
v_AlphaBat = imresize(v_AlphaBat, [100 100], 'lanczos3' );

[v_ImageTa, ~, v_AlphaTa]	= imread('Tank.png');
v_ImageTa = imresize(v_ImageTa, [100 100], 'lanczos3' );
v_AlphaTa = imresize(v_AlphaTa, [100 100], 'lanczos3' );
