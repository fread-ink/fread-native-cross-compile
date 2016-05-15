
This is a bunch of script for building cross-compile environments that compile binaries runnable on the original operating systems that ship with various ebook readers. This is useful for compiling e.g. a kexec that allows switching to fread.ink from the original operating system.

Supported devices:

* Kindle 4th gen
* Kindle 5th gen (untested)

# Kindle 4th and 5th gen

## Build toolchain

```
./build_k4.sh
```

## Compile kexec

```
source env_k4.sh
./build_kexec.sh
```

# Attribution

This is all based on [NiLuJe](https://github.com/NiLuJe)'s work. In fact the scripts in this repository rely heavily on NiLuJe's released scripts and tc-ng configurations: See their latest "Cross-compilation ToolChain & patches" in [this thread](http://www.mobileread.com/forums/showthread.php?t=225030) especially the x-compile.sh script within that file.