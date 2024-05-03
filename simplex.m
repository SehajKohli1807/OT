%{
Max Z = 8x1-2x2+0s1+0s2-Ma1
s.t.  12x1+x2+s1=9
      5x1-7x2-s2+a1=2


%}

clc
clear all
C=[8 -2 0 0 -1000 0];
A1=[12 1 1 0 0;5 -7 0 -1 1];
B=[9;2];


A=[A1 B];
nv=2;
BV=[3 5];
Zc=C(BV)*A-C;
simplex_table=[A;Zc]
%array2table(simplex_table,'VariableNames',{'x1','x2','s1','s2','soln'});
run=1;
while run
    if any(Zc(1:end-1)<0)
        [min_Zc, pvt_col_no]=min(Zc(1:end-1));
        pvt_col=A(:,pvt_col_no);
        sol=A(:,end);
        

        if all(pvt_col<=0)
            fprintf('Solution is Unbounded');
        else
            for i=1:size(A,1)
                if pvt_col(i)>0
                    ratio(i)=sol(i)/pvt_col(i);
                else
                    ratio(i)=inf;
                end
            end

            [min_ratio, pvt_row_no]=min(ratio);
        end

        BV(pvt_row_no)=pvt_col_no;
        pvt_key=A(pvt_row_no,pvt_col_no);
        A(pvt_row_no,:)=A(pvt_row_no,:)/pvt_key;
        for i=1:size(A,1)
            if i~=pvt_row_no
                A(i,:)=A(i,:)-A(i,pvt_col_no)*A(pvt_row_no,:);
            end
        end

        Zc=C(BV)*A-C;
        next_simplex_table=[A;Zc]
        %rray2table(next_simplex_table,'VariableNames',{'x1','x2','s1','s2'});
    else
        run=false;
        fprintf('ANS:%f',Zc(end));
    end
end
