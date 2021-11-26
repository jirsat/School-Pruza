function pruza_calibrate_movement()
    global pruza
    pruza.movement.correction = 0;
    pruza.movement.angletotimecoef = 1/50; % First guess
    pruza.movement.torealvelocitycoef = 0;

    v = 50;
    time = 100/(0.26*50); %For movement to be aproximately 100 cm
    i = 0;
    fprintf("Velocity calibration\n")
    while 1
        input("Place robot on floor without obstacles (aprox: 2x2 m) and press eneter");
        pruza_move_raw(v, v, time)
        if input("Did both motors start at the same time? [Y/N]: ",'s') =="Y"
            break
        end
        i = i+1;
        if i ==3
            fprintf("Whatevs, too many attempts already\n")
            break
        end
    end

    y = input("Enter orthogonal distance from axis (in cm): ");
    l = input("Enter movement distance (in cm): ");
    x = sqrt(l*l-y*y);

    pruza.movement.correction = (l-x)/time;
    pruza.movement.torealvelocitycoef = v*time/l;

    while 1
        input("Rotation calibration, press eneter");
        pruza_rotate(90)
        dalpha = input("Enter difference between angle and 90° (real - 90°): ");
        
        pruza.movement.angletotimecoef = pruza.movement.angletotimecoef*(90-dalpha)/90;
        pruza_rotate(90)
        if input("Was it aprox 90°? [Y/N] ",'s')=="Y"
            break
        end
    end
end
