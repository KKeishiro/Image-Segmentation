function peak = find_peak(X, xl, r)
% X: L*n matrix - L: the num of samples, n=3 (L*a*b value)
% r: radius of a spherical window

dist = pdist2(X, xl);
indx = find(dist < r);
if length(indx) == 1
    peak = X(indx, :);
else
    peak = mean(X(indx, :));
end