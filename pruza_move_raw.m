%%%%
% This function is used to move robot and should not be used directly
%%%%
% GLOBAL pruza - structure representing robot
% left/right_speed - velocity in unknown units (25 - slow, 50- normal, 100 - fast)
% time - time to drive
%%%%
function pruza_move_raw(left_speed, right_speed, time)
    global pruza
    pruza_ready_movement()
    % -1 because mothors are inverted
    pruza.movement.left.Speed = -1 * left_speed;
    pruza.movement.right.Speed = -1 * (right_speed+pruza.movement.correction);

    pause(time);

    pruza.movement.left.Speed = 0;
    pruza.movement.right.Speed = 0;
end