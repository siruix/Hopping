function GetNearBondAtomID(atom_id)
global atom_number;
global ADATOM;
global DIMER;
global ISLAND;
global UP;
global DOWN;
global LEFT;
global RIGHT;
global atom;


% return the ID not only attached to atom(i), but also near atom(i)
j = 1;
for i = 1 : 4    
    if (atom(aton_id).is_bond(i) == 1)
        atom_id_near(j) = atom(aton_id).neighbor(i);
        j = j+1;
    end
end
return atom_id_near;
end

