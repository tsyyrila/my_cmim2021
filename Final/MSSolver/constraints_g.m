function g = constraints_g(mbs, q, qd, t)
%CONSTRAINTS Return constraints vector for the system
g = zeros(mbs.nc, 1);
g_idx = 0;

for rj = mbs.joints.revolute
    q1 = q(body_idx(rj.body1));
    q2 = q(body_idx(rj.body2));
    qp1 = qd(body_idx(rj.body1));
    qp2 = qd(body_idx(rj.body2));
    A1 = rot(q1(3));
    A2 = rot(q2(3));
    fi1p = qp1(3);
    fi2p = qp2(3);
    g(g_idx + (1:2)) = A1 * rj.s1 .* fi1p ^ 2 - A2 * rj.s2 .* fi2p ^ 2;
    g_idx = g_idx + 2;
end

g_idx = g_idx + length(mbs.joints.simple);

for dj = mbs.joints.driving
    g(g_idx + 1) = - dj.cfun_dtt(t);
    g_idx = g_idx + 1;
end

for tj = mbs.joints.translational
    q1 = q(body_idx(rj.body1));
    q2 = q(body_idx(rj.body2));
    qp1 = qd(body_idx(rj.body1));
    qp2 = qd(body_idx(rj.body2));
    
   
    A2 = rot(q2(3));
    %r1 = q1(1:2);
    r2 = q2(1:2);
    fi1p = qp2(3);
 
   
    r_Pi = r2+A2*tj.s2;
    r_Qi = r2+A2*tj.s22;
    x_pi = qp2(1);
    x_pj = qp1(1);
    y_pi = qp2(2);
    y_pj = qp1(2);
    fi1p = qp2(3);
    y_i = q2(2);
    y_j = q1(2);
    x_i = q2(1);
    x_j = q1(1);
    eq1 = ((r_Pi(1)-r_Qi(1))*(x_pi-x_pj)+((r_Pi(2)-r_Qi(2))*(y_pi-y_pj)))* fi1p;
    eq2 = (r_Pi(1)-r_Qi(1))*(y_i-y_j)-(r_Pi(2)-r_Qi(2))*(x_i-x_j)* fi1p^2;
    g(g_idx + (1:2))  = [-2*(eq1'-eq2);0];
    g_idx = g_idx + 2;
end
