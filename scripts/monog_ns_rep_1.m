n = 1;
dim = 2^n;

e0 = [1;0];         e1 = [0;1];
ep = [1;1]/sqrt(2); em = [1;-1]/sqrt(2);

R = zeros(2,2,2,2);
R(:,:,1,1) = (e0 * e0')/2; R(:,:,1,2) = (e1 * e1')/2;
R(:,:,2,1) = (ep * ep')/2; R(:,:,2,2) = (em * em')/2;

%%
cvx_solver sdpt3

cvx_begin sdp 
    %#ok<*VUNUS>    % suppress MATLAB warnings for equality checks in CVX
    %#ok<*EQEFF>    % suppress MATLAB warnings for inequality checks in CVX
    cvx_precision best
    
    variable rho(dim,dim,dim,dim,dim,dim) semidefinite hermitian
    variable sig(dim,dim,dim,dim) hermitian
    variable xi(dim,dim,dim,dim) hermitian
    variable tau(dim,dim) hermitian 
        
    % construct objective function
    obj_fun = 0;
    for x = 1:dim
       for a = 1:dim
           obj_fun = obj_fun + ip( R(:,:,x,a), rho(:,:,x,x,a,a) );
       end
    end
    
    maximize obj_fun
    
    subject to 
    
        rho_b_sum = sum(rho,6);
        for x = 1:dim
            for y = 1:dim
                for a = 1:dim 
                    rho_b_sum(:,:,x,y,a) == sig(:,:,x,a);
                end
            end
        end

        rho_a_sum = sum(rho,5);
        for x = 1:dim
            for y = 1:dim
                for b = 1:dim                
                    rho_a_sum(:,:,x,y,b) == xi(:,:,y,b);
                end
            end
        end

        sig_a_sum = sum(sig,4);
        for x = 1:dim
            sig_a_sum(:,:,x) == tau;
        end

        xi_b_sum = sum(xi,4);
        for y = 1:dim
            xi_b_sum(:,:,y) == tau;
        end

        trace(tau) == 1; 
        tau >= 0;          
                        
cvx_end