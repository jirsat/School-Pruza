%%%%%%%%%%%%
%%% Setup stage
%%%%%%%%%%%%
if ~exist("pruza","var")
    global pruza
    if ~exist("ip","var")
        ip = input("Enter ip address: ",'s');
    end
    pruza.connection = legoev3("wifi",ip,'4494FCF3045A');
    
    pruza.movement.left = motor(pruza.connection, 'A');
    pruza.movement.right = motor(pruza.connection, 'D');
    pruza.movement.on = false;
    %pruza.movement.proccess = parfeval(;
end

if ~pruza.movement.on
        pruza_calibrate_movement()

%         %empirically guessed
%         pruza.movement.correction = 6;
%         pruza.movement.angletotimecoef = 1/50;
%         pruza.movement.torealvelocitycoef = 0.26; % [cm/s]
end

if ~pruza.senses.on
    pruza.senses.eye_left = sonicSensor(pruza.connection,2);
end


%%%%%%%%%%%%
%%% Main control loop
%%%%%%%%%%%%
while true
    
end


    
    
    
    
    

