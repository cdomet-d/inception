#!/bin/sh
#check-volumes.sh

is_empty() {
	[ -d "$1" ] && [ -z "$(ls -A "$1")" ]
}

if ! is_empty "/home/${USER}/data/mdb-data" || ! is_empty "/home/${USER}/data/wp-data"; then
	cat <<-EOF

		[WARNING] Volumes are already populated. The database backup will not be considered.
		[WARNING] Run fclean (or re / reback) if you want to change the state of the website !

	EOF
fi
