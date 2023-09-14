#!/bin/bash

function package_bundle {
	rm -fr "${_BUILD_DIR}/release"

	local package_dir="${_BUILD_DIR}/release/liferay-dxp"

	mkdir -p "${package_dir}"

	cp -a "${_BUNDLES_DIR}"/* "${package_dir}"

	echo "${_GIT_SHA}" > "${package_dir}"/.githash
	echo "${_DXP_VERSION}" > "${package_dir}"/.liferay-version

	touch "${package_dir}"/.liferay-home

	7z a "${_BUILD_DIR}/release/liferay-dxp-tomcat-${_DXP_VERSION}-${_BUILD_TIMESTAMP}.7z" "${package_dir}"

	#
	# TODO Add checksums and TGZ.
	#
}