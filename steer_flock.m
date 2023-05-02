function [force]=steer_flock(Current,OBJs,OBJNum)
    align_force=steer_alignment(Current,OBJs,OBJNum);% can chinh 
    coh_force=steer_cohesion(Current,OBJs,OBJNum); %gan ket
    sepr_force=steer_separation(Current,OBJs,OBJNum);  % tach biet
    force=align_force*0.5+coh_force*0.01+sepr_force*1;