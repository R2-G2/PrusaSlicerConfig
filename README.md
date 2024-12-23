<!-- Copyright (c) 2022-2024 Ralf Grawunder -->

# [PrusaSlicer](https://github.com/prusa3d/PrusaSlicer)Config: manage your 3D printing settings in a dedicated configuration folder

## Preamble

**PrusaSlicerConfig** enables you to  maintain your **PrusaSlicer** settings easily with **Git**,
[like I do](https://github.com/R2-G2/PrusaSlicer.config).

## Setup

Create your own configuration and edit it to your likings.

```shell
cp config.dist.sh config.sh
editor config.sh
```

## Usage

### Universal

Simply run **PrusaSlicerConfig**.

This will back up relevant **PrusaSlicer** configuration folders (as in snapshots) to your dedicated configuration
directory and replace them with symlinks. Some configurations will get their settings id rewritten based on the
filename.

```shell
./PrusaSlicerConfig.sh
```

Optionally symlink **PrusaSlicerConfig** to a directory specified in your *PATH*.

```shell
sudo ln -s "$(readlink -m ./PrusaSlicerConfig.sh)" /usr/local/bin/PrusaSlicerConfig
```

Now you can run **PrusaSlicerConfig** even easier.

```shell
PrusaSlicerConfig
```

### Personal

I prefer a hidden directory inside my *HOME* which is added to the *PATH* via the
(/etc/)[bash.bashrc](https://gist.github.com/R2-G2/b71248030139bc9648b4b712e25621d5#file-bash-bashrc-ubuntu-sh-L83)
file.

```shell
ln -s "$(readlink -m ./PrusaSlicerConfig.sh)" ~/.bin/PrusaSlicerConfig
PrusaSlicerConfig
```

## Problems?

Fork! Fork it! Fork you! Fork me, right?
