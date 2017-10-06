clear all;
close all;

% EXERCICI 1

fm = 128*10^3;
t = 0:1/fm:1;


%------------------- Analogico ------------------
f1 = 6*10^3;
f2 = 16*10^3;

x1 = 0.5*sin(2*pi*f1*t);
x2 = 0.5*sin(2*pi*f2*t);

%x = x1 + x2;

%------------------- Digital --------------------

% A)

N = 256;        % Longitud del señal
%Numero de muestras tret de en 1 seg 128*10^3, quants en 2ms? regla de 3
F1 = f1/fm;     % Frecuencia de la primera señal
F2 = f2/fm;
td = 0:N-1;       % o también (0:N-1)

X1 = 0.5*sin(2*pi*F1*td);
X2 = 0.5*sin(2*pi*F2*td);

X = X1 + X2;

% figure
% plot(td,X1,'r')
% %axis([Xmin Xmax Ymin Ymax])
% axis([0 255 -1 1])
% hold on
% plot(td,X2)
% title('2ms de los tonos')
% xlabel('Time [ms]')
% ylabel('Amplitude [V]')

figure
plot(td,X,'-o')
axis([0 255 -1 1])
title('2ms de los tonos')
xlabel('Time [ms]')
ylabel('Amplitude [V]')


% B)
% la resolucion frequencial es el detalle, el perfil de la TF. El espacio
% frecuencial entre dos muestras sucesivas. 
%
%           Resolucion = fm/Nf  (anchura del intervalo) Nf=muestras en frec
%     
%
% La transformacion la pintamos entre [Digital] 0 y 1 -> [Analog] 0 y Frec 
% de muestreo fm. 
% Si la señal es real, respecto fm/2 es simetrica compleja conjugados

% En el ejercicio dan la R=250Hz

R = 250;

Nf = fm/R;

t = 0:R:fm-R;
tdf = 0:Nf-1;       % o también (0:N-1)

xf1 = 0.5*sin(2*pi*F1*tdf);
xf2 = 0.5*sin(2*pi*F2*tdf);

xf = xf1 + xf2;
Xf = fft(xf);

%plot((tdf/Nf*fm/1000),abs(Xf)/Nf) %Dividimos el abs /Nf para escalar el recorrido.
%para pasarlo a dB, voltage 20log, Watts10log

plot((tdf/Nf*fm/1000),20*log10(abs(Xf)/Nf)) 
title('Exercici 1 b)')
xlabel('Freq [Khz] [ms]') %Por eso dividimos el eje temporal entre 1000
ylabel('Power')

%=======================================================================%

% Exercici 1.2

fm = 128*10^3;
t = 0:1/fm:1;

%------------------- Analogico ------------------
f1 = 6*10^3;
f2 = 16*10^3;

x1 = 0.5*sin(2*pi*f1*t);
x2 = 0.5*sin(2*pi*f2*t);

x=x1+x2;


x1_d2 = x1(1:2:end);
x2_d2 = x2(1:2:end);

X_d2 = x1_d2 + x2_d2;
R = 250;

Nf = fm/R;

t = 0:R:fm-R;
td_2 = 0:Nf-1;       % o también (0:N-1)

figure
plot(td_2,X_d2,'-o')
axis([0 255 -1 1])
title('Delmado')
xlabel('Time [ms]')
ylabel('Amplitude [V]')


% Cuando delmamos una señal, la señalintrinsecamente sigue siendo la misma,
% pero cuando hacemos la TF con delmado, el ancho de banda sera más grande
% aproximandose más a fm/2. Ya que hemos bajado la frec de muestreo.
% Ensanchandose proporcionalmente al facor de diezmado.


Xfdelm2 = fft(X_d2);

%plot((tdf/Nf*fm/1000),abs(Xf)/Nf) %Dividimos el abs /Nf para escalar el recorrido.
%para pasarlo a dB, voltage 20log, Watts10log

plot(abs(Xfdelm2)) 


%=======================================================================%

% Exercici 1.3

fm = 128*10^3;
t = 0:1/fm:1;

%------------------- Analogico ------------------
f1 = 6*10^3;
f2 = 16*10^3;

x1 = 0.5*sin(2*pi*f1*t);
x2 = 0.5*sin(2*pi*f2*t);

x=x1+x2;

%------------------- Digital --------------------
N = 256;        % Longitud del señal
F1 = f1/fm;     % Frecuencia de la primera señal
F2 = f2/fm;
tddelm8 = 0:8:N-1;       % o también (0:N-1)

X1 = 0.5*sin(2*pi*F1*tddelm8);
X2 = 0.5*sin(2*pi*F2*tddelm8);

Xdelm8 = X1 + X2;

figure
plot(tddelm8,Xdelm8,'-o')
axis([0 255 -1 1])
title('Delmado 8')
xlabel('Time [ms]')
ylabel('Amplitude [V]')


% Cuando delmamos una señal, la señalintrinsecamente sigue siendo la misma,
% pero cuando hacemos la TF con delmado, el ancho de banda sera más grande
% aproximandose más a fm/2. Ya que hemos bajado la frec de muestreo.
% Ensanchandose proporcionalmente al facor de diezmado.


Rdelm8 = fm/N;

Nfdelm8 = fm/Rdelm8;  % Numero de mostres per a fer la representacio en freq.

%t = 0:R:fm-R;

tdfdelm8 = 0:8:Nfdelm8-1;       % o también (0:N-1)

xf1delm8 = 0.5*sin(2*pi*F1*tdfdelm8);
xf2delm8 = 0.5*sin(2*pi*F2*tdfdelm8);

xfdelm8 = xf1delm8 + xf2delm8;
Xfdelm8 = fft(xfdelm8);

%plot((tdf/Nf*fm/1000),abs(Xf)/Nf) %Dividimos el abs /Nf para escalar el recorrido.
%para pasarlo a dB, voltage 20log, Watts10log

plot((tdfdelm8/Nfdelm8*fm/1000),20*log10(abs(Xfdelm8)/Nfdelm8)) 



