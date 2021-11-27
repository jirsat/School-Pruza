close all
clear

%scanresults = scan();

theta = linspace(0, 2*pi, 360);

r1 = scan(theta);

rm = filloutliers(r1, 'next', 'movmedian', 3); % filter sensor input to remove obvious outliers

[M,I] = max(r1); 
[Mm, Im] = max(rm); % Find where is the longest distance available

% Visualization

targettheta = theta(I);
targetthetam = theta(Im);

polarplot(theta, r1);
hold on;
polarscatter(targettheta, M, "r*")
title("Unfiltered signal");

figure(2);
polarplot(theta, rm);
hold on;
polarscatter(targetthetam, Mm, "r*")
title("Filtered signal");

%%%%
% Fuction to produce test data
%%%%
function result = scan(theta)
    scale = 0.7;
    N = length(theta);
    n = rand(N, 1) * scale - (scale * 0.5);
    result(1) = 4;
    for i=2:N
        result(i) = abs(result(i-1) + n(i));
    end
    result(N-7:N) = result(N-7:N) .* linspace(1, 0, 8) + 4 * linspace(0, 1, 8);
    
    badsamples = round(rand() * 10);
    for i=1:badsamples
       id = 1 + round(rand()*(N-1));
       result(id) = result(id) * 2; 
    end
end