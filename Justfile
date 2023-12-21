set export := true

SERENITY_RAM_SIZE := '8G'

# Set up the demo within the Serenity build.
setup: _build-serenity _install-ports _patch-sync-local _copy-sync-local

# Set up the sync-local file. (Use this when you’re only modifying the sync-local setup, not the whole build and port setup.)
setup-sync-local: _patch-sync-local _copy-sync-local

# Run SerenityOS in a virtual machine.
vm:
	#!/usr/bin/env bash
	set -euxo pipefail
	cd "${SERENITY_SOURCE_DIR}"
	Meta/serenity.sh run "${SERENITY_ARCH}"

# Run Ladybird and open demo tabs.
browser:
	#!/usr/bin/env bash
	set -euxo pipefail
	cd "${SERENITY_SOURCE_DIR}"
	Meta/serenity.sh run lagom ladybird 'https://emoji.serenityos.net/wall-of-awesome?rows=4&cols=9&timer=30' 'https://fonts.serenityos.net/wall-of-awesome?timer=20' https://events.ccc.de/congress/2023/infos/startpage.html

# Ensures that we have a build directory and LibC for the port builds.
_build-serenity:
	#!/usr/bin/env bash
	set -euxo pipefail
	cd "${SERENITY_SOURCE_DIR}"
	Meta/serenity.sh build "${SERENITY_ARCH}"

# Builds and installs all demo ports.
_install-ports:
	#!/usr/bin/env bash
	set -euxo pipefail
	PORTS_LIST=(
		'make'
		'cmake'
		'ninja'
		'gcc'
		# 'halflife' # TODO: Half-Life is currently broken, re-add it when it works again.
		'python3'
		'SuperTuxKart' # Fails with a weird linker error on second package.sh call. 
		'serenity-theming'
	)
	for i in "${PORTS_LIST[@]}"; do
		cd "$SERENITY_SOURCE_DIR/Ports/$i"
		./package.sh
	done

# Patches sync-local with the real path of this folder.
_patch-sync-local:
	#!/usr/bin/env bash
	cd "{{justfile_directory()}}"
	set -euxo pipefail
	sed s/%SCRIPT_SOURCE%/{{replace(justfile_directory(), '/', '\\/')}}/g sync-local.sh > sync-local-patched.sh

# Copies sync-local into the Serenity build directory.
_copy-sync-local:
	#!/usr/bin/env bash
	cd "{{justfile_directory()}}"
	set -euxo pipefail
	cp sync-local-patched.sh "${SERENITY_SOURCE_DIR}/sync-local.sh"

