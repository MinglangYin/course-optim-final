function [out] = prox_absolute_value(z)
    out = 0;
    if z>=1
        out = z-1;
    elseif z <= -1
        out = z+1;
    end
end