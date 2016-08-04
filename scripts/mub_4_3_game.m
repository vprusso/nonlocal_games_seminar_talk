% Number of inputs and outputs
nin = 4;
nout = 3;

% Create the mutually unbiased bases consisting of 4-inputs and 3-outputs.
m = MUB(nout); 
R = {};
for i = 1:nin
    for j = 1:nout
        R{i}{j} = m{i}(:,j) * m{i}(:,j)';
    end
end

% Calculate the lower and upper bounds on the quantum value of
% the mutually unbiased basis game:
ub = MonogamyGameValueUB(R)
lb = MonogamyGameValueLB(R)
