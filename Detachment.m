function Detachment()
global atom_number;
global ADATOM;
% global DIMER;
% global ISLAND;
global UP;
global DOWN;
global LEFT;
global RIGHT;
global atom;

for i = 1 : atom_number
    if  (atom(i).status ~= ADATOM)
    	if (atom(i).timer == 0)
            % Island break up (including Dimer)
            if (atom(i).is_bond(UP) == 1)
            atom_id_up = atom(i).neighbor(UP);
            atom(atom_id_up).is_bond(DOWN) = 0; 
            atom(atom_id_up).num_bond = sum(atom(atom_id_up).is_bond);
            atom(atom_id_up).neighbor(DOWN) = 0;
            atom(atom_id_up).timer = DetachTime(atom(atom_id_up).num_bond);
                if (atom(atom_id_up).num_bond < 1)
                    atom(atom_id_up).status = ADATOM;
                end
            end
            if (atom(i).is_bond(DOWN) == 1)
            atom_id_down = atom(i).neighbor(DOWN);
            atom(atom_id_down).is_bond(UP) = 0;
            atom(atom_id_down).num_bond = sum(atom(atom_id_down).is_bond);
            atom(atom_id_down).neighbor(UP) = 0;
            atom(atom_id_down).timer = DetachTime(atom(atom_id_down).num_bond);
                if (atom(atom_id_down).num_bond < 1)
                    atom(atom_id_down).status = ADATOM;
                end
            end
            if (atom(i).is_bond(LEFT) == 1)
            atom_id_left = atom(i).neighbor(LEFT);
            atom(atom_id_left).is_bond(RIGHT) = 0;
            atom(atom_id_left).num_bond = sum(atom(atom_id_left).is_bond);
            atom(atom_id_left).neighbor(RIGHT) = 0;
            atom(atom_id_left).timer = DetachTime(atom(atom_id_left).num_bond);    
                if (atom(atom_id_left).num_bond < 1)
                    atom(atom_id_left).status = ADATOM;
                end
            end
            if (atom(i).is_bond(RIGHT) == 1)
            atom_id_right = atom(i).neighbor(RIGHT);
            atom(atom_id_right).is_bond(LEFT) = 0;
            atom(atom_id_right).num_bond = sum(atom(atom_id_right).is_bond);
            atom(atom_id_right).neighbor(LEFT) = 0;
            atom(atom_id_right).timer = DetachTime(atom(atom_id_right).num_bond);
                if (atom(atom_id_right).num_bond < 1)
                    atom(atom_id_right).status = ADATOM;
                end
            end
            atom(i).status = ADATOM;
            atom(i).timer = inf;
            atom(i).num_bond = 0;   
            atom(i).neighbor = [0 0 0 0];
            atom(i).is_bond = [0 0 0 0];
        else
            % timer ~= 0;
        end
    else 
        % nothing
    end
end
end

