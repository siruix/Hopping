function bond(i)
% global atom_number;
global ADATOM;
% global DIMER;
global ISLAND;
global UP;
global DOWN;
global LEFT;
global RIGHT;
global atom;

% check status of atom bonded to in 4 direction
is_island = 0;
num_adatom_near = 0;
atom_id_up = GetAtomID( atom(i).x,  atom(i).y + 1);
if (atom_id_up ~= 0)
    if ( atom(atom_id_up).status ~= ADATOM)
        is_island = 1;
    else
         num_adatom_near =  num_adatom_near+1;
    end
end
atom_id_down = GetAtomID( atom(i).x,  atom(i).y - 1);
if (atom_id_down ~= 0)
    if ( atom(atom_id_down).status ~= ADATOM)
        is_island = 1;
    else
         num_adatom_near =  num_adatom_near+1;
    end
end
atom_id_right = GetAtomID( atom(i).x+1,  atom(i).y);
if (atom_id_right ~= 0)
    if ( atom(atom_id_right).status ~= ADATOM)
        is_island = 1;
    else
         num_adatom_near =  num_adatom_near+1;
    end
end
atom_id_left = GetAtomID( atom(i).x-1,  atom(i).y);
if (atom_id_left ~= 0)
    if ( atom(atom_id_left).status ~= ADATOM)
        is_island = 1;
    else
         num_adatom_near =  num_adatom_near+1;
    end
end

if (is_island == 1 || num_adatom_near > 0)
    % form island (including dimer)
    if (atom_id_up ~= 0)
        % atom at UP
         atom(i).status = ISLAND;
         atom(atom_id_up).status = ISLAND;
         atom(i).neighbor(UP) = atom_id_up;
         atom(i).is_bond(UP) = 1;
         atom(atom_id_up).neighbor(DOWN) = i;
         atom(atom_id_up).is_bond(DOWN) = 1;
         atom(atom_id_up).num_bond = sum(atom(atom_id_up).is_bond);
         atom(atom_id_up).timer = DetachTime(atom(atom_id_up).num_bond);
    end
    if (atom_id_down ~= 0)
        % atom at DOWN
         atom(i).status = ISLAND;
         atom(atom_id_down).status = ISLAND;
         atom(i).neighbor(DOWN) = atom_id_down;
         atom(i).is_bond(DOWN) = 1;
         atom(atom_id_down).neighbor(UP) = i;
         atom(atom_id_down).is_bond(UP) = 1;
         atom(atom_id_down).num_bond = sum(atom(atom_id_down).is_bond);
         atom(atom_id_down).timer = DetachTime(atom(atom_id_down).num_bond);
    end
    if (atom_id_left ~= 0)
        % atom at LEFT
         atom(i).status = ISLAND;
         atom(atom_id_left).status = ISLAND;
         atom(i).neighbor(LEFT) = atom_id_left;
         atom(i).is_bond(LEFT) = 1;
         atom(atom_id_left).neighbor(RIGHT) = i;
         atom(atom_id_left).is_bond(RIGHT) = 1;
         atom(atom_id_left).num_bond = sum(atom(atom_id_left).is_bond);
         atom(atom_id_left).timer = DetachTime(atom(atom_id_left).num_bond);
    end
    if (atom_id_right ~= 0)
        % atom at RIGHT
         atom(i).status = ISLAND;
         atom(atom_id_right).status = ISLAND;
         atom(i).neighbor(RIGHT) = atom_id_right;
         atom(i).is_bond(RIGHT) = 1;
         atom(atom_id_right).neighbor(LEFT) = i;
         atom(atom_id_right).is_bond(LEFT) = 1;
         atom(atom_id_right).num_bond = sum(atom(atom_id_right).is_bond);
         atom(atom_id_right).timer = DetachTime(atom(atom_id_right).num_bond);
    end
    atom(i).num_bond = sum(atom(i).is_bond);
    atom(i).timer = DetachTime(atom(i).num_bond);
else
        % nothing formed
end
end % end function bond()
