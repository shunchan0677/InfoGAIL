FROM nvidia/cuda:8.0-devel-ubuntu16.04
# Shunya SEIYA <shunya.seiya@tier4.jp>
RUN apt-get update
RUN apt-get install python -y

RUN  apt install python-pip -y

RUN pip install numpy==1.11.0
RUN pip install scipy==0.14
RUN pip install tensorflow==0.12.1
RUN pip install keras==1.2.2
RUN pip install pillow==5.0.0
RUN apt-get install xautomation -y

RUN apt-get install libplib-dev -y
RUN apt-get install libopenal-dev -y
RUN apt-get install libalut-dev -y
RUN apt-get install git -y

RUN git clone https://github.com/shunchan0677/InfoGAIL
RUN apt-get install libvorbis-dev -y
RUN apt-get install libpng-dev -y
RUN apt-get install libz-dev -y
RUN apt-get install libxrandr-dev -y
RUN apt-get install libxrender-dev -y
RUN apt-get install libxi-dev -y
RUN apt-get install libxmu-dev -y
RUN cd InfoGAIL/torcs-1.3.4;./configure;make;make install;make datainstall

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV PATH "/usr/lib/nvidia-418/bin":${PATH}
ENV LD_LIBRARY_PATH "/usr/lib/nvidia-418:/usr/lib32/nvidia-418":${LD_LIBRARY_PATH}

RUN cp -r InfoGAIL/modified_tracks/* /usr/local/share/games/torcs/tracks/road
RUN rm -rf .torcs
RUN cp -r InfoGAIL/torcs_config_ai_0 .torcs

RUN pip install --upgrade pip
RUN pip install mock
RUN pip install gym
RUN pip install matplotlib
RUN apt install python-tk -y
RUN  apt-get install  libopencv-dev -y
RUN pip install opencv-python
RUN pip install h5py
RUN apt install gedit -y
# Default CMD
CMD ["/bin/bash"]
