FROM ros:humble

# Install dependencies
RUN apt-get update && apt-get install -y \
      python3-pip \
      ros-humble-turtlesim \
      ros-humble-rviz2 \
      git \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN python3 -m pip install --no-cache-dir \
      --index-url https://download.pytorch.org/whl/cpu \
      torch

# Install flowcean
RUN python3 -m pip install --no-cache-dir \
      flowcean==0.7.0b1

# Set up ROS2 workspace and clone the desired branch
WORKDIR /root/ros2_ws/src
RUN git clone --branch launch --single-branch https://github.com/flowcean/flowcean-ros.git

# Build the workspace
WORKDIR /root/ros2_ws
RUN . /opt/ros/humble/setup.sh && colcon build --packages-select flowcean_ros

SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/bin/bash", "-c", "source /root/ros2_ws/install/setup.bash && exec \"$@\"", "--"]
