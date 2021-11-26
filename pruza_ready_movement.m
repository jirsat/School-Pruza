%%%%
% This function is used to set motors to stand by
% Movement can by controlled by setting speed
%%%%
% GLOBAL pruza - structure representing robot
%%%%
function pruza_ready_movement()
    global pruza
    if ~pruza.movement.on
        pruza.movement.left.Speed = 0;
        pruza.movement.right.Speed = 0;
        start(pruza.movement.left)
        start(pruza.movement.right) 
        pruza.movement.on = true;
    end
end