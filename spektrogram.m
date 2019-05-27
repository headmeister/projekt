% funkce pro zpracov�n� spektrogramu
% vstupy: input - sign�l
%         okno - velikost okna pro v�po�et spektrogramu
% v�stup: output- spektrogram
function[output]=spektrogram(input,okno)
output=zeros(floor(okno/2),floor(length(input)./okno));
pom=1;
f = waitbar(0,'Zpracov�v�m spektrogram...'); % progress bar

for(i=1:okno:length(input)) %spektrogram bez p�ekr�v�n� oken
    if(mod(pom,10)==0)
        waitbar(i/length(input),f,'Zpracov�v�m spektrogram...');
    end
    if(i+okno<length(input))
        output(:,pom)=spektrum(input,i,i+okno-1,floor(okno/2));
        pom=pom+1;
    end
end
close(f); % zav�en� progress baru
end