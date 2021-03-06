proj_scalar2=@(u,v)(@(v)(sum(sum(u.*v))/norm(v)))
proj_scalar=@(u,v) sum(sum(u.*v))/norm(v)
data = load('assignment1bases.mat')
figure(1)
image = data.stacks{1}(:,:,5);
show(image)
b1 = data.bases{1}(:,:,1);
b2 = data.bases{1}(:,:,2);
b3 = data.bases{1}(:,:,3);
b4 = data.bases{1}(:,:,4);
coefficients = [ proj_scalar(image,b1) proj_scalar(image,b2) proj_scalar(image,b3) proj_scalar(image,b4)];
coefficients2 = arrayfun(proj_scalar2(image),data.bases{1});
%Unreadable line thanks to matlab.. However, it maps the image matrix on
%the coefficients so we get the image's projection on each base matrix.
%Then we sum them to get the final projection.
projected_image = sum(bsxfun(@times,data.bases{1},reshape(coefficients,1,1,numel(coefficients))),3)
figure(2)
imshow(uint8(projected_image),'InitialMagnification','fit')
error_norm = norm(image-projected_image)

