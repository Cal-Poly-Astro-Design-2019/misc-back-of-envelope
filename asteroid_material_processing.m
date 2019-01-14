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
m.ga = 97;								%[mT]
m.ree = 200;							%[mT]
% Mass of each mineral required for implementation

m.total = sum(cell2mat(struct2cell(m)));	%[mT]
% Total mass of minerals required

%% H-Chondrite Concentrations (S-Type)

ast.h.au = 1.1*.187;							%[ppm]
% Gold

ast.h.pt = 8*.187;								%[ppm]
ast.h.pd = 4.5*.187;							%[ppm]
ast.h.ir = 3.9*.187;							%[ppm]
ast.h.ru = 5.8*.187;							%[ppm]
ast.h.rh = 1.1*.187;							%[ppm]
ast.h.os = 5.2*.187;							%[ppm]
% PGMS

ast.h.ree = 4.1;
% Rare Earth

ast.h.total = sum(cell2mat(struct2cell(ast.h)));

%% LL-Chondrite Concentrations (S-Type)

ast.l.au = 3.5*.0296;							%[ppm]
% Gold

ast.l.pt = 24.7*.0296;							%[ppm]
ast.l.pd = 14*.0296;								%[ppm]
ast.l.ir = 12*.0296;								%[ppm]
ast.l.ru = 17.8*.0296;							%[ppm]
ast.l.rh = 3.3*.0296;							%[ppm]
ast.l.os = 15.2*.0296;							%[ppm]
% PGMS

ast.l.ree = 4.1;								%[ppm]
% Rare Earth

ast.l.total = sum(cell2mat(struct2cell(ast.l)));

%% M-Type 

ast.m.au = 0.6;							%[ppm]
% Gold

ast.m.pt = 29;								%[ppm]
ast.m.pd = 16.5;							%[ppm]
ast.m.ir = 14;								%[ppm]
ast.m.ru = 21.5;							%[ppm]
ast.m.rh = 4.0;							%[ppm]
ast.m.os = 14.5;							%[ppm]
% PGMS

ast.m.ree = 4.1;								%[ppm]
% Rare Earth

ast.m.total = sum(cell2mat(struct2cell(ast.m)));

%% C-Type 

ast.c.au = 0;								%[ppm]
% Gold

ast.c.pt = 1;								%[ppm]
ast.c.pd = 0;								%[ppm]
ast.c.ir = 0.52;							%[ppm]
ast.c.ru = 0;								%[ppm]
ast.c.rh = 0.15;							%[ppm]
ast.c.os = 0;
% PGMS

ast.c.ree = 3.17;							%[ppm]
% Rare Earth

ast.c.total = sum(cell2mat(struct2cell(ast.c)));

%% Ton of raw material to Ton of Refined Material

ast.h.raw = 1000000/ast.h.total;
% Tons of H-Chondrite asteroid required to be processed to yield 1 ton of
% material

ast.l.raw = 1000000/ast.l.total;
% Tons of LL-Chondrite asteroid required to be processed to yield 1 ton of
% material

ast.m.raw = 1000000/ast.m.total;
% Tons of M-Type asteroid required to be processed to yield 1 ton of
% material

ast.c.raw = 1000000/ast.c.total;
% Tons of M-Type asteroid required to be processed to yield 1 ton of
% material

disp('- Tonnes of Asteroid Material to Yield 1 tonne of Bulk Minerals');
fprintf('\n');
disp(['S-Type (H-Chondrite): ',num2str(ast.h.raw),' tonnes per tonne of useful material.']);
disp(['S-Type (LL-Chondrite): ',num2str(ast.l.raw),' tonnes per tonne of useful material.']);
disp(['M-Type: ',num2str(ast.m.raw),' tonnes per tonne of useful material.']);
disp(['C-Type: ',num2str(ast.c.raw),' tonnes per tonne of useful material.']);
fprintf('\n');

%% Tons of raw material to be processed per year

ast.h.year = ast.h.raw*m.total;
% Tons of H-Chondrite asteroid required to be processed to yield 1 ton of
% material

ast.l.year = ast.l.raw*m.total;
% Tons of LL-Chondrite asteroid required to be processed to yield 1 ton of
% material

ast.m.year = ast.m.raw*m.total;
% Tons of M-Type asteroid required to be processed to yield 1 ton of
% material

