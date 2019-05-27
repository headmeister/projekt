% funkce pro pøepoèítání hodnot prvkù v hlavním oknì 
% vstup: handles- struktura s daty a odkazy na jednotlivé objekty
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
plot(t,pom(:,1)); % vykresleni prubehu prvního kanálu
xtickformat('mm:ss');
axes(handles.spektrum_z);

plot(f,spektrum(pom(:,1),1,length(pom(:,1)),length(f))); % spektrum prvního kanálu
title('Spektrum celého signálu.');
xlabel('Frekvence [Hz]');
ylabel('Amplituda [-]');
axes(handles.spektrogram_z);
imagesc([0 (length(handles.data)-okno)/handles.Fs/60],f_spektrogram,(spektrogram(pom(:,1),okno))); % spektrogram
title('Spektrogram');
xlabel('Èas [min]');
ylabel('Frekvence [Hz]');
%% druhy kanal
if(length(pom(1,:))>1)
    axes(handles.prubeh2);
    plot(t,pom(:,2)); % vykresleni prubehu druhého kanálu
    xtickformat('mm:ss');
    axes(handles.spektrum_z2);
    plot(f,spektrum(pom(:,1),1,length(pom(:,1)),length(f))); %vykreslení spektra druhého kanálu
    title('Spektrum celého signálu.');
    xlabel('Frekvence [Hz]');
    ylabel('Amplituda [-]');
    axes(handles.spektrogram_z2);
    imagesc([0 (length(handles.data)-okno)/handles.Fs/60],f_spektrogram,(spektrogram(pom(:,2),okno)));
    title('Spektrogram');
    xlabel('Èas [min]');
    ylabel('Frekvence [Hz]');
end
end

