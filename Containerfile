FROM ros:humble

RUN apt-get update && apt-get install -y \
      python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN python3.10 -m pip install torch --no-cache-dir --index-url https://download.pytorch.org/whl/cpu
RUN python3.10 -m pip install --no-cache-dir flowcean==0.7.0b1
RUN mkdir -p ~/ros2_ws/src && \
    cd ~/ros2_ws/src && \
    git clone https://github.com/flowcean/flowcean-ros.git && \
    cd ~/ros2_ws && \
    colcon build --packages-select flowcean_ros
