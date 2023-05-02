function RedrawRedsTQHP()
global RedsTQ;
global RedsTQNum;
global RedsTQHP;
global BloodPos;
global SizeHPBar;

delete(RedsTQHP);
for i = 1 : RedsTQNum           
    if (RedsTQ(i,15)>0)       
        x1=RedsTQ(i,1)-25;
        x2=RedsTQ(i,1)-25 + RedsTQ(i,15)/2;
        y1=RedsTQ(i,2)+BloodPos;
        y2=RedsTQ(i,2)+BloodPos;
        if (RedsTQ(i,15)<=50)
           RedsTQHP(i)=plot([x1 x2],[y1 y2],'-','Color','y','LineWidth',SizeHPBar);
        else
           RedsTQHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);
        end
    end
end
drawnow;


 