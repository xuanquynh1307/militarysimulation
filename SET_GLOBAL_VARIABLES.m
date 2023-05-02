function SET_GLOBAL_VARIABLES()
global EnvironmentWidth ImageWidth SafeDistance AlignmentRange CohesionRange...
    wanderAngle FleeDistance SpeedCorrection ...
    BoidsNum Boids TargetsNum  D_BehindLeader ...
    ObstaclesNum Obstacles ObstaclesNumB ObstaclesB ObstaclesNumR ObstaclesBat ObstaclesR ObstaclesF ObstaclesTa...
     Reds  Blues xi yi DameOfBlue DameOfRed Fights FightsNum BattleshipsNum Battleships TanksNum Tanks ...
    ShootDistanceB ShootDistanceR MaxRedNum MaxBlueNum BloodPos RedsNum  ...
    RedsLQNum RedsLQ MaxRedLQHP ObstaclesRLQ...
    RedsLQ1Num RedsLQ1 MaxRedLQ1HP ObstaclesRLQ1...
    Target1  Target2 SizeHPBar LengthHPBar BaseR BaseB Targets...
    deviationXB  deviationXR deviationYR ...
    AccuracyB AccuracyR DieRNum DieBNum ...
    Booms BoomsNum ...
    MaxRedHP MaxBlueHP;

LengthHPBar=30;
EnvironmentWidth = 600;
ImageWidth = 60;
SafeDistance = EnvironmentWidth/15; % set separation range
AlignmentRange = EnvironmentWidth/5; % set alignment range
CohesionRange = EnvironmentWidth/4; % set cohesion range
wanderAngle = 5;
FleeDistance = 200;
SpeedCorrection = 100;
%Number of Boids
BoidsNum = 300;
%Number of Targets

TargetsNum = 10;

BloodPos = 25;
D_BehindLeader = 130;

