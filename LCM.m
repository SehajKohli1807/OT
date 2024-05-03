%{

     D1  D2  D3  D4
---------------------
S1 | 3   1   7   4 | 100
S2 | 2   6   5   1 | 50
-------------------
     25  40  30  50 

%}



clc
clear all
C=[3 1 7 4;2 6 5 1];
A=[100 50];
B=[25 40 30 50];

if sum(A)==sum(B)
    fprintf("PROBLEM IS BALANCED");
else
    fprintf("PROBLEM IS UNBALANCED");
    if sum(A)<sum(B)
        C(end+1,:)=zeros(1,size(B,2));
        A(end+1)=sum(B)-sum(A);
    else 
        C(:,end+1)=zeros(1,size(A,2));
        B(end+1)=sum(A)-sum(B);
    end
end

fprintf("\nBalanced Table")
C
A
B

X=zeros(size(C));
Init_cost=C;


for i=1:size(C,1)
    for j=1:size(C,2)
        h=min(C(:));

[row col] = find(h==C);
%row
%col

X1=min(A(row),B(col));



[val ind] = max(X1);

i1=row(ind);
j1=col(ind);


y1= min(A(i1),B(j1));

X(i1,j1) = y1
A(i1)=A(i1)-y1
B(j1)=B(j1)-y1
C(i1,j1)=Inf
    end
end

cost = sum(sum(Init_cost.*X))
