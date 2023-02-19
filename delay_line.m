function E_out = delay_line(E_in, freq, V_in, V_out, L)
    n = 1.5;
    r = 4;
    d = 2;
    n_eff = n - 0.5*r*(n.^3)*(V_in-V_out)/d;
    c = 3*10.^8;
    phi = 2*pi*(freq/c)*n_eff*L;
    E_out = exp(j*phi) * E_in;
    % V_pi = d*c/(freq*L*r*(n.^3));