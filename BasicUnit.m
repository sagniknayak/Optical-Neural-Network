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
        function E_out = compute(obj, E_in, V_theta, G_theta, V_phi, G_phi)
            E_mzm = obj.mzm.compute(E_in, V_theta, G_theta, 0, 0);
            E_dl1 = obj.dl1.compute(E_mzm(1), V_phi, G_phi);
            E_dl2 = obj.dl2.compute(E_mzm(2), 0, 0);
            E_out = [E_dl1;E_dl2];
        end
    end
end