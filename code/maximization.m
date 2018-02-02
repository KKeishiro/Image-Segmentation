function [mu, var, alpha] = maximization(P, X)
% P: expectation obtained from the previous expectation step (N*K matrix)

K = size(P,2);
N = size(X,1);
A = sum(P);

alpha = (1/N) * A;
mu = (X'*P) ./ repmat(A,[3,1]);
var = zeros(3,3,K);
for k = 1:K
    muMat = repmat(mu(:,k),[1,N]);
    var(:,:,k) = (repmat(P(:,k)',[3,1]).*(X'-muMat)) * (X'-muMat)' / A(k);
end

end