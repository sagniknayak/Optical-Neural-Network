classdef DelayLine
    properties
        n;
        r;
        d;
        L;
        c = 3e+8;
    end
    methods
        function obj = DelayLine(n_in, r_in, d_in, L_in)
            obj.n = n_in;
            obj.r = r_in;
            obj.d = d_in;
            obj.L = L_in;
        end
        function E_out = compute(obj, E_in, lambda, V1, V2)
            n_eff = obj.n - 0.5*obj.r*(obj.n.^3)*((V1-V2)/obj.d);
            phi = 2*pi*(1/lambda)*n_eff*obj.L;
            v = exp(1j*phi);
            E_out = exp(1j*phi) * E_in;  
        end
    end
end