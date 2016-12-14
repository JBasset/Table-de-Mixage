function alpha = CalculAlphaBruit(sonInit,b1,RSBcherche)

N = length(sonInit);

Ps = (1/N)*(sonInit*sonInit');
Pb1 = (1/N) * (b1*b1');
Pb2 = (10^(-RSBcherche/10)) * Ps;

alpha = sqrt(Pb2/Pb1);

end