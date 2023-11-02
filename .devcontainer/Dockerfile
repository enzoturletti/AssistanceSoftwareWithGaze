FROM ubuntu:20.04
WORKDIR /usr/src/app

RUN apt-get update
RUN apt install git -y
RUN apt install wget -y

RUN apt update
RUN apt install python3-pip -y

RUN pip install numpy
RUN pip install opencv-python
RUN pip install torch
RUN pip install torchvision

RUN DEBIAN_FRONTEND=noninteractive apt-get install ffmpeg libsm6 libxext6  -y

#DLIB
RUN apt-get update
RUN apt-get install build-essential cmake -y
RUN apt-get install libopenblas-dev liblapack-dev -y
RUN apt-get install libx11-dev libgtk-3-dev -y
RUN pip install dlib

RUN pip install scipy
RUN pip install PyYAML
RUN pip install matplotlib
RUN pip install -U scikit-learn
RUN pip install pynput
RUN pip install websockets

RUN pip install CProfileV
RUN pip install mediapipe

#Flutter SDK requirements
RUN apt-get update
RUN apt install curl -y
RUN apt install file -y
RUN apt install git -y
RUN apt install unzip -y
RUN apt install xz-utils -y
RUN apt install zip -y
RUN apt install libglu1-mesa  -y

# Firefox
RUN DEBIAN_FRONTEND=noninteractive apt install firefox -y

# Snap
RUN apt install snapd -y

# Flutter 
RUN git clone https://github.com/flutter/flutter.git -b stable && \
    export PATH="$PATH:`pwd`/flutter/bin" && \
    flutter precache
     
ENV PATH "$PATH:/usr/src/app/flutter/bin"

# Android Studio
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y
RUN apt-get install wget -y
RUN wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.2.1.16/android-studio-2021.2.1.16-linux.tar.gz 
RUN cd /usr/src/app && tar -xvzf android-studio-2021.2.1.16-linux.tar.gz
ENV PATH "$PATH:/usr/src/app/android-studio/bin"

RUN pip install pysimplegui
RUN  apt-get install python3-tk -y
RUN pip install plotly


RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C8B3A55A6F3EFCDE
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
RUN apt-get install librealsense2-dkms -y
RUN apt-get install librealsense2-utils -y
RUN pip install pyrealsense2

ENV PYTHONPATH=/workspaces/AssistanceSoftwareWithGaze/core:${PYTHONPATH}
ENV PYTHONPATH=/workspaces/AssistanceSoftwareWithGaze/train:${PYTHONPATH}

RUN pip install snakeviz
RUN pip install timm
RUN apt-get update && \
    apt-get -y install jq

