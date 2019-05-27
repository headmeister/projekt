% funkce pro p�epo��t�n� hodnot prvk� v okn� filtrace
% vstup: handles- struktura s daty a odkazy na jednotliv� objekty
function [ ] = refresh_filtrace( handles )
axes(handles.graf_1);
yyaxis left;
hold off;
f=0:floor((handles.pom.Fs)/2);
plot(f,spektrum(handles.pom.data(:,1),1,length(handles.pom.data(:,1)),length(f))); % vykreslit spektrum prvn�ho kan�lu
title('Spektrum kan�lu 1.');
xlabel('Frekvence [Hz]');
ylabel('Amplituda [-]');
axes(handles.graf_2);
yyaxis left;
hold off;
if(length(handles.pom.data(1,:))>1)
    plot(f,spektrum(handles.pom.data(:,2),1,length(handles.pom.data(:,1)),length(f)));% vykreslit spektrum druh�ho kan�lu
    title('Spektrum kan�lu 2.');
    xlabel('Frekvence [Hz]');
    ylabel('Amplituda [-]');
else
    handles.vyber_2.Enable='Off';
    handles.s_f_2.Enable='Off';
    handles.h_f_2.Enable='Off';
    handles.duplikace.Enable='Off';
end

end

