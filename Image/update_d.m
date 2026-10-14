% function update_d: update d pixel wise
function [d_bottom_kp1, d_right_kp1] = update_d(lambda_bottom_k, lambda_right_k, y_k)
    [M,N] = size(y_k);
    for i=1:M-1
       for j=1:N
           d_bottom_kp1(i,j) = prox_absolute_value(y_k(i+1,j)-y_k(i,j)-lambda_bottom_k(i,j)); %%update d_bottom by comparing derivative value with 0
       end
    end
    for i=1:M
       for j=1:N-1
           d_right_kp1(i,j) = prox_absolute_value(y_k(i,j+1)-y_k(i,j)-lambda_right_k(i,j));%%update d_right by comparing derivative value with 0
       end
    end    
end