FROM registry.fedoraproject.org/fedora-toolbox:39

MAINTAINER Adam Piasecki <c4rt0gr4ph3r@gmail.com>

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc

RUN sleep 2s

RUN sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'


RUN dnf check-update

COPY . /banana

RUN cd /banana && dnf -y install $(<extra-packages) && cd .. && rm -rf /banana

RUN export PATH=$PATH:/usr/local/go/bin

CMD ["/bin/bash"]
