# registry.k8s.io/kube-apiserver:v1.26.1
# registry.k8s.io/kube-controller-manager:v1.26.1
# registry.k8s.io/kube-scheduler:v1.26.1
# registry.k8s.io/kube-proxy:v1.26.1
# registry.k8s.io/pause:3.9
# registry.k8s.io/etcd:3.5.6-0
# registry.k8s.io/coredns/coredns:v1.9.3





docker build `
--build-arg SERVERCORE_VERSION=$env:SERVERCORE_VERSION `
--build-arg VERSION=$Version `
--build-arg MAINTAINERS=$env:MAINTAINERS `
--build-arg ORG=$DockerOrg `
--build-arg IMAGE=$IMAGE `
--build-arg REGISTRY=$Registry `
-t $IMAGE `
-f ('{0}Dockerfile' -f $etcd) .



$Registry = "docker.io"
$Org = "embryonik"
$IMAGE = "kube-apiserver"
$TAG = "v1.26.1"
$SERVERCORE_VERSION="ltsc2019"
$Version = "alpha"
$IMAGE = ('{0}/{1}:{2}-windows-{3}' -f $Org, $IMAGE, $TAG, $SERVERCORE_VERSION)

$env:DOCKER_CLI_EXPERIMENTAL = "enabled"
& docker buildx create --name img-builder --use --driver docker-container --driver-opt image=moby/buildkit:v0.11.3
docker buildx use img-builder
$name = ('{0}/{1}' -f $Registry, $IMAGE)
$command = "docker buildx build --platform windows/amd64 --output=type=docker -t $name -f Dockerfile ."

$buildArgs=@()
$buildArgs+="SERVERCORE_VERSION=$SERVERCORE_VERSION"
$buildArgs+="VERSION=$Version"
$buildArgs+="MAINTAINERS=$env:MAINTAINERS"
$buildArgs+="ORG=$Org"
$buildArgs+="IMAGE=$IMAGE"
$buildArgs+="REGISTRY=$Registry"

foreach($arg in $buildArgs)
{
    $command = "$command --build-arg=$arg"
}

Write-Host $command
# Invoke-Expression $command

docker buildx build --platform windows/amd64 --output=type=local,dest=out.tar --build-arg=SERVERCORE_VERSION="ltsc2019" --build-arg=VERSION="v0.0.1-alpha" --build-arg=MAINTAINERS="rosskirkpat@outlook.com" --build-arg=ORG="embryonik"  --build-arg=BINARY="kube-apiserver" --build-arg=IMAGE="embryonik/kube-apiserver:v1.26.1-windows-ltsc2019" --build-arg=REGISTRY="docker.io" -t "docker.io/embryonik/kube-apiserver:v1.26.1-windows-ltsc2019" -f Dockerfile .


# --build-arg=BUILDKIT_MULTI_PLATFORM=1  
# ERROR: failed to solve: docker exporter does not currently support exporting manifest lists

docker buildx build --platform windows/amd64 --output=type=registry --push --build-arg=BUILDKIT_MULTI_PLATFORM=1 --build-arg=SERVERCORE_VERSION="ltsc2019" --build-arg=VERSION="v0.0.1-alpha" --build-arg=MAINTAINERS="rosskirkpat@outlook.com" --build-arg=ORG="embryonik" --build-arg=IMAGE="docker.io/embryonik/kube-apiserver:v1.26.1-windows-ltsc2019" --build-arg=REGISTRY="docker.io" --tag "docker.io/embryonik/kube-apiserver:v1.26.1-windows-ltsc2019" -f Dockerfile .


docker buildx build --platform windows/amd64 --output=type=registry --push --build-arg=SERVERCORE_VERSION="ltsc2019" --build-arg=VERSION="v0.0.1-alpha" --build-arg=MAINTAINERS="rosskirkpat@outlook.com" --build-arg=ORG="embryonik"  --build-arg=BINARY="kube-apiserver" --build-arg=IMAGE="embryonik/kubeadm:v1.26.1-windows-ltsc2019" --build-arg=REGISTRY="docker.io" -t "docker.io/embryonik/kubeadm:v1.26.1-windows-ltsc2019" -f Dockerfile .




