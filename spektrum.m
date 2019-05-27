%vypocet spektra v daném rozmezi signalu, start-index startu pocitani
%spektra, konec- index konce pocitani spektra, input- vstupni data
function[output]=spektrum(input,start,konec,n)
output=abs(fft(input(start:konec),2*n))/length(input(start:konec)); % výpoèet spektra
output=output(1:n);% orezani symetricke casti spektra
end