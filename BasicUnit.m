classdef BasicUnit
    properties
        mzm;
        dl1;
        dl2;
    end
    methods
        function obj = BasicUnit(n,r,d,L,lambda, kab, kba, del, z)
            obj.mzm = MZM(n,r,d,L,lambda,kab,kba,del,z);
            obj.dl1 = DelayLine(n,r,d,L,lambda);
            obj.dl2 = DelayLine(n,r,d,L,lambda);
        end
        function obj = set_Vtheta(obj, V_theta, G_theta)
            obj.mzm = obj.mzm.set_voltage(V_theta, G_theta);
        end
        function obj = set_Vphi(obj, V_phi, G_phi)
            obj.dl1 = obj.dl1.set_voltage(V_phi, G_phi);
        end
        function E_out = compute(obj, E_in)
            E_mzm = obj.mzm.compute(E_in);
            E_dl1 = obj.dl1.compute(E_mzm(1));
            E_dl2 = obj.dl2.compute(E_mzm(2));
            E_out = [E_dl1;E_dl2];
        end
    end
end