% Create the BB84 basis.
e0 = [1;0]; e1 = [0;1];
ep = [1;1]/sqrt(2); em = [1;-1]/sqrt(2); 

psi0 = e0*e0'; psi1 = e1*e1';
psip = ep*ep'; psim = em*em'; 

% Referee's first basis: {|0><0|, |1><1|}
R{1} = {psi0,psi1};

% Referee's second basis: {|+><+|, |-><-|}
R{2} = {psip,psim};

% Calculate the standard quantum and unentangled values for the BB84 game:

% Standard quantum value = cos^2(\pi/8) \approx 0.8536
ent = MonogamyGameValueUB(R)

% Unentangled value = cos^2(\pi/8) \approx 0.8536
unent = MonogamyGameUnentangledValue(R)

%% A closer look at how the unentangled value is being computed.
max_val = 0;
num_inputs = 2;
num_outputs = 2;

for a_1 = 1:num_outputs
    for a_2 = 1:num_outputs
        
        cval = 1/num_inputs * norm( R{1}{a_1} + R{2}{a_2} )
        
        if cval > max_val
            max_val = cval;
        end
        
    end
end
max_val
