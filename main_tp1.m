clear all;
close all;
clc; %nettoie la commande window

%% Ceci est une partie
a=1;
%ceci est un commentaire
b=12;

%% Etape 1 question 1

N = 11025;
N_rep = 200;
fe = 44100;
f0 = 880;

N_v = 0:N-1; % vecteur de taille N

% on génère une sinusoide
x = sin(2*pi*f0/fe*N_v);

%Représentation au cours du temps
% figure,
% plot(N_v,x);
% title('Représentation au cours du temps');
% xlabel('numéro d''échantillon');
% xlim([0 N_rep-1]);

%Spectre d'amplitude
Nfft = 4*4096;
S = fft(x,Nfft);

% figure,
% plot(1:Nfft, abs(S));
% title('|S(f)|');
% xlabel('numéro d''échantillon');
% 
% axe_f = -fe/2:fe/Nfft:fe/2-fe/Nfft;
% 
% figure,
% plot(axe_f, fftshift(abs(S)));
% title('|S(f)|');
% xlabel('fréquence (Hz)');
% 
% figure,
% plot(axe_f, fftshift(angle(S)));
% title('|S(f)|');
% xlabel('fréquence (Hz)');

%ecouter notre signal
%soundsc(x,fe)

% rep_fct(x,N,N_rep,Nfft,fe);

%%
% nbh=8;
% note = note_fct(f0,fe,N,nbh);
% rep_fct(note,N,N_rep,Nfft,fe);
% soundsc(x,fe), pause;
% soundsc(note,fe);

%% génération d'un 
% nbh=1;
% tab_note = tab_note_fct();
% %notes_morceau = {'G4', 'E4', 'D4', 'E4', 'G4', 'E4', 'D4', 'E4', 'G4', 'B4', 'A4', 'G4', 'F4', 'E4', 'C4', 'D4', 'G4', 'E4', 'D4', 'E4', 'G4', 'E4', 'D4', 'E4'};
% %notes_morceau = {'D4', 'D4', 'D4', 'F4', 'E4', 'F4', 'G4', 'D4', 'D4', 'D4', 'D4', 'F4', 'E4', 'A4', 'B4', 'D5', 'A4', 'A4', 'D5', 'D5', 'D5'};
% notes_morceau = { 'G4', 'F4d', 'D4d', 'A3', 'G3d', 'E4', 'G4d', 'C5' };
% 
% taille_morceau = length(notes_morceau);
% morceau=[];
% M=floor(N/2);
% for ii=1:taille_morceau
%     morceau = [morceau, zeros(1,M), ...
%         eval(['note_fct(tab_note.' notes_morceau{ii} ',fe,M,nbh)'])];
% end
% soundsc(morceau,fe)

%% spectrogramme
% clear all;
% load('Instru2.mat');
% soundsc(Instru2,fe);
% 
% N1 = length(Instru1);
% Nfft = 4096;
% rep_fct(Instru1,N1,N1,Nfft,fe);
% 
% M=128;
% Nfft = 8*M;
% figure,
% spectrogram(Instru1,rectwin(M),M/2,Nfft,fe,'yaxis');

load('mozart.mat');
res = mozart';
load('Instru1.mat');
N1 = length(Instru1);
load('Instru2.mat');
N2 = length(Instru2);
load('Instru3.mat');
N3 = length(Instru3);
load('Instru4.mat');
N4 = length(Instru4);
load('Instru5.mat');
N5 = length(Instru5);
load('Instru6.mat');
N6 = length(Instru6);
Nm = length(res);

% Tempo :
for ii=1:43
    res = res + [zeros(1,(ii*20353)), Instru1', zeros(1,Nm-ii*20353-N1)];
end

for ii=1:80
    res = res + [zeros(1,ii*10176), Instru3', zeros(1,Nm-ii*10176-N3)]; 
end

for ii=75:86
    res = res + [zeros(1,ii*10176), Instru2', zeros(1,Nm-ii*10176-N2)];
end

for ii=1:21
    res = res + [zeros(1,ii*40706), Instru4', zeros(1,Nm-ii*40706-N4)];
    res = res + [zeros(1,(ii*40706)-2650), Instru4', zeros(1,Nm-((ii*40706)-2650)-N4)];
    if (mod(ii,2) == 0)
        res = res + [zeros(1,(ii*40706)-4650), Instru4', zeros(1,Nm-((ii*40706)-4650)-N4)];
        res = res + [zeros(1,(ii*40706)-3650), Instru5', zeros(1,Nm-((ii*40706)-3650)-N5)];
    end
end

for ii=	79:82
    res = res + [zeros(1,ii*10176), Instru6', zeros(1,Nm-ii*10176-N6)];
end

res = faddingIn(res, 800000);

soundsc(res,fe);