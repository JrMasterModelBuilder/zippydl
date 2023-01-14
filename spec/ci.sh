#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

__self="${BASH_SOURCE[0]}"
__dir="$(cd "$(dirname "${__self}")" > /dev/null && pwd)"
__file="${__dir}/$(basename "${__self}")"

tmpdir="${__dir}/tmp-ci"
torlog="${tmpdir}/tor.log"

methods=(
'direct'
'tor'
'tor'
'tor'
)
for method in "${methods[@]}"; do
	echo "==================== METHOD: ${method} ====================="

	torpid=''
	if [[ "${method}" == 'tor' ]]; then
		# Install these on the first use.
		brew list tor || brew install tor
		brew list proxychains-ng || brew install proxychains-ng

		rm -rf "${tmpdir}"
		mkdir "${tmpdir}"
		timeout 300 tor | tee "${torlog}" &
		torpid="$!"
		while sleep 1; do
			logged="$(<"${torlog}")"
			if [[ "${logged}" == *' Bootstrapped 100% '* ]]; then
				break
			fi
		done
	fi

	error='1'
	if [[ "${method}" == 'tor' ]]; then
		(proxychains4 bash "${__dir}/test.sh") && true
		error="$?"
	else
		(bash "${__dir}/test.sh") && true
		error="$?"
	fi

	if [[ "${method}" == 'tor' ]]; then
		kill $(jobs -p)
		wait
		rm -rf "${tmpdir}"
	fi

	echo "====================================================="
	echo

	if [[ "${error}" == 0 ]]; then
		exit 0
	fi
done

exit 1
