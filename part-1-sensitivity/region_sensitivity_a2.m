function out1 = region_sensitivity_a2(a2)
%REGION_SENSITIVITY_A2
%    OUT1 = REGION_SENSITIVITY_A2(A2)

%    This function was generated by the Symbolic Math Toolbox version 5.10.
%    28-Feb-2016 19:31:29

t2 = a2.*6.0e2;
t3 = t2-1.0./2.5e2;
t4 = 1.0./t3.^2;
t5 = a2.*1.5e5;
t6 = t5-2.0./2.5e1;
out1 = [a2.*t4.*(a2.*(2.5e1./2.3e1)-7.246376811594203e-6).*-3.312e5;(a2.*t3.*(t4.*t6.*1.2e7-3.0e9./t3).*(-5.0e-5))./t6];