function [SAD, SADerr] = SadEval(A_est, A_grt)

%% measure SAD for endmembers
% A_est : p * c (p is spectral band and c is the number of endmembers)

[~, c] = size(A_est);

SADerr = zeros(1, c);
for i = 1 : c
    SADerr(1, i) = acos(A_grt(:, i)' * A_est(:, i) / (norm(A_grt(:, i), 2) * norm(A_est(:, i), 2)));
end

SAD = mean(SADerr);
end