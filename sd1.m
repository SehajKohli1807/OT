clc;
clear all;
f=@(x) x(1)^2+x(2)^2-x(1)*x(2)
x0=[1 1/2] 
toll=0.05
grad=@(x)[2*x(1)-x(2),-x(1)+2*x(2)];
lambda =0.5;

grad_f=-grad(x0)
while norm(grad(x0),inf)>toll
    x1=x0+lambda*(grad_f)
    x0=x1
    grad_f=-grad(x0)
end
min_pt=x0
min_value=f(min_pt)
