function main()
%% Global variables
global TimeSteps;
TimeSteps = 50000;
global RedsNum RedsLQNum RedsLQ1Num;
global Targets;
global BluesNum;
global Blues Reds;
global RangeView;
global MaxBlueNum MaxRedNum FightsNum BattleshipsNum;
MaxBlueNum = 6;
MaxRedNum =15;
FightsNum = 3;
BattleshipsNum = 1;
% Set global variables
SET_GLOBAL_VARIABLES()
SetObstacles()
BluesNum = 6; % Choose number of Boids to demo
RedsNum = 4; % Choose number of Boids to demo
RedsLQNum = 2;
RedsLQ1Num = 2;
Targets = zeros(1,RedsNum);
RangeView=0;
Behaviour_Attack()
end