% Overwrite functions?
ow = 0;

syms x y;
syms r1 r2 a1 a2 K1 K2;

% feasibility/sustainability region inequalities
ineq1 = r1 - r1/K1 * x - a1 * y == 0;
ineq2 = r2 - r2/K2 * y - a2 * x == 0;

[A, B] = equationsToMatrix([ineq1, ineq2], [x, y]);

% intersection of the feasible hyperplanes
X = linsolve(A,B);

% intercepts
% actually, these are just (K1,0) and (0,K2)
ineq3 = r1 - r1/K1 * x == 0;
ineq4 = r2 - r2/K2 * y == 0;

vars = [r1 r2 K1 K2 a1 a2];
float_vars = [0.05 0.08 1.5e+5 4.0e+5 1.0e-8 1.0e-8];

unused = [];
float_unused = [];

sensitivity = cell(6,1);

% compute the sensitivity functions with respect to each of the model parameters
% sensitivity{i} is the sensitivity functions of x,y with respect to vars(i)
for i = 1:6
    % hold one parameter as a variable, and plug in the oter five
    for j = 1:6
       if j ~= i
           unused = [unused vars(j)];
           float_unused = [float_unused float_vars(j)];
       end
    end
    
    % compute the region bounds with respect to the held parameter
    % and then compute the sensitivities
    f(vars(i)) = subs(X, unused, float_unused);
    sensitivity{i} = diff(f, vars(i)) * vars(i) ./ f(vars(i));

    % reset and repeat!
    unused = [];
    float_unused = [];

    % write to function format
    if ow
        func_str = sprintf('part-1-sensitivity/region_sensitivity_%s.m',char(vars(i)));
        matlabFunction(sensitivity{i}, 'File',func_str);
    end

end

syms a
total_pop = subs(X,vars,[0.05, 0.08, 1.5e+5, 4.0e+5, a, a])
