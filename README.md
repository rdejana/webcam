# webcam
Fun with a camera and a Jupyter Notebook

Requires openCV with gstreamer installed

See https://github.com/NVIDIA-AI-IOT/jetbot/blob/master/docker/base/Dockerfile

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