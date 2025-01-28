% batch_dual_pec_recon.m
% Phase-constrained CG-SENSE recon to correct GNL and off-reosance
% distortion by incoorporating displacement maps.
% Written by Bochao Li
% Email: bochaoli@usc.edu

%% Clean slate
close all; clear all; clc;

%% Set source directories
ismrmrd_path   = ''; % Your ISMRMD path
src_path = './src';
grad_file_path = './src/GradientCoils';

%% Add source directories to search path
addpath(genpath(package_path));
addpath(genpath(ismrmrd_path));

%% Define a .json file
json_files{1} = './raw/PE_RL/meas_MID00223_FID05443_pd_tse_cor_150_PE_RL.json';
json_files{2} = './raw/PE_LR/meas_MID00224_FID05444_pd_tse_cor_150_PE_LR.json';

%% Calculate the number of json files
nr_json_files = length(json_files);

%% Perform image reconstruction per echo
for json_number = 1:2
    %----------------------------------------------------------------------
    % Set a .json file
    %----------------------------------------------------------------------
    json_file = json_files{json_number};

    %----------------------------------------------------------------------
    % Step 1
    %----------------------------------------------------------------------
    demo_step1_calculate_voxel_coordinates;

    %----------------------------------------------------------------------
    % Step 2
    %----------------------------------------------------------------------
    demo_step2_prepare_ksp;

    %----------------------------------------------------------------------
    % Step 3: Estimate coil sensitivity maps
    %----------------------------------------------------------------------
    demo_step3_estimate_csm;
    
   %----------------------------------------------------------------------
   % Step 4: Perform type-1 based SENSE reconstruction
   %----------------------------------------------------------------------
    demo_step4_cartesian_recon;
 
end
return

%% Please Change topup_correction_flag 0 to 1 in two json files under two raw folders.
% Perform off-resoance distortion correction on each data set
for json_number = 1:2
    demo_step4_cartesian_recon
end

%% Phase constrained CG-SEnSE using two data Recon
demo_step5_cartesian_dual_pecsense_recon;





