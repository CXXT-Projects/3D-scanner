function line = fitLine3d(points)
% number of points
n = size(points, 1);


% compute centroid
center = mean(points);


% compute the covariance matrix
covPts = cov(points)/n;


% perform a principal component analysis with 2 variables,
% to extract inertia axes
[U, S] = svd(covPts);


% sort axes from greater to lower
[dummy, ind] = sort(diag(S), 'descend'); %#ok<ASGLU>


% format U to ensure first axis points to positive x direction
U = U(ind, :);
if U(1,1) < 0
U = -U;
% keep matrix determinant positive
U(:,3) = -U(:,3);
end


line = [center U(:,1)'];