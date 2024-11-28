### **TrackRAD2025**

#### **Real-time Tumor Tracking for MRI-guided Radiotherapy**

#### **🎯 Background**

The use of magnetic resonance imaging (MRI) to visualize and
characterize motion is becoming increasingly important in the treatment
of cancer patients, especially in radiotherapy. For tumors affected by
respiratory motion, effective motion management is crucial to ensure a
high radiation dose to the tumor while sparing neighboring organs. The recent development of MRI-guided radiotherapy, based on hybrid MRI-linear accelerator (linac) systems \[<a href="https://www.nature.com/articles/s41571-022-00631-3"   style="" target="_blank">Keall et al., 2022</a>\], called MRI-linacs, offers the possibility to adapt to changes in tumor position during treatment. 2D cine-MRI allows real-time tumor motion visualization and allows closely following the tumor with the radiation beam but requires tumor localization on all time-resolved frames. This needs to be done in real-time, with frame rates of 1 to 8 Hz or more, with high accuracy and robustness to ensure the sparing of critical organs. Currently, clinically available solutions rely on conventional deformable image registration (DIR) to propagate contours from a labeled frame or on template matching and struggle with large non-rigid motion. This limits treatment to beam gating, where the beam is turned off for large motion. The fast inference of artificial intelligence (AI) methods, obtained by shifting computation time to the training phase, is promising for this task \[<a href="https://www.thegreenjournal.com/article/S0167-8140(23)89864-4/abstract"   style="" target="_blank">Lombardo et al., 2024</a>\].
TrackRAD2025 will impact the field of MRI-guided radiotherapy by providing cine-MRI data from multiple MRI-linac institutions to test competitive real-time tumor localization methods based on a unified platform for comparison.

#### <img src="https://rumc-gcorg-p-public.s3.amazonaws.com/i/2024/11/26/2d47f8de-899c-4522-9154-14b651d5ab9b.png" style="width: 600px;" />


#### **Objective**



TrackRAD2025 will provide the first public multi-institutional dataset and evaluation platform to compare the latest developments in cine-MRI-based tumor tracking methods competitively. Both unlabeled (>500 patient cases) and labeled datasets (at least 100 patient cases with 2D cine-MRI frame sequences where the tumor is manually segmented) will be provided for model development and testing. Six international centers will provide data (3 Dutch, 1 German, 1 Australian, and 1 Chinese). The data from 0.35 T and 1.5 T MRI-linacs will be divided into a public training set and a private test set to calculate evaluation metrics. The challenge will feature a preliminary testing (validation) phase with 6 private exemplary sample cases and a final testing phase with 50 private cases. 

<video src="https://github.com/LMUK-RADONC-PHYS-RES/trackrad2025/raw/refs/heads/main/images/GIF_overlay_preds_mediastinum02.mp4" style="width: 50%" controls muted autoplay></video>

Submitted algorithms will be evaluated based on their ability to reproduce ground truth segmentation labels on the test set, using the following metrics:

- Dice similarity coefficient
- 95th percentile of the surface distance distribution
- The mean average surface distance
- Euclidian 2D center-of-mass error
- Dosimetric accuracy under simulated MLC tracking
- Speed of inference

A detailed description of these metrics and the ranking process can be found [here](https://trackrad2025.grand-challenge.org/metrics/).

#### **Outcome**
TrackRAD will allow determining the most promising methods to improve clinical tumor tracking on cine-MRI at MRI-linacs, which will benefit patients suffering from various motion-affected tumor entities with more accurate dose delivery. This will also lead the way to multi-leaf collimator tracking at MRI-linacs instead of gating, where the radiation beam follows the movement of the tumor to deliver radiation more efficiently and shorten treatment times for an increased number of treatments per day.
