%% Processing Requirements

% PATRICK CHIZEK
% 1/9/19

% DESCRIPTION: Calculations for ammount of raw material that would need to 
% be processed to extract required ammount of minerals

close all;
clear all;
clc;

%% Assumed Constants

m.au = 643;								%[mT]
m.pt = 93;								%[mT]
m.pd = 105;								%[mT]
m.ir = 129;								%[mT]
m.ru = 50;								%[mT]
m.rh = 12;								%[mT]
m.ge = 61;								%[mT]
m.ga = 97;								%[mT]
% Mass of each mineral required

m.total = 1190;
% sum(cell2mat(struct2cell(ast.l)));	%[mT]
% Total mass of minerals required

%% H-Chondrite Concentrations (S-Type)

% List concentrations of each mineral in each type of asteroid

ast.h.au = 1.1;								%[ppm]
% Gold

ast.h.pt = 8;								%[ppm]
ast.h.pd = 4.5;								%[ppm]
ast.h.ir = 3.9;								%[ppm]
ast.h.ru = 5.8;								%[ppm]
ast.h.rh = 1.1;								%[ppm]
ast.h.os = 5.2;
% PGMS

ast.h.ree = 4.1;
% Rare Earth

ast.h.total = sum(cell2mat(struct2cell(ast.h)));

%% LL-Chondrite Concentrations (S-Type)
ast.l.au = 3.5;								%[ppm]
% Gold

ast.l.pt = 24.7;							%[ppm]
ast.l.pd = 14;								%[ppm]
ast.l.ir = 12;								%[ppm]
ast.l.ru = 17.8;							%[ppm]
ast.l.rh = 3.3;								%[ppm]
ast.l.os = 15.2;
% PGMS

ast.h.ree = 4.1;
% Rare Earth

ast.l.total = sum(cell2mat(struct2cell(ast.l)));

% Other?

%% Ton of raw material to Ton of Refined Material

ast.h.raw = 1000000/ast.h.total;
% Tons of H-Chondrite asteroid required to be processed to yield 1 ton of
% material

ast.l.raw = 1000000/ast.l.total;
% Tons of LL-Chondrite asteroid required to be processed to yield 1 ton of
% material

disp(ast.h.raw);
disp(ast.l.raw);

%% Tons of raw material to be processed per year

ast.h.year = ast.h.raw*m.total;
% Tons of H-Chondrite asteroid required to be processed to yield 1 ton of
% material

ast.l.year = ast.l.raw*m.total;
% Tons of LL-Chondrite asteroid required to be processed to yield 1 ton of
% material

disp(ast.h.year);
disp(ast.l.year);

