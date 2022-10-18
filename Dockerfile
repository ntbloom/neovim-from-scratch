# dockerfile with neovim environment

FROM fedora:latest

RUN dnf upgrade -y
RUN dnf install -y \
    autoconf \
    automake \
    cmake \
    curl \
    gcc \
    gcc-c++ \
    gettext \
    git \
    libtool \
    make \
    ninja-build \
    pkgconfig \
    unzip \
    patch \
    python3-pip \
    which

WORKDIR /opt
RUN git clone https://github.com/neovim/neovim

WORKDIR /opt/neovim
RUN git checkout stable
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make install

RUN pip install python-lsp-server[all]

WORKDIR /opt/mydirectory

CMD ["/usr/local/bin/nvim", "myfile.py"]

