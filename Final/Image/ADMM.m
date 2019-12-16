function [y, y_norm] = ADMM(x, t)
    epsilon = sqrt(sum(sum(x.^2)))/1000;  %% set stoping criteria
    
    % initialization
    [M, N] = size(x);
    y_k = x; 
    lambda_right_k = zeros(M,N-1);
    lambda_bottom_k = zeros(M-1,N);
    TV = 1e3;
    k = 1;
    
    % ADMM loop
    while TV >= epsilon
        [d_bottom_k, d_right_k] = update_d(lambda_bottom_k, lambda_right_k, y_k);
        y_k1 = update_y(y_k, lambda_bottom_k, lambda_right_k, d_bottom_k, d_right_k, x, t);
        [lambda_bottom_k, lambda_right_k] = update_lambda(lambda_bottom_k, lambda_right_k, d_bottom_k, d_right_k, y_k1);
        
        % update and save
        TV = sqrt(sum(sum((y_k1-y_k).^2)));
        y_norm(k) = sqrt(sum(sum(y_k.^2)));
        k = k+1;
        y_k = y_k1;
    end
    
    y = y_k;
end