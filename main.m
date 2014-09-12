%%%%%%%%%%%%%%%%%%%%%%%%%%
% molecule dynamics simulation 
% project of thin film course by Dr. Wolfe
% Author Raymond Xing
% email sxing@mail.uh.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The sinario: 
% 4 atoms comfined in a 10*10 array of 2-D sites
% adatoms hop to neighboring site every picosecond
% a dimer is formed when 2 adatoms hop to adjacent sites
% when a dimer dissociates, 2 atoms stay where they are but not bound.
% if an adatom hops to a site on the edge of an island, it will be bounded
% to 1,2 or 3 atoms. Detachment is similar to dimers (stay, not bound)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simplified hopping / detachment frequency:
% Process                     Hopping / Detachment time (ps)
% Hoping                      1                               
% Dimer detachment            4                               
% Island detachment 1 bond    4                               
% Island detachment 2 bond    41                              
% Island detachment 3 bond    446                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discussion:
% parallel computing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
global atom_number;
global ADATOM;
global DIMER;
global ISLAND;
global UP;
global DOWN;
global LEFT;
global RIGHT;
global atom;

atom_number = 30;
ADATOM = 1;
DIMER = 2;
ISLAND = 3;
UP = 1;
DOWN = 2;
LEFT = 3;
RIGHT = 4;
total_time = 300;
atom = Atomclass;
atom(atom_number) = Atomclass;
% Initialization
Initialization();
Display();
for sysclk = 1 : total_time
% Run system timer 
 
%% Attachment 
% when system timer times up, adatoms hop
for i = 1 : atom_number
    if ( atom(i).status == ADATOM)
%     hop( atom(i));
    hop_direction = mod(round(random('Uniform',1, 1000)), 4) + 1;
    if (hop_direction == UP)
        if  atom(i).y < 10
            if (~IsSiteOccupied(atom(i).x, atom(i).y+1)) % Not occupied
             atom(i).y =  atom(i).y + 1;
            end      
        Display();
        end
        bond( atom(i).atom_id);
    end
    if (hop_direction == DOWN)
        if  atom(i).y > 1
            if (~IsSiteOccupied(atom(i).x, atom(i).y-1)) % Not occupied
                 atom(i).y =  atom(i).y - 1;
            end    
        Display();
        end
        bond( atom(i).atom_id);
    end
    if (hop_direction == LEFT)
       if  atom(i).x > 1
            if (~IsSiteOccupied(atom(i).x-1, atom(i).y)) % Not occupied
                 atom(i).x =  atom(i).x-1;
            end
       Display();
       end
       bond( atom(i).atom_id);
    end
    if (hop_direction == RIGHT)
       if  atom(i).x < 10
            if (~IsSiteOccupied(atom(i).x+1, atom(i).y)) % Not occupied
                 atom(i).x =  atom(i).x +1;
            end
       Display();
       end
       bond( atom(i).atom_id);
    end
    end
end
% Detachment
% check all active timer for incident
Detachment();

% update timer
for i = 1 : atom_number
    if (atom(i).status == ISLAND)
        atom(i).timer = atom(i).timer - 1;
    end
end
Display();
for i = 1:atom_number
    x(i) = atom(i).x;
    y(i) = atom(i).y;
end
save_data(: ,: ,sysclk) = [x; y];
% str= ['myGIF' num2str(sysclk, 4) '.jpg'];
% saveas(gcf,str)

end
save data_30atom save_data