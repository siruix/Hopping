function bond_number = CountBondNumber(i)
% global atom_number;
% global ADATOM;
% global DIMER;
% global ISLAND;
% global UP;
% global DOWN;
% global LEFT;
% global RIGHT;
global atom;


bond_number = 0;
atom_id_up = GetAtomID( atom(i).x,  atom(i).y + 1);
if (atom_id_up ~= 0)
    bond_number =  bond_number+1;
end
atom_id_down = GetAtomID( atom(i).x,  atom(i).y - 1);
if (atom_id_down ~= 0)
    bond_number =  bond_number+1;
end
atom_id_right = GetAtomID( atom(i).x+1,  atom(i).y);
if (atom_id_right ~= 0)
    bond_number =  bond_number+1;
end
atom_id_left = GetAtomID( atom(i).x-1,  atom(i).y);
if (atom_id_left ~= 0)
    bond_number =  bond_number+1;
end
end
