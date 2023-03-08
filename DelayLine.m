classdef DelayLine
    properties
        n;
        r;
        d;
        L;
        lambda;
        c = 3e+8;
    end
    methods
        function obj = DelayLine(n_in, r_in, d_in, L_in, wavelength)
            obj.n = n_in;
            obj.r = r_in;
            obj.d = d_in;
            obj.L = L_in;
            obj.lambda = wavelength;
            obj.V1 = 0;
            obj.V2 = 0;
        end
        function set_voltage(obj,V1,V2)
            obj.V1 = V1;
            obj.V2 = V2;
        end
        function E_out = compute(obj, E_in)
            n_eff = obj.n - 0.5*obj.r*(obj.n.^3)*((obj.V1-obj.V2)/obj.d);
            phi = 2*pi*(1/obj.lambda)*n_eff*obj.L;
            E_out = exp(1j*phi) * E_in;  
        end
    end
end