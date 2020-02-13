function xb = incsearch(func, xmin, xmax, ns, varargin)
%INCSEARCH incremental search algorithm
%   
% xb = incsearch(func, xmin, xmax, ns, varargin)
%
% Inputs:
%  func ... function (handle)
%  xmin ... lower bound
%  xmax ... upper bound
%  ns ...   number of steps
%  varargin ... list of additional parameters used for 'func'
% Outputs:
%  xb(i,1) ... lower brackets
%  xb(i,2) ... upper brackets
%  xb = [] if no zero crossing is found

x = linspace(xmin, xmax, ns);
f = func(x, varargin{:});

xb = [];

% loop over segments
for i=1:(ns-1)
    % check whether there is a zero crossing
    if f(i)*f(i+1) <= 0
        xb(end+1,:) = [x(i), x(i+1)];
    end
end

end

