function result=quantum_genetic_observe(ind);
S=size(ind);
result=rand(S)<sin(ind).^2;   %if random<(beta)^2  result = 1
                              %rand(size(S)) returen the array with size(S)
                              %random number