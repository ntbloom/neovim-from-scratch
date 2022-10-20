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
    python3-pip 

WORKDIR /opt
RUN git clone https://github.com/neovim/neovim

WORKDIR /opt/neovim
RUN git checkout stable
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make install

# these are additional deps for debugging, etc. but not required to build neovim
RUN dnf install -y \
    procps \
    which


# install the language server
RUN pip install python-lsp-server[all]


# launch nvim as the admin user
RUN useradd admin
RUN mkdir -p /home/admin/myproject

# install packer as a plugin manager
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    /home/admin/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN chown -R admin:admin /home/admin/
USER admin
WORKDIR /home/admin/myproject

CMD ["/usr/local/bin/nvim", "myfile.py"]

