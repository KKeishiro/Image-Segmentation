% Generate initial values for mu
% K is the number of segments
% mu: size of 3*K
function mu = generate_mu(X, K)

[n, dim] = size(X);
mu = X(randi(n,[K,1]),:);
mu = mu';
end