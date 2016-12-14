function [res] = bruitBlanc(sonInit,RSBcherche)
b1 = randn(1,N);

alpha = CalculAlphaBruit(sonInit,b1,RSBcherche);

b2 = alpha*b1;

res = sonInit + b2;

end