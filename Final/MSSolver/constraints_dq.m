function Cq = constraints_dq(mbs, q)

Cq = zeros(mbs.nc, mbs.nq);

c_idx = 0;

for rj = mbs.joints.revolute
    q1_idx = body_idx(rj.body1);
    q2_idx = body_idx(rj.body2);
    q1 = q(q1_idx);
    q2 = q(q2_idx);
    A1 = rot(q1(3));
    A2 = rot(q2(3));
    Cq(c_idx + (1:2), q1_idx) = [eye(2), Omega * A1 * rj.s1];
    Cq(c_idx + (1:2), q2_idx) = -[eye(2), Omega * A2 * rj.s2];
    c_idx = c_idx + 2;
end

for sj = mbs.joints.simple
    q_idx = body_idx(sj.body);
    Cq(c_idx + 1, q_idx(sj.coord)) = 1;
    c_idx = c_idx + 1;
end

for dj = mbs.joints.driving
    q_idx = body_idx(dj.body);
    Cq(c_idx + 1, q_idx(dj.coord)) = 1;
    c_idx = c_idx + 1;
end

for tj = mbs.joints.translational
    q1_idx = body_idx(tj.body1);
    q2_idx = body_idx(tj.body2);
    
    q1 = q(body_idx(tj.body1));
    q2 = q(body_idx(tj.body2));
    
    A1 = rot(q1(3)); 
    A2 = rot(q2(3));
   
   
    %body1
    %1
    Cq(c_idx + (1:2), q1_idx) = [(tj.s2-tj.s22)'*A2'*eye(2), (tj.s2-tj.s22)'*A2'*A1*tj.s1;0,0, 1];
    %2
    Cq(c_idx + (1:2), q2_idx) = -[(tj.s2-tj.s22)'*A2'*eye(2), (tj.s2-tj.s22)'*eye(2)*tj.s12;0, 0, 1];
     c_idx = c_idx + 2;
    
   
    
end

