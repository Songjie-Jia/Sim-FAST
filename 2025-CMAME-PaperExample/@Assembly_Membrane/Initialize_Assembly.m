%% This function initialize the assembly system

function InitializeAssembly(obj)

    obj.node.current_U_mat = zeros(size(obj.node.coordinates_mat));
    obj.node.current_ext_force_mat = zeros(size(obj.node.coordinates_mat));

    obj.rotSpr.Initialize(obj.node)
    obj.cst.Initialize(obj.node)

end