function [xr, iter] = bisect(func, xl, xu, es)
%BISECT root finding via bisection algorithm
%   
%   xr = bisect(func, xl, xu, es)
%
% Inputs:
%  func ... function (handle)
%  xl ... lower bound
%  xu ... upper bound
%  es ... stopping criterion
% Outputs:
%  xr ... root
%  iter ... number of iterations

% initialize values
iter = 0;
xr = 0; 
ea = 10*es;
maxiter = 100;

% check that brackets aren't zero-crossings (roots)
if func(xl)==0
    xr = xl;
    return
elseif func(xu)==0
    xr = xu;
    return
end

% iteration
while 1
    % next root location
    xrold = xr;
    xr = .5*(xl + xu);
    iter = iter + 1;
    
    % error estimate
    if xr~=0
        ea = abs((xr-xrold)/xr) * 100;
    end
    
    % find next bracket
    test = func(xr)*func(xl);
    if test>0
        xl = xr;
    elseif test==0
        break
    else
        xu = xr;
    end
    
    % terminate if stopping criterion is met
    if ea<es
        break
    elseif iter>maxiter
        break
    end
end

end

