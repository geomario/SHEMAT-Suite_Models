function h = stil(varargin)

if nargin == 0
    h = gcf;
else
    h = varargin{1};
end

% standardwerte
font = 15;
linie = 2;
marker = 7;

% abgeleitete werte
% fonts
titelfont = font * 12.0/7.0;
legendefont = font;
achsenfont = font;
beschriftungsfont = font * 8.0/7.0;
textfont = font;
% linien
%legendelinie = linie-1;
legendelinie = linie;
% marker
%legendemarker = marker-2;
legendemarker = marker;


%linien



% achse
achse = get(h,'CurrentAxes');
set(achse,'FontSize',achsenfont);

% achsenbeschrifutn
xachse = get(achse,'XLabel');
set(xachse,'FontSize',beschriftungsfont);
yachse = get(achse,'YLabel');
set(yachse,'FontSize',beschriftungsfont);

% titel
titel = get(achse,'Title');
set(titel,'FontSize', titelfont);

% linien
linien = findobj(h,'Type','Line');
for i=1:length(linien)
    set(linien(i),'LineWidth',linie);
    set(linien(i),'MarkerSize',marker);
end

% textobjekte
texte = findobj(h,'Type','Text');
for i=1:length(texte)
    set(texte(i),'FontSize', textfont);
end

% legende
legende = findobj(h,'tag','legend');
linien = findobj(legende,'type','line');
set(legend,'FontSize', legendefont);
for i=1:length(linien)
    set(linien(i),'LineWidth',legendelinie);
    set(linien(i),'MarkerSize',legendemarker);
end

