# IPIN 2025 Workshop - Data-driven Indoor Positioning using flowcean

## Installation Instructions

1. Clone this repository

   ```bash
   git clone https://github.com/flowcean/ipin2025-workshop.git
   cd ipin2025-workshop
   ```

2. Create a virtual environment and install the required packages from the pyproject.toml. The easiest way is by using uv. If you know another way, feel free to use it.

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

Now you can start the tutorial in the workshop_notebook.ipynb

## Running the Notebook

1. (Optional) If you want to use VSCode, install the Python and Jupyter extensions.
2. Make sure to select the correct Python interpreter (the one from the virtual environment you just created).
3. You can check your solutions in the solution_notebook.ipynb

Now you should have a model that can predict the position of the turtlesim.

## Deploying the Model in ROS2

We provide a container file for this that includes all dependencies.

TODO: Add instructions for building and running the container.
