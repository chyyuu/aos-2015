#!/bin/sh

in="$1"
out="$2"

grep '^[0-9]' "$in" | sort -n | (
    echo "#include \"kml_syscall_table_maker_32.h\""
    echo "SYSCALL_TABLE_BEGIN"

    while read nr abi name num_args req_ptregs entry compat; do
	if [ -z "$req_ptregs" ]; then
	    echo "SYSCALL_ENTRY($nr, $name, 0, sys_ni_syscall, sys_ni_syscall)"
	else
	    if [ "$req_ptregs" = "0" ]; then
		entry_macro="SYSCALL_ENTRY"
	    else
		entry_macro="SYSCALL_ENTRY_SPECIAL"
	    fi

	    if [ -n "$compat" ]; then
		echo "$entry_macro($nr, $name, $num_args, $entry, $compat)"
	    elif [ -n "$entry" ]; then
		echo "$entry_macro($nr, $name, $num_args, $entry, $entry)"
	    fi

	fi
    done
) > "$out"
