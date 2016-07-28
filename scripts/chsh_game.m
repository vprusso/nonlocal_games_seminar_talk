% CHSH Game:

% Systems are of dimension 2
dim = 2;
p = ones(dim,dim)/dim^2;
V = zeros(dim,dim,dim,dim);

% Sum over all question / answer pairs. If a XOR b = xy, then place a "1"
% in the vector V(a,b|x,y) and otherwise, place a "0".
for a = 1:dim
    for b = 1:dim
        for x = 1:dim
            for y = 1:dim
                if(xor(a-1,b-1) == and(x-1,y-1))
                    V(a,b,x,y) = 1;
                end
            end
        end
    end
end

% Call QETLAB function to calculate classical value (should get 0.75).
NonlocalGameValue(p,V,'classical')

% Call QETLAB function to calculate quantum value (should get 0.8536,
% which is approximately cos^2(\pi/8). 
NonlocalGameValue(p,V,'quantum')