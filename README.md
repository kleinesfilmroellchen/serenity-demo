# Serenity demo setup

This repository contains a collection of scripts and resources for quickly setting up a SerenityOS demo. It depends on an existing Serenity repo.

The scripts are invoked via [`just`](https://just.systems/). Use `just --list` to check available commands.

The scripts are intended for use on Linux. They may work on other Unix-like systems, but most definitely not on Windows without WSL.

## Configuration

Set the following environment variables before calling the scripts:
- `SERENITY_SOURCE_DIR`: Serenity source directory.
- `SERENITY_ARCH`: Architecture and toolchain to use.

## Caveats

- The Half-Life port requires copying the game assets into the SerenityOS installation; this is not done automatically. The port installer prints precise information about this as well. If you don’t have the game assets, the port will simply not work correctly.

## Implementation Details

The demo setup consists of:
- ensuring that a Serenity build exists for the required architecture
- installing ports for the architecture
- copying the patched sync-local.sh

All the setup of files, links etc. happens in the normal sync-local.sh during image build time.

## Known package requirements

(Please extend this list for your distro!)

- Arch Linux: `gperf qt6 perl-rename imagemagick` (as of writing, Python 3.12 is not available through official repositories, use the AUR or Toolchain/BuildPython.sh)
