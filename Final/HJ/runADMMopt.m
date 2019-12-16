function [y, niter] = runADMMopt(x, t)
    v = 0; d = 0; b = 0;
    crit = 1e-8;
    err_v  = 1; err_d = 1; err_b = 1;
    niter = 0;
    
    while (err_v>crit || err_d>crit || err_b>crit)
        %prox_f
        v_new = prox_f(d-b, x);
        
        %prox_g
        d_new = prox_g(v_new+b, t);

        %renew b
        b_new = b + v_new - d_new;
        
        %renew err
        err_v = (sum((v_new-v).^2));
        err_d = (sum((d_new-d).^2));
        err_b = (sum((b_new-b).^2));
        
        v = v_new; d = d_new; b = b_new;
        niter = niter + 1;
    end
    
    y = b+v;
end

function [d_new] = prox_g(z, t)
    d_new = [0;0];
    if z>t
        d_new = z-t;
    elseif z<-t
        d_new = z+t;
    end
    
end

function v = prox_f(z, x)
    v = (z+x)/2;
end