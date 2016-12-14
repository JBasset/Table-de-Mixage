function [] = rep_fct(x,N,N_rep,Nfft,fe)

N_v = 0:N-1;
S = fft(x,Nfft);
axe_f = -fe/2:fe/Nfft:fe/2-fe/Nfft;

figure,
subplot 211
plot(N_v, x);
title('Representation au cours du temps');
xlabel('numéro d''échantillon');
xlim([0 N_rep-1]);

subplot 212
plot(axe_f, fftshift(abs(S)));
title('|S(f)|');
xlabel('fréquence (Hz)');
xlim([-fe/2 fe/2]);

end