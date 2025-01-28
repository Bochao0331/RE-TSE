# RE-TSE: Reversed Frequency-Encoding TSE Reconstruction

This repository contains MATLAB scripts for image reconstruction as described in the manuscript:

> **"Distortion correction in TSE near metal implants at 0.55T using a model-based reconstruction with a reversed frequency-encoding approach."**

## Dependencies

Before running the code, ensure that the following dependencies are installed:

1. **BART**: [Installation Instructions](https://mrirecon.github.io/bart/webinars.html)
2. **FINUFFT**: [Installation Instructions](https://finufft.readthedocs.io/en/latest/matlab.html)
3. **ISMRMD**: [Installation Instructions](https://ismrmrd.github.io/apidocs/1.5.0/)

## Usage

The primary script for reconstruction is:

- **`batch_dual_pec_recon.m`**  
  This script performs a Type-1 NUFFT reconstruction incorporating:
  - Gradient nonlinearity
  - Off-resonance displacement map-based phase-constrained CG-SENSE reconstruction

### Data

A sample dataset for total hip arthroplasty (coronal) is available on Zenodo:

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14752390.svg)](https://doi.org/10.5281/zenodo.14752390)

#### Steps to Use the Sample Data:
1. Download the dataset from Zenodo.
2. Save the files in the following structure:
   - `raw/PE_RL/` for files related to PE_RL
   - `raw/LR/` for files related to LR
3. Place `multi.json` in the `raw/` folder.

## Citation

If you use this code or dataset in your research, please cite the manuscript and Zenodo dataset:

