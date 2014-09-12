function is_occupied = IsSiteOccupied(x, y)
    if(GetAtomID(x,y) ~= 0)
        is_occupied = 1;
    else
        is_occupied = 0;
    end
end