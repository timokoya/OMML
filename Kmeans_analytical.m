function [M,j,Error]= Kmeans_analytical(C)
load kmeansdata;
[m,n]=size(X);
No_of_iterations=15;
I=randperm(numel(X)/n);
M=X(I(1:C),:);
Mo=M;
iter=1;
Error=zeros(No_of_iterations,1);
for n=1:No_of_iterations
    for k=1:C
        E_Distance(:,k)=sum((X-repmat(M(k,:),m,1)).^2,2)';
    end
    [b,j]=min(E_Distance,[],2);
    for k=1:C
        if size(find(j==k))>0;
            M(C,:)=mean(X(j==k,:));
        end
        Z=zeros(m,C);
        for p=1:m
            Z(p,j(p))=1;
        end
       
           error=sum(sum(Z.*E_Distance)./m); % calcualte the error to the center
             
             plot_error(iter,error);
           fprintf('%d Error = %f\n',n,error);
           Mo=M;
    end
    iter=iter+1;
end