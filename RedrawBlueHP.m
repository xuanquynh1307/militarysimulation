function RedrawBlueHP()
global Blues;
global BluesNum;
global MaxBlueNum;
global BluesHP;
global BloodPos;
global SizeHPBar;

delete(BluesHP);

for i = 1 : BluesNum
    if(Blues(i,15)>0)
        x1=Blues(i,1)-25;
        x2=Blues(i,1)-25+Blues(i,15)/2;
        y1=Blues(i,2)+BloodPos;
        y2=Blues(i,2)+BloodPos;                  
        if (Blues(i,15)<=50)
           BluesHP(i)=plot([x1 x2],[y1 y2],'-','Color','y','LineWidth',SizeHPBar);
        else
            BluesHP(i)=plot([x1 x2],[y1 y2],'-','Color','b','LineWidth',SizeHPBar);
        end
    end
end
drawnow;