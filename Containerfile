FROM registry.fedoraproject.org/fedora-toolbox:39

LABEL usage="This image is meant to be used with the toolbox command" \
      maintainer="Adam Piasecki <c4rt0gr4ph3r@gmail.com>"

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc

RUN sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

RUN dnf -y upgrade
RUN dnf -y check-update

COPY extra-packages /

RUN dnf -y install $(<extra-packages)
RUN dnf -y install code
RUN dnf clean all
