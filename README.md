# webcam
This repository provides an example of how to use a USB camera inside a Jupyter notebook. 

It is built from NVIDIA's (Jetbot)[https://github.com/NVIDIA-AI-IOT/jetbot].  

Currently, there are 2 approaches:
- GStream based approach using v4l2src to read from the camera. Can do a bit more, but more complicated as a result.
- Simple OpenCV approach using cv2.VideoCapture(deviceId).  Simple, but maybe not as powerful

The notebook gs_camera.ipynb leverages the GStream approach while camera.ipynb using the pure OpenCV approach.

If you are running in a non-linux environment, you'll most likely want to install OpenCV via the python module:
```
pip3 install opencv-python`
```

# Running natively on Linux
This hsa been tested on a VM running Ubuntu 22.04 using the host's (MacBook Pro) integrated camera.  
It should work with other USB cameras, but more testing will be needed.  

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
And change into the directory `webcam`.

## Running
From the `webcam` directory, start jupyter.
```
jupyter lab --ip 0.0.0.0 --port 8888 
```
Open a browser login into your jupyter instance.

If you would like to surpress any OpenCV related messages, run the following before starting jupyter:
```angular2html
export OPENCV_LOG_LEVEL=OFF
```

Open the notebook of your choice.


# Running in Docker

## Building container
Clone this repository with the following command:
```
git clone https://github.com/rdejana/webcam
```
And change into the directory `webcam`.

Run the command `docker build -t <imageName> .`
where `<imageName>` is the tag name you'd like to use.

## Running
After the image has been built, you can run the container with the following command:
```
    docker run -it --rm -p 8888:8888 --device /dev/video<deviceId> <imageName>
```
where `deviceId` is the device number of your camera, e.g. 0 and `<imageName>` is the name of the image.

Open a browser login into your jupyter instance, the password is `demo` by default.

Open the notebook of your choice.
