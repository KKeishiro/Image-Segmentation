% Generate initial values for the K
% covariance matrices

function covar = generate_cov(X, K)

covar = cov(X);
covar = diag(diag(covar));  % get a diagonal matrix
covar = repmat(covar,[1 1 K]);

end