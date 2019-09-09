data = load('assignment1bases.mat');
total_err = 0;
total_err2=0;
basis = data.bases{3};
for k = 1:400
    img = data.stacks{1}(:,:,k);
    img2 = data.stacks{2}(:,:,k);
    [proj, err] = project_img(img,basis);
    [proj2, err2] = project_img(img2,basis);
    total_err = total_err+err;
    total_err2 = total_err2+err2;
end

mean_err1 = total_err/400
mean_err2 = total_err2/400