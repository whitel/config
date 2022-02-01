#! /usr/bin/bash


SOURCE=$(basename "$PWD")
TARGET=$(echo "${SOURCE}".bak.d)

cd ..

if [[ -d "./${TARGET}" ]]; then
    echo "[x] Warning! backup folder exist, exiting..."
fi

echo "[v] Creating backup folder..."
cp -r --preserve=all "${SOURCE}" "${TARGET}"

