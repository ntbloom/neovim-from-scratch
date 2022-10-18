# neovim-from-scratch

Build a neovim setup from scratch to learn the interface to LSP without
abstraction.

Uses a Dockerfile to isolate from the host vim/nvim setup and have reproducible
build.

Built on a Fedora base to mimick a normal terminal experience on a traditional
desktop workstation.

For now, this is targeted specifically at Python.

### Requirements

- docker
- make

### To use

Build and run the container, get launched into a dockerized nvim session inside
an empty python source code file:

```sh
$ make all
```