%% List of Reds
Reds = zeros(MaxRedNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
MaxRedHP = 100;
Reds(:,1) = EnvironmentWidth/10*(rand([MaxRedNum,1]))+550; % set random position
Reds(:,2) = EnvironmentWidth/10*(rand([MaxRedNum,1]))-200; % set random position
%Reds(:,1:2) = 2; % set random position EnvironmentWidth*(2*rand([RedsNum,2])-1)
Reds(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Reds(:,10) = 3;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Reds(:,11) = 0.2; % set maxforce
Reds(:,13) = 200; % set max see ahead
Reds(:,14) = 10; % set max avoid force
Reds(:,15) = MaxRedHP; % set blood

%% List of Blues
Blues = zeros(MaxBlueNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
%Blues(:,1:2) = EnvironmentWidth*(2*rand([BluesNum,2])-1); % set random positionB
MaxBlueHP = 120;
Blues(:,1) = EnvironmentWidth/10*(rand([MaxBlueNum,1]))-350; % set random position
Blues(:,2) = EnvironmentWidth/10*(rand([MaxBlueNum,1]))+150; % set random position
Blues(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Blues(:,10) = 4;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Blues(:,11) = 0.2; % set maxforce
Blues(:,13) = 200; % set max see ahead
Blues(:,14) = 10; % set max avoid force
Blues(:,15) = MaxBlueHP; % set blood

%% List of LQ
RedsLQ = zeros(RedsLQNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
%Blues(:,1:2) = EnvironmentWidth*(2*rand([BluesNum,2])-1); % set random positionB
MaxLQHP = 120;
RedsLQ(:,1) = EnvironmentWidth/10*(rand([RedsLQNum,1]))-0; % set random position
RedsLQ(:,2) = EnvironmentWidth/10*(rand([RedsLQNum,1]))-0; % set random position
RedsLQ(:,3) = 100;
RedsLQ(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
RedsLQ(:,10) = 5;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
RedsLQ(:,11) = 0.2; % set maxforce
RedsLQ(:,13) = 200; % set max see ahead
RedsLQ(:,14) = 10; % set max avoid force
RedsLQ(:,15) = MaxLQHP; % set blood
ObstaclesRLQ=zeros(RedsLQNum,4);
for i=1:RedsLQNum
    ObstaclesRLQ(i, 1) = -380;
    ObstaclesRLQ(i, 2) = 200;
end

%% List of LQ1
RedsLQ1 = zeros(RedsLQ1Num,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
%Blues(:,1:2) = EnvironmentWidth*(2*rand([BluesNum,2])-1); % set random positionB
MaxLQ1HP = 120;
RedsLQ1(:,1) = EnvironmentWidth/10*(rand([RedsLQ1Num,1]))-400; % set random position
RedsLQ1(:,2) = EnvironmentWidth/10*(rand([RedsLQ1Num,1]))-400; % set random position
RedsLQ1(:,3) = 100;
RedsLQ1(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
RedsLQ1(:,10) = 5;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
RedsLQ1(:,11) = 0.2; % set maxforce
RedsLQ1(:,13) = 200; % set max see ahead
RedsLQ1(:,14) = 10; % set max avoid force
RedsLQ1(:,15) = MaxLQ1HP; % set blood
ObstaclesRLQ1=zeros(RedsLQ1Num,4);
for i=1:RedsLQ1Num
    ObstaclesRLQ1(i, 1) = -380;
    ObstaclesRLQ1(i, 2) = 200;
end
    
%% Set static Obstacle data
ObstaclesNum = 6;
Obstacles=zeros(ObstaclesNum,4);
ObstaclesNumB = 0;
ObstaclesB = [0 0 0 0];
ObstaclesNumR = 0;
ObstaclesR = [0 0 0 0];
BaseR=[-380 50];
BaseB=[-600 -600];

%% List of Battleship
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
Battleships = zeros(3,15);
% BlueOBJ(:,1:2) = EnvironmentWidth/4*(2*rand([BlueNum,2])-1)+300; % set random position
Battleships(1,1) = 300; Battleships(1,2) = -200; 
Battleships(2,1) = 550; Battleships(2,2) = 200; 
Battleships(3,1) = 550; Battleships(3,2) = 100; 
Battleships(:,4:5) = 50; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Battleships(:,10) = 5;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Battleships(:,11) = 0.2; % set maxforce
Battleships(:,13) = 200; % set max see ahead
Battleships(:,14) = 5; % set max avoid force
Battleships(:,15) = 100;
ObstaclesBat=zeros(BattleshipsNum,4);

%% List of Tanks
Tanks = zeros(3,15);
% BlueOBJ(:,1:2) = EnvironmentWidth/4*(2*rand([BlueNum,2])-1)+300; % set random position
Tanks(1,1) = -400; Tanks(1,2) = -500; 
Tanks(2,1) = -500; Tanks(2,2) = -580; 
Tanks(3,1) = -300; Tanks(3,2) = -580; 
Tanks(:,4:5) = 50; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Tanks(:,10) = 5;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Tanks(:,11) = 0.2; % set maxforce
Tanks(:,13) = 200; % set max see ahead
Tanks(:,14) = 5; % set max avoid force
Tanks(:,15) = 100;
ObstaclesTa=zeros(TanksNum,4);

%% List of Fights
Fights = zeros(3,15);
% BlueOBJ(:,1:2) = EnvironmentWidth/4*(2*rand([BlueNum,2])-1)+300; % set random position
Fights(1,1) = 550; Fights(1,2) = -950; 
Fights(2,1) = 450; Fights(2,2) = -850; 
Fights(3,1) = 450; Fights(3,2) = -950; 

Fights(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Fights(:,10) = 30;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Fights(:,11) = 0.2; % set maxforce
Fights(:,13) = 200; % set max see ahead
Fights(:,14) = 10; % set max avoid force
Fights(:,15) = 100;

ObstaclesF=zeros(FightsNum,4);

%% Variables
xi = [1,0,0,cos(linspace(pi/2,0,30))]*(FleeDistance-15);
yi = [0,0,1,sin(linspace(pi/2,0,30))]*(FleeDistance-15);

DameOfBlue = 50;
DameOfRed = 20;

ShootDistanceB = 100; 
ShootDistanceR = 100; 
Target1 = [-400 -400 0];
Target2 = [100 100 0];
SizeHPBar=1.5;

%% Accuracy
AccuracyB =0.95; % do chinh xac
AccuracyR =0.9;
DieRNum =0 ; 
DieBNum =0;
%% Boom
 BoomsNum= 5;
 Booms = zeros(BoomsNum,4);
 Booms( :,4) = 1;
 Booms(1,1)= -700; Booms(1,2)= -700;
 Booms(2,1)= -700; Booms(2,2)= -700;
 Booms(3,1)= -300; Booms(3,2)= 250;
 Booms(4,1)= -300; Booms(4,2)= 200;
 Booms(5,1)= -250; Booms(5,2)= 300;
 Booms(6,1)= 100; Booms(6,2)= -100;
 Booms(7,1)= 200; Booms(7,2)= 50;
end
