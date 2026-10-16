Scylla - x64/x86 Imports Reconstruction
=======================================

This repository contains a fork of [NtQuery/Scylla](https://github.com/NtQuery/Scylla)
with tweaks from [x64dbg/Scylla](https://github.com/x64dbg/Scylla) as well as
additional fixes, refactoring and bindings.

This fork of [ergrelet/Scylla](https://github.com/ergrelet/Scylla) exists to ship
ready-to-install Windows x64 builds: every push to `main` builds Scylla and
publishes an Inno Setup installer on the [Releases](https://github.com/tkirkland/Scylla/releases)
page. Upstream patches are merged in periodically.

Scylla's key features:
 - x64 and x86 support
 - Unicode support
 - Plugin support
 - Works on Windows 7 and superior

License
-------

Source code is licensed under GNU GENERAL PUBLIC LICENSE v3.0.

Known Bugs
----------

### Windows 7 x64

Sometimes the API `kernel32.dll` GetProcAddress cannot be resolved, because the
IAT has an entry from `apphelp.dll`.

### ImpREC plugin support

Some ImpREC Plugins don't work with Windows Vista/7 because they don't "return 1"
in the DllMain function.
