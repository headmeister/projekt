% funkce pro zpracování spektrogramu
% vstupy: input - signál
%         okno - velikost okna pro výpoèet spektrogramu
% výstup: output- spektrogram
function[output]=spektrogram(input,okno)
output=zeros(floor(okno/2),floor(length(input)./okno));
pom=1;
f = waitbar(0,'Zpracovávám spektrogram...'); % progress bar

for(i=1:okno:length(input)) %spektrogram bez pøekrývání oken
    if(mod(pom,10)==0)
        waitbar(i/length(input),f,'Zpracovávám spektrogram...');
    end
    if(i+okno<length(input))
        output(:,pom)=spektrum(input,i,i+okno-1,floor(okno/2));
        pom=pom+1;
    end
end
close(f); % zavøení progress baru
end