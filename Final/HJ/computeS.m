function out = computeS(x,t)
    [y,niter] = runADMMopt(x,t);
    %This is the formula computed for S(x,t) as given.
    out = - (((1/2)*(sum(sum((y).^2))) + 1 - (transpose(y)*x) + t*sum(abs(y))));
end