function mbs = add_translational(mbs, name, body1_name,s1,s12, body2_name,s2,s22,ir)
%add_translational Add translational joint definition ot the multibody system


% Get bodies ids
b1 = get_body_id(mbs, body1_name);
b2 = get_body_id(mbs, body2_name);
trans = struct("name", name, "body1", b1, "s1", s1(:), "s12", s12(:), "body2", b2, "s2", s2(:),"s22", s22(:),"ir",ir(:));
mbs.joints.translational = [mbs.joints.translational, trans];
mbs.nc = mbs.nc + 2;
end
 

