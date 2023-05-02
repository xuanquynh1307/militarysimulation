function Behaviour_Attack()
global TimeSteps;
global Reds RedsNum MaxRedNum RedsHP DieRNum;
global Blues BluesNum MaxBlueNum BluesHP DieBNum;
global RedsLQ RedsLQNum MaxLQNum RedsLQHP ObstaclesRLQ DieLQNum ;
global Fights FightsNum MaxFightNum ObstaclesF ;
global Battleships BattleshipsNum ObstaclesBat;
global Tanks TanksNum ObstaclesTa;
global Booms BoomsNum Targets TargetsNum;
global SaveMousePosition;
global ImageWidth;
global ObstaclesB ObstaclesNumB;
global ObstaclesR ObstaclesNumR;
global Obstacles ObstaclesNum;
global ShootDistanceB ShootDistanceR;
global kB kR Target1 Target2;
global deviationXB deviationYB deviationXR deviationYR ;
global AccuracyB AccuracyR;
global goToAttackLQ;
global MaxBlueHP MaxRedHP;
goToAttackLQ = 0;
global makeInformationLQ;
makeInformationLQ = zeros(1,RedsLQNum);
global Counter;

[v_ImageBM, ~, v_AlphaBM]	= imread('die1.png');
v_ImageBM = imresize(v_ImageBM, [ImageWidth ImageWidth], 'lanczos3' );
v_AlphaBM = imresize(v_AlphaBM, [ImageWidth ImageWidth], 'lanczos3' );

%% first draw
% load image
[v_ImageR,v_AlphaR,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE]=LoadImageBoids();
[v_ImageBF,v_AlphaBF,v_ImageF,v_AlphaF,...
    v_ImageBat, v_AlphaBat, v_ImageTa,v_AlphaTa]=LoadImageBase();
[v_ImageBoom,v_AlphaBoom,v_ImageN,v_AlphaN,v_ImageEmpty,v_AlphaEmpty]=LoadImageBoom();
[v_ImageFR,v_AlphaFR,v_ImageFB,v_AlphaFB]=LoadImageFlag();

% draw graphic
[fHandler]=InitializeGraphicN();

% draw base (background)
[BasesPlot]=InitializeBase(v_ImageBF,v_AlphaBF);

% draw flight
% [FightsPlot]=InitializeFight(v_ImageF,v_AlphaF);

% draw battle ship
[BattleshipsPlot]=InitializeBattleship(v_ImageBat,v_AlphaBat);

% draw tank
[TanksPlot]=InitializeTank(v_ImageTa,v_AlphaTa);

% draw blue soldier
[BluesPlot]=InitializeBoid(v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesNum,Blues);
[BluesHP]=InitializeHP(BluesNum,MaxBlueNum,Blues);

% draw red soldier
[RedsLQPlot]=InitializeBoid(v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsLQNum,RedsLQ);
[RedsLQHP]=InitializeHP(RedsLQNum,RedsLQNum,RedsLQ);

%%load sound
[bomb,gun,fight,bombFs,gunFs,fightFs]=loadSound();
timeTick = 1;
sound(fight,fightFs);
count=0;

