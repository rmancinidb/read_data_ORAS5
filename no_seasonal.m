

salt_int = sal_eq;


j = 1;

for p = 1:12
    for i=p:12:168
        salt(p,j) = salt_int(i);
        j = j+1;
    end
    j = 1;
end

%fila = month, columna = year

%% mean per month

salt_noseason = [];
salt_mon = [];

for i=1:12
    salt_mon = salt(i,:);
    mean(i) = sum( salt_mon , 'all' )/14;
end

for i=1:12
     for j=1:14
        salt_noseason(i,j) = salt(i,j)-mean(i);
     end
end

salt_noseason = salt_noseason';
salt_noseason2 = reshape(salt_noseason.',1,[]);


t = 1:168;
t = t/12+2008;

figure()
subplot(2,1,1)
plot(t,salt(1:168))
xlabel('t (years)')
ylabel('salt (Psu)')
title('raw data')
subplot(2,1,2)
plot(t,salt_noseason2)
xlabel('t(years)')
title('no seasonal data')

%% total mean

total_mean = sum( salt_int , 'all' )/length(salt_int);

%mean_line = total_mean*ones(1,168);

