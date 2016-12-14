function [res] = faddingIn(sonInit, Nfad)
Vfad = zeros(1,Nfad);
for ii=1:Nfad
    Vfad(ii) = ii/Nfad;
end

Nm = length(sonInit);
res = [sonInit(1:Nfad).*Vfad, sonInit(Nfad+1:Nm)];
end