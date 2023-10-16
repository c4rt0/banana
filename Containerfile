FROM registry.fedoraproject.org/fedora-toolbox:39

LABEL usage="This image is meant to be used with the toolbox command" \
      maintainer="Adam Piasecki <c4rt0gr4ph3r@gmail.com>"

RUN dnf -y upgrade
RUN dnf -y swap coreutils-single coreutils-full
RUN dnf -y swap glibc-minimal-langpack glibc-all-langpacks

COPY extra-packages /

RUN dnf -y install $(<extra-packages)

RUN dnf clean all
