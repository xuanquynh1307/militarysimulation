function RedrawRedsLQ1HP()
global RedsLQ1;
global RedsLQ1Num;
global RedsLQ1HP;
global BloodPos;
global SizeHPBar;

delete(RedsLQ1HP);
for i = 1 : RedsLQ1Num           
    if (RedsLQ1(i,15)>0)       
        x1=RedsLQ1(i,1)-25;
        x2=RedsLQ1(i,1)-25 + RedsLQ1(i,15)/2;
        y1=RedsLQ1(i,2)+BloodPos;
        y2=RedsLQ1(i,2)+BloodPos;
        if (RedsLQ1(i,15)<=50)
           RedsLQ1HP(i)=plot([x1 x2],[y1 y2],'-','Color','y','LineWidth',SizeHPBar);
        else
           RedsLQ1HP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);
        end
    end
end
drawnow;


 