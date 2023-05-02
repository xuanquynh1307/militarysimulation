function RedrawRedsLQHP()
global RedsLQ;
global RedsLQNum;
global RedsLQHP;
global BloodPos;
global SizeHPBar;

delete(RedsLQHP);
for i = 1 : RedsLQNum           
    if (RedsLQ(i,15)>0)       
        x1=RedsLQ(i,1)-25;
        x2=RedsLQ(i,1)-25 + RedsLQ(i,15)/2;
        y1=RedsLQ(i,2)+BloodPos;
        y2=RedsLQ(i,2)+BloodPos;
        if (RedsLQ(i,15)<=50)
           RedsLQHP(i)=plot([x1 x2],[y1 y2],'-','Color','y','LineWidth',SizeHPBar);
        else
           RedsLQHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);
        end
    end
end
drawnow;


 