function detach_time = DetachTime(num_bond)
    if (num_bond == 0)
        detach_time = inf;
    else
        if (num_bond == 1)
            detach_time = 4;
        else if (num_bond == 2)
                detach_time = 41;
            else if (num_bond == 3)
                    detach_time = 446;
                else
                    detach_time = inf;
                end
            end
        end
    end
end