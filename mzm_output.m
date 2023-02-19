function [E_out1,E_out2]= mzm_op(E_in1,E_in2,V_dc,V_pi)
    E_out1 = E_in1;
    E_out2 = 0;
    % phase=(V_dc/V_pi)*pi;
    % E_out2=(E_in2*(exp(1i*phase)-1)+1i*E_in1*(exp(1i*phase)+1))*0.5;
    % E_out1=(E_in1*(exp(1i*phase)-1)+ 1i*E_in2*(exp(1i*phase)+1))*0.5;
end

input_power=1e-3;
E_in=sqrt(2*input_power);
V_pi=0.5;
[E1,E2] = mzm_op(E_in,0,0.5,V_pi);