%%%%
% This function is used to move robot and should not be used directly
%%%%
% GLOBAL pruza - structure representing robot
% v - velocity in cm/s
% d - distance to drive
% r - turning radius [cm], + to rotate right, - to rotate left
%%%%
function pruza_move(v, d,r)
    global pruza
    pruza_ready_movement()
    
    t = abs(d/v);
    if ~exists('r','var')
        r = 0;
    end
    
    if r ~= 0
        dv = v*(15/abs(r)); %15cm is distance between belts
    else
        dv = 0;
    end
    if sign(r) > 0
       lv = (v+dv)/pruza.movement.torealvelocitycoef;
       rv = v/pruza.movement.torealvelocitycoef;
    else
       lv = v/pruza.movement.torealvelocitycoef;
       rv = (v +dv)/pruza.movement.torealvelocitycoef;
    end
    
    pruza_move_raw(lv,rv,t)
end
