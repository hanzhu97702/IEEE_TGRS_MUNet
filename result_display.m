clear;clc;close all;
addpath(genpath('data'));
addpath(genpath('result'));

dataset = 'muffle';
switch dataset
    case 'muffle'
        load muffle_dataset_130_90.mat M label
        load muffle_result.mat
    case 'houston170'
        load houston_170_dataset.mat M label
        load houston170_result.mat  
end
%% calculate evaluation metrics
[row, col, num_class] = size(label);
band = size(M,1);

RMSE = sqrt(sum(sum(sum((abu_est-label).^2)))/(row*col*num_class))
[SAD, SADerr]=SadEval(M_est, M)
%% display abundance and endmember results
figure;
for i = 1:num_class
    subplot(2,num_class,i);
    imagesc(abu_est(:,:,i));axis off;
    colormap(jet);
    
    subplot(2,num_class,i+num_class);
    imagesc(label(:,:,i));axis off;
    colormap(jet);
end

figure;
plot(M_est,'LineWidth',1.5);xlabel('Bands');ylabel('Reflectance')