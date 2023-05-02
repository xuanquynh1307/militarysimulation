function [v_ImageBat,v_AlphaBat]=LoadImageBattleship()

[v_ImageBat, ~, v_AlphaBat]	= imread('Battleship.png');
v_ImageBat = imresize(v_ImageBat, [100 400], 'lanczos3' );
v_AlphaBat = imresize(v_AlphaBat, [100 400], 'lanczos3' );
