syms x y;
syms r1 r2 a1 a2 K1 K2;

eqn1 = r1 - (2 * r1)/K1 * x - a1 * y - a2 * y == 0;
eqn2 = r2 - (2 * r2)/K2 * y - a2 * x - a1 * x == 0;

[A, B] = equationsToMatrix([eqn1, eqn2], [x, y]);
X = linsolve(A,B);

vars = [r1 r2 K1 K2 a1 a2];
float_vars = [0.05 0.08 1.5e+5 4.0e+5 1.0e-8 1.0e-8];

unused = [];
float_unused = [];

sensitivity = cell(6,1);

for i = 1:6
    for j = 1:6
       if j ~= i
           unused = [unused vars(j)];
           float_unused = [float_unused float_vars(j)];
       end
    end
    
    f(vars(i)) = subs(X, unused, float_unused);
    sensitivity{i} = diff(f, vars(i)) * vars(i) ./ f(vars(i));
    unused = [];
    float_unused = [];
end

