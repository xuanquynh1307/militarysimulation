function RedrawTargetHP()
    global Reds RedsNum MaxRedNum RedsHP;
    global SizeHPBar LengthHPBar BloodPos;
    delete(RedsHP);
    for i=1:MaxRedNum
        if i<=RedsNum
            blood=Reds(i,15);
        else
            blood=0;
        end
        x=Reds(i,1);y=Reds(i,2);
        x1=x-LengthHPBar/2;
        x2=x1+LengthHPBar*blood/100;
        y1=y+BloodPos;y2=y1;
        RedsHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);
    end
end