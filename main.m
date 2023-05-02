function main()
%% Global variables
global TimeSteps;
TimeSteps = 50000;
global RedsNum RedsLQNum;
global Targets;
global BluesNum;
global Blues Reds;
global RangeView;
global MaxBlueNum MaxRedNum FightsNum BattleshipsNum TanksNum;
MaxBlueNum = 6;
MaxRedNum =15;
FightsNum = 3;
BattleshipsNum = 2;
TanksNum = 2;
% Set global variables
SET_GLOBAL_VARIABLES()
SetObstacles()
BluesNum = 6; % Choose number of Boids to demo
RedsNum = 4; % Choose number of Boids to demo
RedsLQNum = 1;
Targets = zeros(1,RedsNum);
RangeView=0;
Behaviour_Attack()
end