registry.k8s.io/kube-apiserver:v1.26.1
registry.k8s.io/kube-controller-manager:v1.26.1
registry.k8s.io/kube-scheduler:v1.26.1
registry.k8s.io/kube-proxy:v1.26.1
registry.k8s.io/pause:3.9
registry.k8s.io/etcd:3.5.6-0
registry.k8s.io/coredns/coredns:v1.9.3



$env:REGISTRY = "docker.io"
$env:ORG = "embryonik"
$env:NAME = "kube-apiserver"
$env:TAG = "v1.26.1"
$env:SERVERCORE_VERSION="ltsc2019"
$env:VERSION = "v0.0.1-alpha"
$env:MAINTAINERS = "rosskirkpat@outlook.com"
$env:IMAGE = ('{0}/{1}:{2}-windows-{3}' -f $env:ORG, $env:NAME, $env:TAG, $env:SERVERCORE_VERSION)
$env:VENDOR = "Embryonik Applications"

# kube-apiserver
docker buildx build --platform windows/amd64 --output=type=registry --push --build-arg=SERVERCORE_VERSION=$env:SERVERCORE_VERSION --build-arg=VERSION=$env:VERSION --build-arg=MAINTAINERS=$env:MAINTAINERS --build-arg=ORG=$env:ORG  --build-arg=BINARY=$env:NAME --build-arg=IMAGE=$env:IMAGE --build-arg=REGISTRY=$env:REGISTRY --build-arg=VENDOR=$env:VENDOR -t $env:IMAGE -f Dockerfile .

# kube-controller-manager
docker buildx build --platform windows/amd64 --output=type=registry --push --build-arg=SERVERCORE_VERSION="ltsc2019" --build-arg=VERSION="v0.0.1-alpha" --build-arg=MAINTAINERS="rosskirkpat@outlook.com" --build-arg=ORG="embryonik"  --build-arg=BINARY="kube-controller-manager" --build-arg=IMAGE="embryonik/kube-controller-manager:v1.26.1" --build-arg=REGISTRY="docker.io" -t "docker.io/embryonik/kube-controller-manager:v1.26.1" -f Dockerfile .

# kube-scheduler
docker buildx build --platform windows/amd64 --output=type=registry --push --build-arg=SERVERCORE_VERSION="ltsc2019" --build-arg=VERSION="v0.0.1-alpha" --build-arg=MAINTAINERS="rosskirkpat@outlook.com" --build-arg=ORG="embryonik"  --build-arg=BINARY="kube-scheduler" --build-arg=IMAGE="embryonik/kube-scheduler:v1.26.1" --build-arg=REGISTRY="docker.io" -t "docker.io/embryonik/kube-scheduler:v1.26.1" -f Dockerfile .

# kube-proxy
docker buildx build --platform windows/amd64 --output=type=registry --push --build-arg=SERVERCORE_VERSION="ltsc2019" --build-arg=VERSION="v0.0.1-alpha" --build-arg=MAINTAINERS="rosskirkpat@outlook.com" --build-arg=ORG="embryonik"  --build-arg=BINARY="kube-proxy" --build-arg=IMAGE="embryonik/kube-proxy:v1.26.1" --build-arg=REGISTRY="docker.io" -t "docker.io/embryonik/kube-proxy:v1.26.1" -f Dockerfile .


# re-tag and push

crane cp --platform windows/amd64 registry.k8s.io/pause:3.9 docker.io/embryonik/pause:3.9
crane cp --platform windows/amd64 registry.k8s.io/etcd:3.5.6-0 docker.io/embryonik/etcd:3.5.6-0
crane cp --platform windows/amd64 registry.k8s.io/coredns/coredns:v1.9.3 docker.io/embryonik/coredns:v1.9.3
