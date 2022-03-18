# panther-simulation-demo

Using Panther simulation demo with DDS-Router and Husarnet

## Use cases

### One Docker network, no DDS Router

To run RViz, Gazego and Nav2 containers in a single Docker network without DDS router and without Husarnet execute:

```
cd demo_localhost/
xhost local:root
docker compose up
```

Results: works fine (please note that Gazebo needs even a few minutes to load itself)

### Multiple docker networks

Run RViz, Gazego and Nav2 containers in a multiple Docker networks for
- Rviz + listener (just for a simple connectivity check) + DDS Router no.1 (Discovery Server client)
- Nav2 + Panther Gazebo simulation + talker (just for a simple connectivity check) + DDS Router no.2 (Discovery Server server)
- DDS Router no.1 + DDS Router no.2

All the traffic between Nav2, Gazebo on one end, and RViz on the second end goes through two DDS Routers.

```
cd demo_localhost_ds/
xhost local:root
docker compose up
```

Results: something with ROS 2 topic/service discovery is broken. While examining available topics on two ends (eg. on "listner" end: `docker exec -it <listener-container-id> bash` > `source "/opt/ros/$ROS_DISTRO/setup.bash"` > `ros2 topic list`) there is no a full list.