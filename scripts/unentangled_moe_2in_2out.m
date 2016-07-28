% Create the BB84 basis.
e0 = [1;0]; e1 = [0;1];
ep = [1;1]/sqrt(2); em = [1;-1]/sqrt(2); 

psi0 = e0*e0'; psi1 = e1*e1';
psip = ep*ep'; psim = em*em'; 

% Referee's first basis: {|0><0|, |1><1|}
R{1} = {psi0,psi1};

% Referee's second basis: {|+><+|, |-><-|}
R{2} = {psip,psim};

num_inputs = 2;
num_outputs = 2; 

max_cval = 0; 
R_win_sum = 0; 
for i = 1:num_outputs
    for j = 1:num_outputs
        R_win_sum = R{1}{i} + R{2}{j};
        cvx_begin sdp quiet
            %cvx_precision best;
            %#ok<*VUNUS>    % suppress MATLAB warnings for equality checks in CVX
            %#ok<*EQEFF>    % suppress MATLAB warnings for inequality checks in CVX
            variable rho(2,2) hermitian
        
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
max_cval