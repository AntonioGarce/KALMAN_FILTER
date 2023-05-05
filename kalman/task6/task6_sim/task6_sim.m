k=0;
for i=1:8
    for j=1:2
        k=k+1;
        figure(k);
        y=reshape(gain(i,j,:),[1,74]);
        plot(y);
        title(['kalman gain[',num2str(i),',',num2str(j),']']);        
    end
end
