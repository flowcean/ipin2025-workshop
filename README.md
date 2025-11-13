# IPIN 2025 Workshop - Creating Data-Driven Models for Robot Localization Systems using Flowcean

This repository contains the material for the workshop "Creating Data-Driven Models for Robot Localization Systems using [Flowcean](https://github.com/flowcean/flowcean)" at the International Conference on Indoor Positioning and Indoor Navigation (IPIN) 2025.

## Running the Jupyter Notebook on Google Colab

If you want to code along, use the [tasks notebook](https://colab.research.google.com/github/flowcean/ipin2025-workshop/blob/main/tasks.ipynb).

The [solutions notebook](https://colab.research.google.com/github/flowcean/ipin2025-workshop/blob/main/solutions.ipynb) lets you run the complete solution.

Now you should have a model that can predict the position of the turtlesim.
If you want to see the model in action, follow the instructions below.

## Deploying the Model in ROS2

We provide a container file for this that includes all dependencies. To run the container, make sure you have [Docker](https://docs.docker.com/get-docker/) installed.
This demonstrator requires opening windows for the Simulation and the plotting tool _plotjuggler_. 

Here are some instructions on how to get it to run on different platforms.

   <details>
   <summary>Linux</summary>

   
Allow GUI programs running as root on the local machine. This is needed in order to open the simulation and _plotjuggler_.
      
   ```bash
xhost +local:root  
   ```

   Just run the following command:
   
   ```bash
docker run -it --rm \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --device /dev/dri \
  ghcr.io/flowcean/ipin2025-workshop/flowcean-turtle:latest \
  bash -c "
    cd /root/ros2_ws/src/flowcean-ros && \
    git pull origin main && \
    cd ../.. && \
    colcon build --packages-select flowcean_ros && \
    source /root/ros2_ws/install/setup.bash && \
    (
      ros2 run turtlesim turtlesim_node & \
      ros2 run turtlesim turtle_teleop_key & \
      ros2 run plotjuggler plotjuggler -n & \
      ros2 launch flowcean_ros deploy.launch.py
    )
  "

   ```
   Now, you should see the turtlesim window and PlotJuggler open on your Windows desktop.
   </details>

   <details>
   <summary>Windows PowerShell with Docker Desktop</summary>

   
   By default, Windows does not provide an X server, which means Docker containers cannot directly display graphical windows.  
   The following steps show you how to enable GUI applications from Docker on Windows.
   
   ### Step 1: Install and run an X server
   
   1. Install [**VcXsrv**](https://sourceforge.net/projects/vcxsrv/) (or [Xming](https://sourceforge.net/projects/xming/)).
   2. Launch it via **XLaunch**:
   
      * Select **“Multiple windows”**
      * Set **Display number = 0**
      * Tick **“Disable access control”** (important, otherwise Docker can’t connect)
      * Finish → leave it running in the background (you should see an icon in the tray).
   

   
   ### Step 2: Set the DISPLAY variable in PowerShell
   
   Before running Docker, set the `DISPLAY` environment variable in your PowerShell session:
   
   ```powershell
   $env:DISPLAY="host.docker.internal:0.0"
   ```
   

   
   ### Step 3: Run the container
   
   Make sure Docker Desktop is running. 
   
   Then you can load the latest docker image and run it with the following command:
   ```powershell
docker run -it --rm `
  -e DISPLAY=$env:DISPLAY `
  -e QT_X11_NO_MITSHM=1 `
  ghcr.io/flowcean/ipin2025-workshop/flowcean-turtle:latest `
  bash -c "
    cd /root/ros2_ws/src/flowcean-ros && \
    git pull origin main && \
    cd ../.. && \
    colcon build --packages-select flowcean_ros && \
    source /root/ros2_ws/install/setup.bash && \
    (
      ros2 run turtlesim turtlesim_node & \
      ros2 run turtlesim turtle_teleop_key & \
      ros2 run plotjuggler plotjuggler -n & \
      ros2 launch flowcean_ros deploy.launch.py
    )
  "
   ```

   At this point, you should see the turtlesim window and PlotJuggler open on your Windows desktop.



   </details>

## Running the Notebook Locally

If you want to run the notebook locally, follow these instructions.

### Installation Instructions

1. Clone this repository

   ```bash
   git clone https://github.com/flowcean/ipin2025-workshop.git
   cd ipin2025-workshop
   ```

2. Create a virtual environment and install the required packages from the `pyproject.toml`. The easiest way is by using uv. If you know another way, feel free to use it.

   <details>
   <summary>Linux</summary>

   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

   </details>

   <details>
   <summary>macOS</summary>

   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

   </details>

   <details>
   <summary>Windows</summary>

   ```powershell
   powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
   ```

   </details>

   Then create the virtual environment and install the dependencies:

   ```bash
   uv sync
   ```

Now you can start the tutorial in the `tasks.ipynb`.

### Run the Notebook

1. (Optional) If you want to use VS Code, install the Python and Jupyter extensions.
2. Make sure to select the correct Python interpreter (the one from the virtual environment you just created).
3. You can check your solutions in the `solutions.ipynb`

Now you should have a model that can predict the position of the turtlesim.

