# webcam
This repository provides an example of how to use camera inside a Jupyter notebook. 
It is built from NVIDIA's Jetbot [https://github.com/NVIDIA-AI-IOT/jetbot].  

# Running natively
This hsa been tested on a VM running Ubuntu 22.04 using the host's (MacBook Pro) integrated camera.

## Setup 

### Install OS packages
You'll need to run the following commands as `root` to install necessary packages:
- apt update
- apt upgrade -y
- apt install -y python3-dev python3-pip  python3-opencv vim-tiny  libopencv-dev git
- apt install -y nodejs libffi-dev npm libwayland-egl1 gstreamer1.0-plugins-bad libgstreamer-plugins-bad1.0-0 gstreamer1.0-plugins-good python3-gst-1.0
- pip3 install Cython
- pip3 install numpy
- pip3 install jupyter jupyterlab
- jupyter labextension install @jupyter-widgets/jupyterlab-manager

Once complete, you may use a `normal` user.

### Clone respositry
Clone this repository with the following command
```
git clone https://github.com/rdejana/webcam
```
And change into the directory `webcam` jupyter,

## Running
From the `webcam` directory, start jupter.
```
jupyter lab --ip 0.0.0.0 --port 8888 
```
Open a browser login into your jupyter instance.

Open the notebook `camera.ipynb`.


# Running in Docker

Requires openCV with gstreamer installed

See https://github.com/NVIDIA-AI-IOT/jetbot/blob/master/docker/base/Dockerfile

setup details are coming soon

As root
# Install jupyter lab
RUN apt-get update

RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get install -y nodejs libffi-dev npm

RUN pip3 install jupyter jupyterlab==2.2.6

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

apt-get update && \

sudo  apt-get install -y libwayland-egl1 gstreamer1.0-plugins-bad libgstreamer-plugins-bad1.0-0 gstreamer1.0-plugins-good python3-gst-1.0



jupyter lab --ip 0.0.0.0 --port 8888 