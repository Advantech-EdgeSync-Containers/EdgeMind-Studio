# Container Overview

After the container is launched, it will start the **EdgeMind Studio** application based on the **Jetson** or **Atlas** platform, providing the following core functionalities:

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

- NVIDIA Jetson platform (Xavier NX/AGX, Orin Nano/NX/AGX, or later)

## Software

- Docker (version 20.10 or higher)
- Docker Compose (version 1.29 or higher)


# Container Quick Start
## Setup Steps:
### For Jetston Platform
```shell
# git clone https://github.com/Advantech-EdgeSync-Containers/EdgeMind-Studio.git
# cd EdgeMind-Studio
# docker-compose -f docker-compose-jetson-jp6.2.yml up -d
```
### For Huawei Atlas Platform
```shell
# docker pull  harbor.edgesync.cloud/xian-embedded/edgemind-studio-huawei-arm64:v1.0.0
# git clone https://github.com/Advantech-EdgeSync-Containers/EdgeMind-Studio.git
# cd EdgeMind-Studio
# chmod 777  run_edgemindstudio.sh
# ./run_edgemindstudio.sh
```
## How to use?
Once the setup is complete, you can access EdgeMind-Studio through a web browser at http://$ip:8080, where $ip refers to the device’s actual IP address.

