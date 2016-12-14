function [res] = faddingOut(sonInit, Nfad)
Vfad = zeros(1,Nfad);
for ii=1:Nfad
    Vfad(ii) = Nfad/ii;
end

Nm = length(sonInit);
res = [sonInit(1:(Nm-Nfad)), sonInit(((Nm-Nfad)+1):Nm).*Vfad];
end