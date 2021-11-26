%%%%
% This function is used to set motors to stand by
% Movement can by controlled by setting speed
%%%%
% pruza - structure representing robot
% speed - velocity in unknown units (25 - slow, 50- normal, 100 - fast)
% time - time to drive
% Not yet implemented : angle - in degrees, + clockwise, - counterclockwise
%%%%
function pruza_move(pruza, speed, time, angle)
    pruza_ready_movement(pruza)
    % -1 protoze motory jsou obracene
    pruza.movement.left.Speed = -1 * speed;
    pruza.movement.right.Speed = -1 * (speed+pruza.movement.correction);

    pause(time);

    pruza.movement.left.Speed = 0;
    pruza.movement.right.Speed = 0;
end