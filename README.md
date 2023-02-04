<!-- Copyright (c) 2022-2023 Ralf Grawunder -->

# PrusaSlicerConfig: manage your [prusa3d](https://github.com/prusa3d) / [PrusaSlicer](https://github.com/prusa3d/PrusaSlicer) settings in a dedicated configuration folder

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

This will back up directories from your **PrusaSlicer** configuration folder matching the ones located in your dedicated
configuration folder and replace them with symlinks to latter ones.

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
