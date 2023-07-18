# PICO toolchain docker image

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/ifilot/docker-pico-toolchain?label=version)
[![Build](https://github.com/ifilot/docker-pico-toolchain/actions/workflows/deploy.yml/badge.svg)](https://github.com/ifilot/docker-pico-toolchain/actions/workflows/deploy.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Purpose

Ubuntu environment containing the PICO toolchain. This image can be used for
either local compilation or for CI/CD purposes.

## Local compilation

Ensure you have a copy of the image

```bash
docker pull ghcr.io/ifilot/pico:v0.1.0
```

To use the image for compilation, it is recommended to launch a bash program
and mount your current working directory on the home directory of the `pico`
user.

```bash
docker run --volume ./docs:/data/docs --workdir /data/docs -it ghcr.io/ifilot/sphinx:v0.4.0 make html
```