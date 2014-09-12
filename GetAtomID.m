function atom_id = GetAtomID(x,y)
global atom_number;
% global ADATOM;
% global DIMER;
% global ISLAND;
% global UP;
% global DOWN;
% global LEFT;
% global RIGHT;
global atom;

atom_id = 0;
for i = 1 : atom_number
    if( atom(i).x == x &&  atom(i).y == y)
        atom_id = atom(i).atom_id; % Occupied by atom i
    end
end


end