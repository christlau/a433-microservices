#!/bin/sh

# menentukan variabel untuk nama image, versi image, dan nama akun GitHub
image_name="karsajobs-ui"
github_account="christlau"
package_name="$github_account/$image_name:latest"

# membuat image Docker
echo -e "Proses build docker image..\n"
docker build . -t $package_name

# menyesuaikan nama image format GitHub Container Registry
docker tag $package_name ghcr.io/$package_name

# log in ke GitHub Container Registry
echo -e "\nLogin into GitHub Container Registry:"
docker login ghcr.io -u $github_account -p $GHCR_PAT_TOKEN

# push image ke GitHub Container Registry
docker push ghcr.io/$package_name

echo -e "\nSelesai."