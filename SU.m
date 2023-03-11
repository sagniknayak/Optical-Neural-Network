classdef SU
    properties
        N;
        BU;
    end
    methods
        function obj = SU(N, n,r,d,L,lambda, kab, kba, del, z)
            obj.N = N;
            a = cell(N-1,1);
            for i=1:N-1
                b = cell(N-i,1);
                for j=1:N-i
                    b(j) = {BasicUnit(n,r,d,L,lambda, kab, kba, del, z)};
                end
                a(i) = {b};
            end
            obj.BU = a;
        end
        function obj = set_Vtheta(obj, layer, position, V_theta, G_theta)
            obj.BU{layer}{position} = obj.BU{layer}{position}.set_Vtheta(V_theta, G_theta);
        end
        function obj = set_Vphi(obj, layer, position, V_phi, G_phi)
            obj.BU{layer}{position} = obj.BU{layer}{position}.set_Vphi(V_phi, G_phi);
        end
    end
end