function res = bruitTonal(sonInit,RSBcherche,f0,fe)

N = length(sonInit);
N_v = 0:N-1;
b1 = sin(2*pi*f0/fe*N_v);

alpha = CalculAlphaBruit(sonInit,b1,RSBcherche);

b2 = alpha*b1;

res = sonInit + b2;
end