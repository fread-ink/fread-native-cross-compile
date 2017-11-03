
This is a bunch of script for building cross-compile environments that compile binaries runnable on the original operating systems that ship with various ebook readers. This is useful for compiling e.g. a kexec that allows switching to fread.ink from the original operating system.

Supported devices:

* Kindle 4th gen
* Kindle 5th gen (untested)

# Kindle 4th and 5th gen

## Build toolchain

```
./build_k4.sh
```

If at some point in the future the above command fails because some of the requires files are no longer available at their previous URLs then you can find a backup inf the repo [fread-ct-ng-backup](https://github.com/fread-ink/fread-ct-ng-backup) which you can use like so:

```
cd ~/crosstool-ng-workdir/
mkdir -p .build
git clone https://github.com/fread-ink/fread-ct-ng-backup .build
ct-ng build
```

and the build should complete correctly.

## Compile kexec

```
source env_k4.sh
./build_kexec.sh
```

If this fails because the kexec-tools tarball is no longer available at the original URL, you can manually download it from the repo [fread-kexec-backup](https://github.com/fread-ink/fread-kexec-backup) and place it in this directory, then re-run `./build_kexec.sh`.


# Attribution

This is all based on [NiLuJe](https://github.com/NiLuJe)'s work. In fact the scripts in this repository rely heavily on NiLuJe's released scripts and tc-ng configurations: See their latest "Cross-compilation ToolChain & patches" in [this thread](http://www.mobileread.com/forums/showthread.php?t=225030) especially the x-compile.sh script within that file.