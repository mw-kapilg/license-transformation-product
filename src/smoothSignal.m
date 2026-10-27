function y = smoothSignal(x) %#codegen
%SMOOTHSIGNAL Three-point trailing average, written for C code generation.
%   Y = SMOOTHSIGNAL(X) averages each sample with up to two previous samples.
%   X is a column vector of up to 1024 doubles.

y = zeros(size(x));
for k = 1:numel(x)
    first = max(1, k - 2);
    y(k) = sum(x(first:k)) / (k - first + 1);
end
end
