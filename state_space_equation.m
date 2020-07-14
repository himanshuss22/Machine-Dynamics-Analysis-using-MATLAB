function dw = state_space_equation(time,w,mass,stiffness,damping)

A = [0, 1;  (-1)*stiffness / mass, (-1)*damping / mass ];

dw = A*w;

end