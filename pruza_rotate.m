%%%%
% This function is used to set motors to stand by
% Movement can by controlled by setting speed
%%%%
% pruza - structure representing robot
% angle - in degrees, + clockwise, - counterclockwise
%%%%
function pruza_rotate(pruza,angle)
    pruza_ready_movement(pruza)
    speed = 35;
    direction = sign(angle);
    time = angle*pruza.movement.angletotimecoef;
    
    pruza.movement.left.Speed = -1 * speed * direction;
    pruza.movement.right.Speed = 1 * speed * direction;
    
    pause(time);
    
    pruza.movement.left.Speed = 0;
    pruza.movement.right.Speed = 0;

end