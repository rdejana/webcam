FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
# basic stuff first
RUN apt update && apt upgrade -y
RUN apt install -y python3-dev python3-pip  python3-opencv vim-tiny  libopencv-dev git \
    nodejs libffi-dev npm libwayland-egl1 gstreamer1.0-plugins-bad libgstreamer-plugins-bad1.0-0  \
     gstreamer1.0-plugins-good python3-gst-1.0
RUN pip3 install Cython numpy jupyter jupyterlab
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

RUN jupyter lab --generate-config
RUN python3 -c "from notebook.auth.security import set_password; set_password('demo', '/root/.jupyter/jupyter_notebook_config.json')"

WORKDIR /data

COPY webcam ./webcam/
COPY camera.ipynb camera.ipynb



CMD /bin/bash -c "jupyter lab --ip 0.0.0.0 --port 8888 --allow-root &> /var/log/jupyter.log" & \
	echo "allow 10 sec for JupyterLab to start @ http://$(hostname -I | cut -d' ' -f1):8888 (password demo)" && \
	echo "JupterLab logging location:  /var/log/jupyter.log  (inside the container)" && \
	/bin/bash