%Reds = InitArcFormationForFlock(Reds, RedsNum, [550, -300, 0], v_ImageR, v_AlphaR, RedsPlot);
while (timeTick < TimeSteps)   
    
    %% Aircraft
    for FightIndex = 1:FightsNum
        %Fights = updateAtBoundary(Fights,FightIndex);
        if(dist(Fights(FightIndex,1:3),ObstaclesF(FightIndex ,1:3)) > 10)
            CurrentBoid = Fights(FightIndex, :);
            force = 5 * steer_seek(CurrentBoid, ObstaclesF(FightIndex ,1:3));

            %disp(ObstaclesF(FightIndex ,1:3))
            %disp(force)
            %disp(Fights(FightIndex,1:3))
            %disp(dist(Fights(FightIndex,1:3),[-200 200 0]))
            randCnt = int8(rand(1) * 3 + 1);
            %X = sprintf('rand %d', randCnt);
            %disp(X)

            Fights(FightIndex,:) = applyForce(CurrentBoid, force);
        end 
        
        if(dist(Fights(FightIndex,1:3),[-250 250 0]) < 100)

            count = count+2;

            if(count == 10)

                %(randCnt)
                [BombsPlot]=InitializeBomb2(v_ImageN,v_AlphaN,FightIndex);
                pause(0.1);
                sound(bomb,bombFs);
                delete(BombsPlot); 
                count=0;

                for FightIndexTMP = 1:BluesNum
                    %disp(FightIndexTMP);
                    Blues(FightIndexTMP, 15) = 50;
                end 
            end
        end
    end
    
    %% Battleship
    for BattleshipIndex = 1:BattleshipsNum
        CurrentBoid = Battleships(BattleshipIndex, :);
        force = steer_seek(CurrentBoid, ObstaclesBat(BattleshipIndex ,1:3));
        %disp(ObstaclesBat(BattleshipIndex ,1:3))
        %disp(Fights(FightIndex,1:3))
        %disp(dist(Battleships(BattleshipIndex,1:3),[-350 200 0]))
        %if(dist(Battleships(BattleshipIndex,1:3),[-350 200 0]) > 10)
            
        Battleships(BattleshipIndex,:) = applyForce(CurrentBoid, force);
        %end
    end
    
    %% Tank
    for TankIndex = 1:TanksNum
        CurrentBoid = Tanks(TankIndex, :);
        force = steer_seek(CurrentBoid, ObstaclesTa(TankIndex ,1:3));
     
        %disp(ObstaclesBat(BattleshipIndex ,1:3))
        %disp(Fights(FightIndex,1:3))
        %disp(dist(Battleships(BattleshipIndex,1:3),[-350 200 0]))
        %if(dist(Battleships(BattleshipIndex,1:3),[-350 200 0]) > 10)
            
        Tanks(TankIndex,:) = applyForce(CurrentBoid, force);
        %end
    end
    
    %% Enemy
    for BlueIndex = 1:BluesNum
        Blues = updateAtBoundary(Blues,BlueIndex);
        CurrentBoid = Blues(BlueIndex, :);
        seperation_force = steer_separation2(CurrentBoid,Blues, BluesNum);
        avoid_force = steer_collision_avoidance2(CurrentBoid);
         
        force = steer_seek(CurrentBoid, [-250 300 0])+ seperation_force*1.5;
        if (dist(Blues(BlueIndex,1:3),[-250 300 0]) > 10)
            Blues(BlueIndex,:) = applyForce(CurrentBoid, force);
        end
    end
    
    %% Luc Quan
    %% daviation Bule
    deviationXB = ShootDistanceB*(1-AccuracyB*(2*rand - 1));
    deviationYB = ShootDistanceB*(1-AccuracyB*(2*rand - 1));
    
    %% daviation Red
    deviationXR = ShootDistanceR*(1-AccuracyR*(2*rand - 1));
    deviationYR = ShootDistanceR*(1-AccuracyR*(2*rand - 1));
    %% Reds
    AttackBlue = zeros(1,BluesNum);    
    for i=1:RedsLQNum
        if (goToAttackLQ == 0)
            RedsLQ = updateAtBoundary(RedsLQ,i);
            CurrentBoid = RedsLQ(i, :);
            see_force = steer_seek(CurrentBoid, ObstaclesRLQ(i,1:3));  %fkjsdhfkjsdhfkjsdf
            flk_force=steer_flock(CurrentBoid,RedsLQ,RedsLQNum);
            avd_force=steer_collision_avoidance(CurrentBoid,1,Obstacles, ObstaclesNum);
            force = see_force*1+flk_force*1+avd_force*0.1;
            if(RedsLQ(i,15)>0)
                RedsLQ(i,:) = applyForce(CurrentBoid, force);
                
                if (dist(RedsLQ(i,1:3),ObstaclesRLQ(i,1:3)) < 100)
                   makeInformationLQ(i) = 1; 
                end
                tempMatrix = ones(1,RedsLQNum);
                if (makeInformationLQ == tempMatrix)
                   goToAttackLQ = 1; 
                end
            else
                makeInformationLQ(i)=1;
            end
           
        else
            if(RedsLQ(i,15)>0)
                RedsLQ = updateAtBoundary(RedsLQ,i);
                CurrentBoid = RedsLQ(i, :);
                [J,tmpDist]=findTarget(RedsLQ(i,:),BluesNum,Blues);       
                if (J>0 && dist(RedsLQ(i,:),Blues(J,:))<ShootDistanceB)
                    c1=line([RedsLQ(i,1), Blues(J,1)],[RedsLQ(i,2), Blues(J,2)],'Color','red','LineStyle','-.');
                    sound(gun,gunFs);
                    pause(0.02);
                    delete(c1);
                    if ( sqrt(deviationXR*deviationXR+deviationYR*deviationYR) < ImageWidth) 
                        AttackBlue(1,J)=AttackBlue(1,J)+40; 
                    end
                else
                    flk_force=steer_flock(CurrentBoid,RedsLQ,RedsLQNum);
                    avd_force=steer_collision_avoidance(CurrentBoid,1,Obstacles, ObstaclesNum); 

                    if (J>0)
                        arr_force = steer_arrival(CurrentBoid, Blues(J,:));
                    else
                        arr_force = steer_arrival(CurrentBoid, Target1);
                    end
                    force=arr_force*1+flk_force*1+avd_force*0.07;
                    RedsLQ(i,:) = applyForce(CurrentBoid, force); 

                end 
                
            end
            
        end                
    end
   
    
    AttackRedLQ=zeros(1,RedsLQNum);  
    for i=1:BluesNum
        if(Blues(i,15)>0)
            Blues = updateAtBoundary(Blues,i);
            CurrentBoid = Blues(i,:);
            [J,tmpDist]=findTarget(Blues(i,:),RedsLQNum,RedsLQ);  
            if (J>0 && dist(Blues(i,:),RedsLQ(J,:))<ShootDistanceB)
                % Shoot
                c2=line([RedsLQ(J,1), Blues(i,1)-2],[RedsLQ(J,2), Blues(i,2)],'Color','blue','LineStyle','-.');
                pause(0.02);
                sound(gun,gunFs);
                delete(c2);
                if ( sqrt(deviationXB*deviationXB + deviationYB*deviationYB) < ImageWidth)
                     AttackRedLQ(1,J)=AttackRedLQ(1,J)+50;
               end
                 
            end
        end
    end 
    
 
    
    timeTick = timeTick+1;
    
    [BluesNum,Blues] = UpdateBoid(AttackBlue,BluesNum,Blues); 
    [RedsLQNum,RedsLQ] = UpdateBoid(AttackRedLQ,RedsLQNum,RedsLQ);     
    
    RedrawBattleship(v_ImageBat,v_AlphaBat,BattleshipsPlot);
    RedrawTank(v_ImageTa,v_AlphaTa,TanksPlot);
    %RedrawBoid(Reds,RedsNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsPlot);
    RedrawBoid(Blues,BluesNum,v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesPlot);
    RedrawBoid(RedsLQ,RedsLQNum,v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsLQPlot);
    %RedrawRedsHP();
    RedrawBlueHP();
    RedrawRedsLQHP();
    
   

    
    for i = 1: RedsLQNum
        if ( RedsLQ(i,15)<= 0 ) 
            DieRNum = DieRNum +1;
        end
    end
    
    
    if (DieRNum == RedsLQNum)
          %(randCnt)
                [BombsPlot]=InitializeBomb2(v_ImageN,v_AlphaN,FightIndex);
                pause(0.1);
                sound(bomb,bombFs);
                delete(BombsPlot); 
                count=0;

                for FightIndexTMP = 1:BluesNum
                    %disp(FightIndexTMP);
                    Blues(FightIndexTMP, 15) = 0;
                end 
    end 
    
      %% Red Win 
    for i = 1: BluesNum
        if ( Blues(i,15)<= 0 ) 
            DieBNum = DieBNum +1;
        end
    end
    
    if ( DieBNum == BluesNum) 
       InitializeFlag (v_ImageFR,v_AlphaFR);
         break;
    else
       DieBNum =0;
    end 
        
end