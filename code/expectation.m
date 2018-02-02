function P = expectation(mu,cov,alpha,X)
% mu: size of 3*K
% cov: size of 3*3*K
% alpha: size of K*1
% X: size of N*3, N = num of samples

K = length(alpha);
N = size(X,1);
gmm = zeros(N,K);

for i=1:K
   muMat = repmat(mu(:,i),[1,N]);
   Imu = X'-muMat;
   covMat = cov(:,:,i)^-1;
   covMatImu = covMat*Imu;
   covMatImucovMat = sum(covMatImu.*Imu,1);
   lik = 1/((2*pi)^(0.5*K))*(det(covMat))^0.5 * exp(-0.5*covMatImucovMat);
   gmm(:,i) = alpha(i)*lik';
end

P = gmm./repmat(sum(gmm,2),[1,K]);
end