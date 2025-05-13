# BeatCraft: AI-Enhanced Music Production Using SE-ViT

This repository contains the official MATLAB implementation of the paper:

> **BeatCraft: AI-Enhanced Music Production Using Squeeze and Excitation Vision Transformer**

## 🧠 Overview

BeatCraft introduces a deep learning framework for automatic choreography generation using a modified Vision Transformer (ViT) architecture enhanced with Squeeze-and-Excitation (SE) blocks. The model synchronizes music with motion by learning beat-aligned correlations between human pose sequences and audio features.

## 📁 Project Structure

- `step1_preprocess_images.m` – Load and preprocess image dataset
- `step2_kmeans_quantization.m` – Pose quantization using K-Means clustering
- `step3_sevit_forward.m` – Forward implementation of SE-ViT transformer
- `step4_loss_function.m` – Custom loss combining pose, motion, and sync error
- `step5_de_optimization.m` – Differential Evolution optimizer with 3 variants
- `step6_visualize_output.m` – Visualizes synchronized dance choreography

## 🧰 Dependencies

- MATLAB R2021a or newer
- Image Processing Toolbox
- Statistics and Machine Learning Toolbox
- Deep Learning Toolbox

## 📦 Dataset

The dataset used is the **AIST++ Human Dance Pose Dataset**. Please download it from:

[AIST++ Dataset](https://google.github.io/aistplusplus_dataset/factsfigures.html)

Place the pose image dataset in the `images/` directory before execution.

## ⚙️ Training & Execution

1. Run `step1_preprocess_images.m` to load and normalize the pose image dataset.
2. Apply K-means quantization with `step2_kmeans_quantization.m`.
3. Train SE-ViT model using `step3_sevit_forward.m`.
4. Optimize using `step5_de_optimization.m` with custom DE variants.
5. Visualize results with `step6_visualize_output.m`.

## 🧪 Optimization Variants

Three DE mutation strategies are included:
- Fixed (F = 0.5)
- Random (`F = rand()`)
- Log-sigmoid (`F = logsig()`)

## 📊 Results

The model achieves:
- FIDk = 32.78, FIDg = 11.37
- Beat Align Score = 0.257
- Classification Accuracy = 97.02%
- FLOPs ≈ 0.8127G

## 📄 License

This project is released under the MIT License.

## 🙏 Acknowledgment

Special thanks to the AIST++ dataset creators and the academic contributions cited in the paper.
