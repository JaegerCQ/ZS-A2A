# Zero-Shot Artifact2Artifact: Self-incentive artifact removal for photoacoustic imaging without any data

[***ArXiv paper***](https://arxiv.org/abs/2407.11781)

Photoacoustic imaging (PAI) uniquely combines optical contrast with the penetration depth of ultrasound, making it critical for clinical applications. However, the quality of 3D PAI is often degraded due to reconstruction artifacts caused by the sparse and angle-limited configuration of detector arrays. Existing iterative or deep learning-based methods are either time-consuming or require large training datasets, significantly limiting their practical application. Here, we propose Zero-Shot Artifact2Artifact (ZS-A2A), a zero-shot self-supervised artifact removal method based on a super-lightweight network, which leverages the fact that reconstruction artifacts are sensitive to irregularities caused by data loss. By introducing random perturbations to the acquired PA data, it spontaneously generates subset data, which in turn stimulates the network to learn the artifact patterns in the reconstruction results, thus enabling zero-shot artifact removal. This approach requires neither training data nor prior knowledge of the artifacts, and is capable of artifact removal for 3D PAI. For maximum amplitude projection (MAP) images or slice images in 3D PAI acquired with arbitrarily sparse or angle-limited detector arrays, ZS-A2A employs a self-incentive strategy to complete artifact removal and improves the Contrast-to-Noise Ratio (CNR). We validated ZS-A2A in both simulation study and \( in\ vivo \) animal experiments. Results demonstrate that ZS-A2A achieves state-of-the-art (SOTA) performance compared to existing zero-shot methods, and for the \( in\ vivo \) rat liver, ZS-A2A improves CNR from 17.48 to 43.46 in just 8 seconds.     
      

![image](https://github.com/JaegerCQ/ZS-A2A/blob/main/fig/pipeline.png)   
_The overview framework of Sliding Gaussian Ball Adaptive Growth algorithm. (a) The SlingBAG pipeline. (b) The forward simulation of differentiable rapid radiator. (c) Adaptive growth optimization based on iterative point cloud._

## Display of SlingBAG's results

![image](https://github.com/JaegerCQ/ZS-A2A/blob/main/fig/liver.gif) 
_Comparison of reconstruction results of rat liver between UBP and SlingBAG._    


![image](https://github.com/JaegerCQ/ZS-A2A/blob/main/fig/kidney.gif) 
_Comparison of reconstruction results of hand vessels between UBP and SlingBAG using sparse 576 sensors._    

## Guidance

The example in the provided codes is for the reconstruction of simulated hand vessel with 196 elements planar array (detailed in the article), if you want to reconstrut your own data, please replace the sensor location and sensor data files in the `train_196_elements_coarse_recon.ipynb` and `train_196_elements_fine_recon.ipynb`. Besides, the boundary set of the Gaussian balls should be modified carefully to match the reconstruction area. Sorry for all the inconvenience, we promise that the SlingBAG will soon be much more user-friendly, and we hope this guidance may help you. Good luck my friends!  
If you have any questions while using SlingBAG for 3D reconstruction, please be free to contact us. Best wishes!

## Installation

```bash
git clone https://github.com/JaegerCQ/SlingBAG.git
cd SlingBAG
```

```bash
conda create -n SlingBAG python=3.10 -y
conda activate SlingBAG
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
```

```bash
pip install -r requirements.txt
```

Warning: for Windows, it needs `setuptools <= 72.1.0`; for Linux, it needs `gcc >= 9.1`.

## Usage

### Coarse reconstruction
Run `train_196_elements_coarse_recon.ipynb`.

### Fine reconstruction
Run `train_196_elements_fine_recon.ipynb`.

### Conversion from point cloud to voxel grid
Run `point_cloud_to_voxel_grid_shader.ipynb`.

## BibTeX

```
@article{li2024slingbag,
  title={Sliding Gaussian ball adaptive growth (SlingBAG): point cloud-based iterative algorithm for large-scale 3D photoacoustic imaging},
  author={Li, Shuang and Wang, Yibing and Gao, Jian and Kim, Chulhong and Choi, Seongwook and Zhang, Yu and Chen, Qian and Yao, Yao and Li, Changhui},
  journal={arXiv preprint arXiv:2407.11781},
  year={2024}
}
```
## Ackonwledgement

We are deeply grateful to Professor Chulhong Kim and Dr. Seongwook Choi for providing the invaluable in vivo experimental data.
We are also grateful to the authors of 3D Gaussian Splatting for their great work as well as open source codes that inspire us a lot.
