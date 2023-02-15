# escape=`
# ARG SERVERCORE_VERSION

# FROM mcr.microsoft.com/powershell:lts-7.2-nanoserver-ltsc2022
# FROM mcr.microsoft.com/windows/servercore:${SERVERCORE_VERSION}
# FROM mcr.microsoft.com/windows/servercore:ltsc2019
FROM mcr.microsoft.com/powershell:lts-7.2-windowsserver-ltsc2022
# FROM ghcr.io/marosset/host-process-scratch-image:latest

ARG BINARY
ARG REGISTRY
ARG VERSION
ARG MAINTAINERS
ARG REPO
ARG VENDOR


# ENV PATH="C:\Program Files\PowerShell;C:\utils;C:\Windows\system32;C:\Windows;"
# SHELL ["pwsh", "-Command"]

SHELL ["powershell", "-NoLogo", "-Verbose", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
# SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"] 

# RUN net user /add ContainerUser

ENV BINARY ${BINARY}
ENV VERSION ${VERSION}
ENV MAINTAINERS ${MAINTAINERS}
ENV REPO ${REPO}
ENV REGISTRY ${REGISTRY}
ENV VENDOR ${VENDOR}


# powershell.exe -Command `
    # $ErrorActionPreference = 'Stop'; `
RUN `
    write-host ('Binary: {0}' -f $env:BINARY); `
    Write-Host ('Version: {0}' -f $env:VERSION); ` 
    Write-Host ('Maintainers: {0}' -f $env:MAINTAINERS); `
    Write-Host ('Repo: {0}' -f $env:REPO); `
    Write-Host ('Registry: {0}' -f $env:REGISTRY); `
    Write-Host ('Vendor: {0}' -f $env:VENDOR); `
    Write-Host ('Servercore Version: {0}' -f $env:SERVERCORE_VERSION)


# PATH isn't actually set in the Docker image, so we have to set it from within the container
#RUN $newPath =  ('C:/usr/local/bin/;{0}' -f $env:PATH); \
#    Write-Host ('Updating PATH: {0}' -f $newPath); \
#    Environment]::SetEnvironmentVariable('PATH', $newPath, [EnvironmentVariableTarget]::Machine); \
    # New-Item -ItemType SymbolicLink -Target "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Path "C:\Windows\System32\WindowsPowerShell\v1.0\pwsh.exe" 

# RUN New-Item -Type Directory -Path "C:/usr/local/bin" -Force
WORKDIR "C:/usr/local/bin"

ENV PATH="C:\\usr\\local\\bin;C:\\Windows\\system32;C:\\Windows;"

COPY bin/${BINARY}.exe .

LABEL org.opencontainers.image.authors=${MAINTAINERS}
LABEL org.opencontainers.image.url=${REPO}
LABEL org.opencontainers.image.documentation=${REPO}
LABEL org.opencontainers.image.source=${REPO}
LABEL org.label-schema.vcs-url=${REPO}
LABEL org.opencontainers.image.vendor=${VENDOR}
LABEL org.opencontainers.image.version=${VERSION}

USER ContainerUser

ENTRYPOINT ["PowerShell"]

# ENTRYPOINT ["${BINARY}"]