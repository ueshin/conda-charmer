# conda-charmer

`conda-charmer` is a package of utilities to manage Python development environment using `conda`.

## Prerequisite

These utilities are using `conda>=4.4`.

https://conda.io/projects/conda/en/latest/user-guide/install/index.html

- No need to set up environment variables here, which will be handled by these utilities.

## Prepare for the PySpark development

The following example command is assuming the project name is `spark`. Please replace it to your project name.

### Download `conda-charmer`

Download ZIP file for the `conda-charmer` package and extend as `spark`.

https://github.com/ueshin/conda-charmer/archive/pyspark.zip

or `git clone`:

```sh
git clone git@github.com:ueshin/conda-charmer.git -b pyspark spark
``` 

### Place the project files

Place your project files into `SOURCE_PATH` to be set later. The default path is `python`.

```sh
cd spark
git clone /path/to/spark.git python
```

### Edit `_env.sh`

Copy `_env.sh-template` to `_env.sh` and edit the file corresponding to your local environment.

- `CONDA_PROFILE`: the conda profile file path.
- `CONDA_ENVS`: the path to store `conda` environments for the project. You can share the envs with other projects by the same path.
- `SOURCE_PATH`: the path to the Spark project to be developed. The default is `python`.
- `CONDA_ENV_PREFIX`: the prefix for each `conda` environment.
- `ADDITIONAL_PACKAGES`: additional packages to be installed by `conda/create_env.sh`.
- `REQUIREMENTS_FILE`: the requirement file path relative to `SOURCE_PATH`.

## Commands

### `conda/list_envs.sh`

List all the conda environments.

```sh
./conda/list_envs.sh
```

### `conda/create_env.sh`

Create a new `conda` environment.

```sh
./conda/create_env.sh [python_version] [env_suffix]
```

- `python_version`: the default is `3.10`. the python version will be used as the suffix of the new `conda` environment.
- `env_suffix`: If `env_suffix` is not specified, `python_version` will be used.

### `conda/clone_env.sh`

Clone an existing `conda` environment.

```sh
./conda/clone_env.sh from_suffix to_suffix
```

### `conda/remove_env.sh`

Remove the `conda` environment.

```sh
./conda/remove_env.sh [env_suffix]
```

- `env_suffix`: If `env_suffix` is not specified, `3.10` will be used.

### `conda/update_conda.sh`

Update the `conda` command.

```sh
./conda/update_conda.sh
```

### `build.sh`

Build the Spark. This is needed prior to run PySpark.

```sh
./build.sh [-c] [-w worktree_path]
```

- If `-c` is specified, the clean build will be used; otherwise the incremental build will be used.
- `worktree_path`: If `-w worktree_path` is not specified, the `SOURCE_PATH` will be used.

### `activate.sh`

Activate and run child shell the `conda` environment and `cd` to the worktree path.

```sh
./activate.sh [-w worktree_path] [env_suffix]
```

- `worktree_path`: If `-w worktree_path` is not specified, the `SOURCE_PATH` will be used.
- `env_suffix`: If `env_suffix` is not specified, `3.10` will be used.

To disable the environment, just `exit` from the shell.

### `jupyter.sh`

Run `jupyter` with activating the `conda` environment.

```sh
./jupyter.sh [-w worktree_path] [env_suffix]
```

- `worktree_path`: If `-w worktree_path` is not specified, the `SOURCE_PATH` will be used.
- `env_suffix`: If `env_suffix` is not specified, `3.10` will be used.

### `pyspark.sh`

Run `pyspark.sh` with activating the `conda` environment.

```sh
./pyspark.sh [-w worktree_path] [env_suffix]
```

- `worktree_path`: If `-w worktree_path` is not specified, the `SOURCE_PATH` will be used.
- `env_suffix`: If `env_suffix` is not specified, `3.10` will be used.

### `jupyter-pyspark.sh`

Run `jupyter` via `pyspark` command with activating the `conda` environment.

```sh
./jupyter-pyspark.sh [-w worktree_path] [env_suffix]
```

- `worktree_path`: If `-w worktree_path` is not specified, the `SOURCE_PATH` will be used.
- `env_suffix`: If `env_suffix` is not specified, `3.10` will be used.

### `run-tests.sh`

Run PySpark tests (for sql module) with activating the `conda` environment.

```sh
./run-tests.sh [-w worktree_path] [env_suffix]
```

- `worktree_path`: If `-w worktree_path` is not specified, the `SOURCE_PATH` will be used.
- `env_suffix`: If `env_suffix` is not specified, `3.10` will be used.

## Work with `git worktree`

If you want to use `git worktree`, I'd recommend to use `main` for the source path and place the worktrees in `worktrees`.

```sh
cd spark
vi _env.sh

export SOURCE_PATH='main'

git clone /path/to/spark.git master
```

```sh
(cd main && git worktree add ../worktrees/wt -b wt main)
./activate.sh -w worktrees/wt
```
