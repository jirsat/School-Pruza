%%%%
% Fuction to scan full circle
%%%%
% angles - array of angles to scan in degrees
%%%%
function map = pruza_sensoricmap(angles)
    global pruza
    if ~exist("angles","var")
       angles = 0:5:360;
    end
    d = [];
    for i = 1:length(angles)-1
        rotation = angles(i+1)-angles(i);
        d = [d readDistance(pruza.senses.eye_left)];
        pruza_rotate(rotation)
    end
    d = [d readDistance(pruza.senses.eye_left)];


    df = filloutliers(d, 'next', 'movmedian', 3); % filter sensor input to remove obvious outliers

    [M,I] = max(d); 
    [Mf, If] = max(df); % Find where is the longest distance available

    % Visualization
    radangles = angles*2*pi/360;
    targetangle = radangles(I);
    targetanglef = radangles(If);

    figure(1);
    polarplot(radangles, d);
    hold on;
    polarscatter(targetangle, M, "r*")
    title("Unfiltered signal");

    figure(2);
    polarplot(radangles, df);
    hold on;
    polarscatter(targetanglef, Mf, "r*")
    title("Filtered signal");
    
    map = [angles;df];

