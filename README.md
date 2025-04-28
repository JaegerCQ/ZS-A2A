# Zero-Shot Artifact2Artifact: Self-incentive artifact removal for photoacoustic imaging without any data

[***Paper accepted in Photoacoustics***](https://doi.org/10.1016/j.pacs.2025.100723)   
[***ArXiv paper***](https://arxiv.org/abs/2412.14873)

Photoacoustic imaging (PAI) uniquely combines optical contrast with the penetration depth of ultrasound, making it critical for clinical applications. However, the quality of 3D PAI is often degraded due to reconstruction artifacts caused by the sparse and angle-limited configuration of detector arrays. Existing iterative or deep learning-based methods are either time-consuming or require large training datasets, significantly limiting their practical application. Here, we propose Zero-Shot Artifact2Artifact (ZS-A2A), a zero-shot self-supervised artifact removal method based on a super-lightweight network, which leverages the fact that reconstruction artifacts are sensitive to irregularities caused by data loss. By introducing random perturbations to the acquired PA data, it spontaneously generates subset data, which in turn stimulates the network to learn the artifact patterns in the reconstruction results, thus enabling zero-shot artifact removal. This approach requires neither training data nor prior knowledge of the artifacts, and is capable of artifact removal for 3D PAI. For maximum amplitude projection (MAP) images or slice images in 3D PAI acquired with arbitrarily sparse or angle-limited detector arrays, ZS-A2A employs a self-incentive strategy to complete artifact removal and improves the Contrast-to-Noise Ratio (CNR). We validated ZS-A2A in both simulation study and _in vivo_ animal experiments. Results demonstrate that ZS-A2A achieves state-of-the-art (SOTA) performance compared to existing zero-shot methods, and for the _in vivo_ rat liver, ZS-A2A improves CNR from 17.48 to 43.46 in just 8 seconds.     
      

![image](https://github.com/JaegerCQ/ZS-A2A/blob/main/fig/pipeline.png)      
_The overview of Zero-Shot Artifact2Artifact pipeline._       

## Display of ZS-A2A's results

![image](https://github.com/JaegerCQ/ZS-A2A/blob/main/fig/liver.gif)        
_3D PA reconstruction results of a rat liver._         


![image](https://github.com/JaegerCQ/ZS-A2A/blob/main/fig/kidney.gif)         
_3D PA reconstruction results of a rat kidney._        

## Installation

```bash
git clone https://github.com/JaegerCQ/ZS-A2A.git
cd ZS-A2A
```

```bash
conda create -n ZS_A2A python=3.10 -y
conda activate ZS_A2A
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
```

```bash
pip install -r requirements.txt
```

## Usage

### Artifact removal slice-by-slice
Run `PA_liver_phantom_3D.ipynb`. The processed slices will be stored in folder named "clean_liver_phantom".    
After artifact removal, please run `slice2volume.m` (with MATLAB) to convert the slices back to 3D PA volume 'ZS_A2A_liver_Phantom.mat'.     
If you have any questions, please be free to contact us. (email address: 2201112460@stu.pku.edu.cn)
## Citation

```
@article{li2025zero,      
  title={Zero-Shot Artifact2Artifact: Self-incentive artifact removal for photoacoustic imaging},       
  author={Li, Shuang and Chen, Qian and Kim, Chulhong and Choi, Seongwook and Wang, Yibing and Zhang, Yu and Li, Changhui},       
  journal={Photoacoustics},       
  pages={100723},     
  year={2025},     
  publisher={Elsevier}      
}             
```
## Ackonwledgement

We are deeply grateful to Professor Chulhong Kim and Dr. Seongwook Choi for providing the invaluable in vivo experimental data.
We are also grateful to the authors of ZS-N2N for their great work as well as open source codes that inspire us a lot.
