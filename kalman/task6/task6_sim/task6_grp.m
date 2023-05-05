%initialize params

maxstep=50;
simlen = 72; %simulation length
state_error1 = zeros(8,simlen,maxstep); %state errors for post state estimations
error_budget1=zeros(8,maxstep);
state_error2 = zeros(8,simlen,maxstep); %state errors for post state estimations
error_budget2=zeros(8,maxstep);
state_error3 = zeros(8,simlen,maxstep); %state errors for post state estimations
error_budget3=zeros(8,maxstep);
state_error4 = zeros(8,simlen,maxstep); %state errors for post state estimations
error_budget4=zeros(8,maxstep);
state_error5 = zeros(8,simlen,maxstep); %state errors for post state estimations
error_budget5=zeros(8,maxstep);
state_error6 = zeros(8,simlen,maxstep); %state errors for post state estimations
error_budget6=zeros(8,maxstep);
state_error7 = zeros(8,simlen,maxstep); %state errors for post state estimations
error_budget7=zeros(8,maxstep);
err_budget1=zeros(8,1);
err_budget2=zeros(8,1);
err_budget3=zeros(8,1);
err_budget4=zeros(8,1);
err_budget5=zeros(8,1);
err_budget6=zeros(8,1);
err_budget7=zeros(8,1);

for i=1:8
    for j=2:simlen
        for k =1:maxstep
            state_error1(i,j,k)=sterr_post_grp1(j+simlen*(k-1),i);      %get stderr_post from simulation result
            state_error2(i,j,k)=sterr_post_grp2(j+simlen*(k-1),i);      %get stderr_post from simulation result
            state_error3(i,j,k)=sterr_post_grp3(j+simlen*(k-1),i);      %get stderr_post from simulation result
            state_error4(i,j,k)=sterr_post_grp4(j+simlen*(k-1),i);      %get stderr_post from simulation result
            state_error5(i,j,k)=sterr_post_grp5(j+simlen*(k-1),i);      %get stderr_post from simulation result
            state_error6(i,j,k)=sterr_post_grp6(j+simlen*(k-1),i);      %get stderr_post from simulation result
            state_error7(i,j,k)=sterr_post_grp7(j+simlen*(k-1),i);      %get stderr_post from simulation result
        end
    end
end

for i=1:8
    for k=1:maxstep
        error_budget1(i,k)=(max(state_error1(i,:,k))-min(state_error1(i,:,k)))/2;
        error_budget2(i,k)=(max(state_error2(i,:,k))-min(state_error2(i,:,k)))/2;
        error_budget3(i,k)=(max(state_error3(i,:,k))-min(state_error3(i,:,k)))/2;
        error_budget4(i,k)=(max(state_error4(i,:,k))-min(state_error4(i,:,k)))/2;
        error_budget5(i,k)=(max(state_error5(i,:,k))-min(state_error5(i,:,k)))/2;
        error_budget6(i,k)=(max(state_error6(i,:,k))-min(state_error6(i,:,k)))/2;
        error_budget7(i,k)=(max(state_error7(i,:,k))-min(state_error7(i,:,k)))/2;
    end
    err_budget1(i)=max(error_budget1(i,:));
    err_budget2(i)=max(error_budget2(i,:));
    err_budget3(i)=max(error_budget3(i,:));
    err_budget4(i)=max(error_budget4(i,:));
    err_budget5(i)=max(error_budget5(i,:));
    err_budget6(i)=max(error_budget6(i,:));
    err_budget7(i)=max(error_budget7(i,:));
end


lin=1:maxstep;
for i=1:8
    figure(i);
    plot(lin,error_budget1(i,:),'-',lin,error_budget2(i,:),'o',lin,error_budget3(i,:),'*',lin,error_budget4(i,:),'--',lin,error_budget5(i,:),'-.',...
    lin,error_budget6(i,:),'--gs',lin,error_budget7(i,:),'--bs');
    legend('grp1','grp2','grp3','grp4','grp5','grp6','grp7');
end






