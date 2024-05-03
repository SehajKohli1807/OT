clc
clear all
format short
a=1
b=1/2

f=@(x,y)(x^2-x*y+y^2)

grad=@(x,y)[2*x-y 2*y-x]

% No. of iterations given is 4
for k=1:4
    grad(a,b)
    d=-grad(a,b)/norm(grad(a,b))
    fun=@(z)(a+z*d(1))^2 - (a+z*d(1))*(b+z*d(2))+(b+z*d(2))^2
    
    x1=fminbnd(fun,0,10000)
    a=a+x1*d(1)
    b=b+x1*d(2)
    
 
end
   f(a,b)
