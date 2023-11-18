#! /bin/sh

# Membuat fungsi build image
build_image(){
        echo "=============== Build image ================"
        docker build -t ghcr.io/bisakita/karsajobs-ui:latest .
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
        docker push ghcr.io/bisakita/karsajobs-ui:latest
        echo "================== done ===================="
        echo "\n\n"
        sleep 1
}

# Menjalankan fungsi berurutan
build_image
login_github
push_to_github
