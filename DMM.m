classdef DMM
    properties
        N;
        BU;
    end
    methods
        function obj = DMM(N, n,r,d,L,lambda, kab, kba, del, z)
            obj.N = N;
            a = cell(N,1);
            for i=1:N
                a(i) = {BasicUnit(n,r,d,L,lambda, kab, kba, del, z)};
            end
            obj.BU = a;
        end
        function obj = set_Vtheta(obj, position, V_theta, G_theta)
            obj.BU{position} = obj.BU{position}.set_Vtheta(V_theta, G_theta);
        end
        function obj = set_Vphi(obj, position, V_phi, G_phi)
            obj.BU{position} = obj.BU{position}.set_Vphi(V_phi, G_phi);
        end
        function E_out = compute(obj, E_in)
            E_out = zeros(obj.N,1);
            for pos=1:obj.N
                op = obj.BU{pos}.compute([E_in(pos);0]);
                E_out(pos) = op(1);
            end
        end
    end
end