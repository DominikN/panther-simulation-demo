FROM ros:galactic-ros-base

# Use bash instead of sh for the RUN steps
SHELL ["/bin/bash", "-c"]

# Install ros packages and dependencies
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-demo-nodes-cpp \
    ros-$ROS_DISTRO-rmw-fastrtps-cpp && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY ros_entrypoint.sh /

RUN chmod +x /ros_entrypoint.sh