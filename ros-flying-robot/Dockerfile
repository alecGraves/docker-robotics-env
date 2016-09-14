# This Dockerfile contains instructions ot setup the environment to build
#   the ksuart codebase. 
# Useful features imclude Ubuntu Xenial, ROS Kinetic, OpenCV3.1, Vim

FROM ros:kinetic-ros-core

COPY .bash_aliases /root/
COPY .vimrc /root/
COPY new_entrypoint.sh /

RUN apt-get update

# Install useful/necessary packages
RUN apt-get -y install git vim cmake catkin python3-dev python3-numpy \
	ros-kinetic-cv-bridge ros-kinetic-image-transport \
	ros-kinetic-mavlink ros-kinetic-mavros ros-kinetic-mavros-msgs \
    ros-kinetic-cmake-modules ros-kinetic-control-toolbox

# Setup catkin
RUN mkdir -p ~/catkin_ws/src && \
	cd ~/catkin_ws/src && \
	catkin_init_workspace && \
	catkin_make -j $(nproc) -C ~/catkin_ws/

# OpenCV installation
RUN cd && \
	git clone https://github.com/Itseez/opencv.git && \
	cd ~/opencv && \
	git checkout 3.1.0 && \
	mkdir build && \
	cd build && \
	cmake -D CMAKE_BUILD_TYPE=MinSizeRel  \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		-D BUILD_TESTS=OFF \
		-D BUILD_PYTHON_SUPPORT=ON \
	.. && \
	make -j $(nproc) && \
	make -j $(nproc) install && \
	ldconfig

# Install pid-controller
RUN cd && \
	git clone https://github.com/silentreverb/pid-controller.git && \
	mkdir pid-controller/build && \
	cd pid-controller/build && \
	cmake .. && \
	make -j $(nproc) &&
	make -j $(nproc) install

# Install Atlante
cd && \
git clone https://github.com/uavster/atlante.git && \
cd atlante && \
make -j $(nproc) install

# Get vim plugin manager file
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


RUN rm /ros_entrypoint.sh; \
    mv /new_entrypoint.sh /ros_entrypoint.sh; \
    chmod +x ros_entrypoint.sh; \
    rm ~/.bashrc; \
    mv /.bashrc ~/; \
	mv /.bash_aliases ~/

