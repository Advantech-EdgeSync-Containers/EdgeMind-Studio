# Container Overview

After the container is launched, it will start the **EdgeMind Studio** application based on the **NVIDIA Jetson** or **HUAWEI Atlas** platform, providing the following core functionalities:

**1. Video Management Features**
- **Multi-source Video Management:** Supports local cameras, IP network cameras, and uploaded MP4 video files.

- **NVR (Network Video Recorder):** Records and enables playback of connected camera feeds.

**2. Video AI Analysis & Performance Monitoring**
- **Model Management:** Provides AI model deployment and management for flexible and convenient scalability.

- **AI Intelligent Analysis:** Real-time object detection based on the YOLO model for camera feeds or MP4 videos, with alert notification support.

- **Video AI Region Detection (ROI Analysis):** Allows defining key detection regions (ROI) in the video frame, focusing AI analysis only on specified areas to reduce computational load.

- **Performance Monitoring:** Displays real-time AI processing metrics, including video frame rate, model failure rate, and CPU/GPU resource usage.

- **Multi-screen Live Viewing:** Supports simultaneous display of multiple video streams for real-time monitoring.

# Container Demo

![EdgeMind-Stuido_jetson-demo-1](https://github.com/user-attachments/assets/bd595a4c-03b1-4123-a7ca-2f0d91558f82)

![EdgeMind-Studio_jetson_demo4](https://github.com/user-attachments/assets/7d0a0d20-56f8-4e2b-b1ec-6df2d47b04b3)



# Requirements

## Hardware

- **NVIDIA Jetson platform**
  
  Verified Device: MIC-332/ITA-560 

- **HUAWEI Atlas platform**
  
  Verified Device: MIC-ATL2S

## Software

- Docker (version 20.10 or higher)
- Docker Compose (version 1.29 or higher)


# Container Quick Start
We offer two ways to launch EdgeMind Studio: **Docker-Compose** and **script-based startup**. You can use either method as preferred.
## Step 1: Download the launch scripts and docker-compose.yaml file
```shell
git clone https://github.com/Advantech-EdgeSync-Containers/EdgeMind-Studio.git
```
## Step 2: Start EdgeMind Studio container

### For NVIDIA Jetston Platform
If you want to start using Docker Compose
```shell
cd EdgeMind-Studio 
docker-compose -f docker-compose-jetson.yml up -d
```
**Or** if you prefer to launch via a run script
```shell
cd EdgeMind-Studio 
chmod 777 run_edgemindstudio_jetson.sh
./run_edgemindstudio_jetson.sh
```
### For HUAWEI Atlas Platform
On HUAWEI platforms, use the model-specific docker-compose yaml or script.

If you want to start using Docker Compose
```shell
cd EdgeMind-Studio
docker-compose -f docker-compose-atlas310b.yml up -d 
```
**Or** if you prefer to launch via a run script
```shell
cd EdgeMind-Studio 
chmod 777 run_edgemindstudio_atlas310b.sh
./run_edgemindstudio_atlas310b.sh
```
## How to use?
Once the setup is complete, you can access EdgeMind-Studio through a web browser at http://$ip:8080, where $ip refers to the device’s actual IP address.

