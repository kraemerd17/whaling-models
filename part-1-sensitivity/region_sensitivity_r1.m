function out1 = region_sensitivity_r1(r1)
%REGION_SENSITIVITY_R1
%    OUT1 = REGION_SENSITIVITY_R1(R1)

%    This function was generated by the Symbolic Math Toolbox version 5.10.
%    28-Feb-2016 19:31:28

t2 = r1.*(2.0./2.5e1);
t3 = t2-3.2e-4;
t4 = t2-6.0e-6;
t5 = 1.0./t4.^2;
t6 = 1.0./t4;
out1 = [(r1.*t4.*(t6.*1.2e4-t3.*t5.*1.2e4).*6.666666666666667e-6)./t3;t4.*(t6.*3.14e4-r1.*t5.*2.512e3).*3.184713375796178e-5];
