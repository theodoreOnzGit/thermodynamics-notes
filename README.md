# thermodynamics-notes
A repository of notes for engineering thermodynamics in typst (mainly)

# Compiling 

In this repository, I mainly use typst to compile the pdf files. 
Moreover, I use the cetz package in order to draw some plots as well.

If you want to install the latest (nightly) version of typst and cetz:
```bash 
cargo install --git https://github.com/typst/typst
cargo install just 
git clone https://github.com/johannes-wolf/cetz
cd cetz 
just install
```

Otherwise depending on your OS, you can install typst as per normal.

Windows:
```bash 
winget install --id Typst.Typst
cargo install just 
git clone https://github.com/johannes-wolf/cetz
cd cetz 
just install
```

Arch Linux:


```bash 
sudo pacman -S typst 
cargo install just 
git clone https://github.com/johannes-wolf/cetz
cd cetz 
just install
```

To compile, either use the typst LSP in vscode or neovim, or else,
from the main folder (where this README.md file is), you can run typst 
watch:

```bash 
typst watch yourfile.typ --root .
```

For the brayton cycle file for example:

```bash 
typst watch power_cycles/brayton.typ --root .
```

For single step compilation:

```bash 
typst compile power_cycles/brayton.typ --root .
```
