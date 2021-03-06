f = [1 4 6 8 7 5];
v = [-1,1];
%%
%g = @(x,i)(i+1-x)/i
%g(2,1)

plot(1:1:6,f,'-s','MarkerSize',5,...
    'MarkerEdgeColor','blue',...
    'MarkerFaceColor',[1 .6 .6])
%%
class1 = [0.4003,0.3988,0.3998,0.3997,0.4010,0.3995,0.3991];
class2 = [0.2554,0.3139,0.2627,0.3802,0.3287,0.3160,0.2924];
class3 = [0.5632,0.7687,0.0524,0.7586,0.4243,0.5005,0.6769];
classes = {class1,class2,class3}

for i=[1,2,3]
    scatter(classes{i}(1:4),zeros(1,4),[],i*0.3*ones(1,4),'filled','d');
    scatter(classes{i}(5:end),zeros(size(classes{i}(5:end))),[],i*0.3*ones(1,3));
    hold on;
end
%%
%Gaussian classifier
correctly_classified = 0
for i = 1:1:3
    for j = 1:1:7
        x = classes{i}(j);
        clf_probability = [normpdf(x,0.4,0.01) normpdf(x,0.3,0.05) normpdf(x,0.5,0.2)];
        [argvalue, argmax] = max(clf_probability);
        if(argmax == i)
            correctly_classified=correctly_classified+1;
        end
    end
end
correctly_classified/21
%%
epsilon = 0.05;
s1=(1-epsilon)^3*epsilon*0.5
s2 = epsilon^3*(1-epsilon)*0.25
s3  = epsilon^2*(1-epsilon)^2*0.25
alpha = 1/(s1+s2+s3)
res = [s1 s2 s3]*alpha
%%
epsilon = 0.2;
prob = @(epsilon,wrong,prio)prio*(1-epsilon)^(16-wrong)*epsilon^(wrong);

res = [prob(epsilon,6,0.3) prob(epsilon,4,0.2) prob(epsilon,6,0.2) prob(epsilon,8,0.3)]
res = res./(sum(res))

%%
p_b = 0.65^5*0.75^5*0.25^5*0.25
p_0 = 0.75^3*0.65^5*0.25^5*0.35^2*0.4
p_8= 0.75^4*0.25^3*0.65^7*0.35*0.35
res = [p_b p_0 p_8]
res = res./sum(res)
