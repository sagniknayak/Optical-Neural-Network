function E_out = directional_coupler(E_in, z)
    kappa_ab = 1;
    kappa_ba = 1;
    kappa = kappa_ab = kappa_ba;
    delta = 0; %phase mismatch factor
    beta_c = sqrt(kappa_ab*kappa_ba+delta.^2);
    lcpm = pi/(2*abs(kappa));
    Az = exp(j*delta*z)*(cos(beta_c*z) - ((j*delta)/beta_c)*sin(beta_c*z));
    Bz = exp(j*delta*z)*((j*kappa_ab)/beta_c)*sin(beta_c*z);
    Cz = exp(j*-delta*z)*((j*kappa_ba)/beta_c)*sin(beta_c*z);
    Dz = exp(j*delta*-z)*(cos(beta_c*z) + ((j*delta)/beta_c)*sin(beta_c*z));
    TM = [Az Bz; Cz Dz];
    E_out = TM*E_in;

    
    % d = 340;
    % tf = [ j/sqrt(2); j/sqrt(2) 1/sqrt(2)];
    % E_out = tf*[E1_in; E2_in];