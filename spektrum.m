%vypocet spektra v dan�m rozmezi signalu, start-index startu pocitani
%spektra, konec- index konce pocitani spektra, input- vstupni data
function[output]=spektrum(input,start,konec,n)
output=abs(fft(input(start:konec),2*n))/length(input(start:konec)); % v�po�et spektra
output=output(1:n);% orezani symetricke casti spektra
end