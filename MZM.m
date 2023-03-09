classdef MZM
    properties
        dc1;
        dl1;
        dl2;
        dc2;
    end
    methods
        function obj = MZM(n, r, d, L, lambda, kab, kba, del, z)
            obj.dc1 = DirectionalCoupler(kab,kba,del,z);
            obj.dl1 = DelayLine(n,r,d,L,lambda);
            obj.dl2 = DelayLine(n,r,d,L,lambda);
            obj.dc2 = DirectionalCoupler(kab,kba,del,z);
        end
        function obj = set_voltage(obj, V1, G1)
            obj.dl1 = obj.dl1.set_voltage(V1,G1);
        end
        function E_out = compute(obj, E_in)
            E_dc1 = obj.dc1.compute(E_in);
            E_dl1 = obj.dl1.compute(E_dc1(1));
            E_dl2 = obj.dl2.compute(E_dc1(2));
            E_out = obj.dc2.compute([E_dl1; E_dl2]);
        end
    end
end