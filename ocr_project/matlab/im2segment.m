%function [S] = im2segment(im)
%%
I = imread('..\datasets\short1\im9.jpg');
im = I<140;
inSegment = 0;
start_acc= [0];
start=0;
cut=0;

for j=1:size(im,2)
    if(im(:,j)== zeros(size(im,1),1))
        
        if(inSegment == 1)
            start = start+cut;
            start_acc=[start_acc start];
            cut=0;
            inSegment = 0;
        end
    else
        inSegment = 1;    
    end
    cut=cut+1;
end



%%
cut = 40;
first = [uint8(BW(:,1:cut)) zeros(31,461-cut)]
I_inv = uint8(255*ones(size(I)))-I;
segment = uint8(first).*I_inv
figure(i)
imshow(segment)

%%
ab = imread('..\datasets\short1\im9.jpg');
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,1);
nColors = 4;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
figure
imshow(pixel_labels,[]), title('image labeled by cluster index');
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);


