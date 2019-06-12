function state = isconvergence(agents,ind_size,Q,threshold,hgate)
%ISCONVERGENCE.M Sort the enter problem ( Knapsack 0/1 ).
%   comments:
%       Input1      : Quantum Individuals           Must be Exist
%       Input2      : Threshold for problem         Must be Exist
%       Output1     : State of Sorted in Items      Must be Exist
%       Output2     : Mean of Current Convergence   Can  be Exist
%
%   Class Support:      ISCONVERGENCE.M
%   Example             ISCONVERGENCE.M
%   See also ISCONVERGENCE.
  
%   Copyright 1987-2009 The JSN&MBM, Ir.
%   $Revision: 1.0.0.0 $  $Date: 2009/01/01 00:00:00 $
l = false ;
qmean = 0 ;
jmean = 0 ;
for i=1:agents                    % i = Agents
    for j=1:ind_size                % j = Quantum Individuals
        convergence = abs(1 - (2*(cos(Q(i).ind(j)).^2)));
        jmean = jmean + convergence ;
    end
    jmean = jmean / ind_size ;
    qmean = qmean + jmean ;
    jmean = 0 ;
end
qmean = qmean / agents ;
if qmean >= threshold(1-2*hgate)
    l = true ;
end
state = l ;
end
%--------------------------------------------------------------------------