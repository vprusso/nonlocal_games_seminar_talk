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

num_inputs = 4;
num_outputs = 3; 

max_cval = 0; 
R_win_sum = 0; 
for i = 1:num_outputs
    for j = 1:num_outputs
        for k = 1:num_outputs
            for l = 1:num_outputs
                
                R_win_sum = R{1}{i} + R{2}{j} + R{3}{k} + R{4}{l};
                
                cvx_begin sdp quiet
				
                variable rho(3,3) hermitian
                
                maximize trace(R_win_sum'*rho)
                subject to
                trace(rho) == 1;
                rho >= 0;
                cvx_end
                
                cval = 1/num_inputs * cvx_optval;
                
                if cval > max_cval
                    max_cval = cval;
                end
                
            end
        end
    end
end

max_cval