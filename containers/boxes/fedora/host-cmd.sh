#!/bin/sh

flatpak-spawn --host "$(basename "${0}")" "$@"
