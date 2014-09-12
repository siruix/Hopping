function Display()
global atom_number;
% global ADATOM;
% global DIMER;
% global ISLAND;
% global UP;
% global DOWN;
% global LEFT;
% global RIGHT;
global atom;

for i = 1:atom_number
    x(i) = atom(i).x;
    y(i) = atom(i).y;
end

scatter(x, y, 'filled');

xlim([1, 10]);
ylim([1, 10]);
grid on
title('Project of Thin Film Technology')
xlabel('by Sirui Ray Xing')
end

