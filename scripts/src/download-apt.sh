download_apt () {
    PAC_NAME=$1
    apt download ${PAC_NAME}
    APT_NAME=$(ls | grep ${PAC_NAME} | grep ".deb$")

    dpkg-deb -xv ${APT_NAME} ${PAC_NAME} && rm ${APT_NAME}

    cd ${PAT_NAME}
}

download_apt $@
