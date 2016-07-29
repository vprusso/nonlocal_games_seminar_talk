% Create the BB84 basis.
e0 = [1;0]; e1 = [0;1];
ep = [1;1]/sqrt(2); em = [1;-1]/sqrt(2); 

psi0 = e0*e0'; psi1 = e1*e1';
psip = ep*ep'; psim = em*em'; 

% Referee's first basis: {|0><0|, |1><1|}
R{1} = {psi0,psi1};

% Referee's second basis: {|+><+|, |-><-|}
R{2} = {psip,psim};

% Calculate the standard quantum and unentangled values for the BB84 game
% when the number of repetitions is equal to 2. 
reps = 2;

% Standard quantum value = (cos^2(\pi/8))^2 \approx 0.7286
ent = MonogamyGameValueUB(R,reps)

% Unentangled value = (cos^2(\pi/8))^2 \approx 0.7286
unent = MonogamyGameUnentangledValue(R,reps)
