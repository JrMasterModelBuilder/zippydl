#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

__self="${BASH_SOURCE[0]}"
__dir="$(cd "$(dirname "${__self}")" > /dev/null && pwd)"
__file="${__dir}/$(basename "${__self}")"

dlurl='https://www83.zippyshare.com/v/yakMuCxe/file.html'
zippydl="$(dirname "${__dir}")/zippydl"
tmpdir="${__dir}/tmp"

rm -rf "${tmpdir}"
mkdir "${tmpdir}"
pushd "${tmpdir}" > /dev/null

echo "======== DOWNLOAD ========"
bash "${zippydl}" "${dlurl}"

echo "========= VERIFY ========="
shasum -c "${__dir}/jmmb avatar.png.sha256"

popd > /dev/null
rm -rf "${tmpdir}"