ast.c.year = ast.c.raw*m.total;
% Tons of C-Type asteroid required to be processed to yield 1 ton of
% material

disp('- Tonnes of Asteroid Material to be Processed to Meet Requirements');
fprintf('\n');
disp(['S-Type (H-Chondrite): ',num2str(ast.h.year),' tonnes per year.']);
disp(['S-Type (LL-Chondrite): ',num2str(ast.l.year),' tonnes per year.']);
disp(['M-Type: ',num2str(ast.m.year),' tonnes per year.']);
disp(['C-Type: ',num2str(ast.c.year),' tonnes per tonne of useful material.']);
fprintf('\n');

%% Number of Asteroids to mine to meet implementation requirement (Assuming best type of asteroid)

diam = 1;					%[km]
% Diameter of a large asteroid

rho = 1.365e9;				%[tonnes/km^3]
% N

v = (4/3)*pi*(.5*diam)^3; % [km^3]
% Volume of a [diam]km asteroid 

m_ast = rho*v;				%[mT]
% Estimated mass of a M type asteroid that is 1 km

n_ast = m_ast/ast.m.year;
% Find number of years to mine entire asteroid

%% Number of Years of Sustainablility 

sus_yr = 50;
% Number of years of sustainability

m_req = sus_yr*ast.m.year;
% Estimate total asteroid material mass required in the sustainability
% period

n_ast_sus = m_req/m_ast;
% Find number of asteroids to sustain operation for (sus_yr) years

% Print results
% Print answers
disp('- Sustainability');
fprintf('\n');
disp('S-Type (H-Chondrite)');
disp('S-Type (H-Chondrite)');
disp('S-Type (H-Chondrite)');
fprintf('\n');
%% Demonstration Requirement

m.demo.au = 0.5;					%[mT]
m.demo.pgm = 0.25;					%[mT]
m.demo.ree = 0.25;					%[mT]

% S-Type (H-Chondrite)
h_req_au = m.demo.au*1000000/ast.h.au;
h_req_pgm = m.demo.pgm*1000000/...
	(ast.h.pt+ast.h.pd+ast.h.ir+ast.h.ru+ast.h.rh+ast.h.os);
h_req_ree = m.demo.ree*1000000/ast.h.ree;

% S-Type (LL-Chondrite)
l_req_au = m.demo.au*1000000/ast.l.au;
l_req_pgm = m.demo.pgm*1000000/...
	(ast.l.pt+ast.l.pd+ast.l.ir+ast.l.ru+ast.l.rh+ast.l.os);
l_req_ree = m.demo.ree*1000000/ast.l.ree;

% M-Type
m_req_au = m.demo.au*1000000/ast.m.au;
m_req_pgm = m.demo.pgm*1000000/...
	(ast.m.pt+ast.m.pd+ast.m.ir+ast.m.ru+ast.m.rh+ast.m.os);
m_req_ree = m.demo.ree*1000000/ast.m.ree;

% C-Type
c_req_au = m.demo.au*1000000/ast.c.au;
c_req_pgm = m.demo.pgm*1000000/...
	(ast.c.pt+ast.c.pd+ast.c.ir+ast.c.ru+ast.c.rh+ast.c.os);
c_req_ree = m.demo.ree*1000000/ast.c.ree;

% Print answers
disp('- Tonnes of Asteroid Material to be Processed for Demonstration Mission');
fprintf('\n');
disp('S-Type (H-Chondrite)');
disp(['Gold: ',num2str(h_req_au),' mT. PGMs: ',num2str(h_req_pgm),...
	' mT. REEs: ',num2str(h_req_ree),' mT.']);
fprintf('\n');
disp('S-Type (LL-Chondrite)');
disp(['Gold: ',num2str(l_req_au),' mT. PGMs: ',num2str(l_req_pgm),...
	' mT. REEs: ',num2str(l_req_ree),' mT.']);
fprintf('\n');
disp('M-Type');
disp(['Gold: ',num2str(m_req_au),' mT. PGMs: ',num2str(m_req_pgm),...
	' mT. REEs: ',num2str(m_req_ree),' mT.']);
fprintf('\n');
disp('C-Type');
disp(['Gold: ',num2str(c_req_au),' mT. PGMs: ',num2str(c_req_pgm),...
	' mT. REEs: ',num2str(c_req_ree),' mT.']);
