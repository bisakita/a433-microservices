#! /bin/sh

# Membuat fungsi build image
build_image(){
        echo "=============== Build image ================"
        docker build -t item-app:v1 .
        echo "\n\n"
        sleep 1
}

# Membuat fungsi list image
list_image(){
        echo "=============== Image List ================="
        docker images
        echo "\n\n"
        sleep 1
}

# Membuat fungsi rename image
rename_image(){
        echo "=============== Rename image ==============="
        docker image tag item-app:v1 ghcr.io/bisakita/item-app:v1
        echo "================== done ===================="
        echo "\n\n"
        sleep 1
}

# Membuat fungsi login github container registry
login_github(){
        echo "=============== Login Github ==============="
        echo $PASS_GITHUB | docker login ghcr.io -u bisakita --password-stdin
        echo "\n\n"
        sleep 1
}

# Membuat fungsi login github container registry
push_to_github(){
        echo "============== Push to Github =============="
        docker push ghcr.io/bisakita/item-app:v1
        echo "================== done ===================="
        echo "\n\n"
        sleep 1
}

# Menjalankan fungsi berurutan
build_image
list_image
rename_image
login_github
push_to_github

# while true
# do
#         log_disk_usage
#         vacum_disk_usage
# done
