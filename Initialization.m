function Initialization()
% Initialization
global atom_number;
global ADATOM;
% global DIMER;
% global ISLAND;
% global UP;
% global DOWN;
% global LEFT;
% global RIGHT;
global atom;

for i = 1 : atom_number
    is_collision = 0;
     atom(i).atom_id = i;
    
    x = mod(round(random('Uniform',1, 1000)),10) + 1;
    y = mod(round(random('Uniform',1, 1000)), 10) + 1;
    for j = 1 : i-1
        if ( atom(j).x == x &&  atom(j).y == y)
            is_collision = 1;
            break;
        end
    end
    while(is_collision == 1)
        is_collision = 0;
        x = mod(round(random('Uniform',1, 1000)),10) + 1;
        y = mod(round(random('Uniform',1, 1000)), 10) + 1;
        for j = 1 : i
        if ( atom(j).x == x &&  atom(j).y == y)
            is_collision = 1;
            break;
        end
     % no collision
        end
    end
    atom(i).status = ADATOM;
    atom(i).x = x;
    atom(i).y = y;
    atom(i).num_bond = 0;
    atom(i).is_bond = [0 0 0 0];
    atom(i).neighbor = [0 0 0 0];
    atom(i).timer = inf;
end