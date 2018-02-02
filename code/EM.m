function [map,cluster,alpha,mu,cov] = EM(img)

img = im2double(img);
maxiter = 10;
K = 2;

X = reshape(img,[size(img,1)*size(img,2), 3]);
% initialize alpha
alpha0 = ones(K,1)/K;
% generate_mu to initialize mus
mu0 = generate_mu(X,K);
% generate_cov to initialize covariances
cov0 = generate_cov(X,K);
% probabilities obtained by initial params
P = expectation(mu0,cov0,alpha0,X);
% visualize the currently most likely segments memberships (debugging)
ids = visualizeMostLikelySegments(img,alpha0,mu0,cov0);

% iterate between maximization and expectation
iter = 1;
while iter <= maxiter
    % maximization step
    [mu, cov, alpha] = maximization(P, X);
    % visualize the currently most likely segments memberships (debugging)
    ids = visualizeMostLikelySegments(img,alpha,mu,cov);
    % expectation step
    P_new = expectation(mu,cov,alpha,X);
    P = P_new;
    iter = iter+1;
end
map = visualizeMostLikelySegments(img,alpha,mu,cov);
cluster = mu';
end