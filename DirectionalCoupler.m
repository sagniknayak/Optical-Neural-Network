classdef DirectionalCoupler
    properties
        kappa_ab;
        kappa_ba;
        delta;
        beta_c;
        lcpm;
        z;
        TM;
    end
    methods
        function obj = DirectionalCoupler(kab, kba, del, z)
            obj.kappa_ab = kab;
            obj.kappa_ba = kba;
            obj.delta = del;
            bc = sqrt(kab*kba + del^2);
            obj.beta_c = bc;
            obj.lcpm = pi/(2*kab*kba);
            Az = exp(1j*del*z)*(cos(bc*z)- ((1j*del)/bc)*sin(bc*z));
            Bz = exp(1j*del*z)*(((1j*kab)/bc)*sin(bc*z));
            Cz = exp(1j*-del*z)*(((1j*kba)/bc)*sin(bc*z));
            Dz = exp(1j*del*-z)*(cos(bc*z)+ ((1j*del)/bc)*sin(bc*z));
            obj.TM = [Az Bz; Cz Dz];
        end
        function E_out = compute(obj, E_in)
            E_out = obj.TM*E_in;
        end
    end
end
        