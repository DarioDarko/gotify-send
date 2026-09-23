#!/usr/bin/env bash

# parse information

while [[ -n "$1" && -n "$2" ]]
do
	case "${1#--}" in
		"title") title="$2";;
		"message") message="$2";;
		"priority") priority="$2";;
		"appid") appid="$2";;
	esac

	shift 2
done

# adjust to your apps with corresponding IDs

declare A- apps=(
	[1]="some_app"
	[2]="other_app"
)

# set hooks

case "${apps["$appid"]}" in
"some_app")
	# hook for some_app (id 1)

	echo "title: $title"
	echo "message: $message"
;;
"other_app")
	# hook for other_app (id 2)

	if (( priority > 7 ))
	then
		# hook for high priority

		:
	else
		# hook for normal or low priority

		:
	fi
;;
esac
