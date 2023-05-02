function RedrawRedsKQHP()
global RedsKQ;
global RedsKQNum;
global RedsKQHP;
global BloodPos;
global SizeHPBar;

delete(RedsKQHP);
for i = 1 : RedsKQNum           
    if (RedsKQ(i,15)>0)       
        x1=RedsKQ(i,1)-25;
        x2=RedsKQ(i,1)-25 + RedsKQ(i,15)/2;
        y1=RedsKQ(i,2)+BloodPos;
        y2=RedsKQ(i,2)+BloodPos;
        if (RedsKQ(i,15)<=50)
           RedsKQHP(i)=plot([x1 x2],[y1 y2],'-','Color','y','LineWidth',SizeHPBar);
        else
           RedsKQHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);
        end
    end
end
drawnow;


 