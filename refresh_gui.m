% funkce pro p�epo��t�n� hodnot prvk� v hlavn�m okn� 
% vstup: handles- struktura s daty a odkazy na jednotliv� objekty
function [ ] = refresh_gui( handles )


zoom xon;
pan on;
drawnow
okno=1000;
pom=handles.data;
axes(handles.prubeh);

%t=0:1/handles.Fs:(length(handles.data)-1)/handles.Fs;
t=0:seconds(1/handles.Fs):minutes((length(handles.data)-1)/handles.Fs/60);
f=0:floor((handles.Fs)/2);
t_spektrogram=0:seconds((okno/handles.Fs)):minutes(((length(handles.data)-okno)/handles.Fs/60));
f_spektrogram=0:handles.Fs/okno:floor((handles.Fs-handles.Fs/okno)/2);
plot(t,pom(:,1)); % vykresleni prubehu prvn�ho kan�lu
xtickformat('mm:ss');
axes(handles.spektrum_z);

plot(f,spektrum(pom(:,1),1,length(pom(:,1)),length(f))); % spektrum prvn�ho kan�lu
title('Spektrum cel�ho sign�lu.');
xlabel('Frekvence [Hz]');
ylabel('Amplituda [-]');
axes(handles.spektrogram_z);
imagesc([0 (length(handles.data)-okno)/handles.Fs/60],f_spektrogram,(spektrogram(pom(:,1),okno))); % spektrogram
title('Spektrogram');
xlabel('�as [min]');
ylabel('Frekvence [Hz]');
%% druhy kanal
if(length(pom(1,:))>1)
    axes(handles.prubeh2);
    plot(t,pom(:,2)); % vykresleni prubehu druh�ho kan�lu
    xtickformat('mm:ss');
    axes(handles.spektrum_z2);
    plot(f,spektrum(pom(:,1),1,length(pom(:,1)),length(f))); %vykreslen� spektra druh�ho kan�lu
    title('Spektrum cel�ho sign�lu.');
    xlabel('Frekvence [Hz]');
    ylabel('Amplituda [-]');
    axes(handles.spektrogram_z2);
    imagesc([0 (length(handles.data)-okno)/handles.Fs/60],f_spektrogram,(spektrogram(pom(:,2),okno)));
    title('Spektrogram');
    xlabel('�as [min]');
    ylabel('Frekvence [Hz]');
end
end

