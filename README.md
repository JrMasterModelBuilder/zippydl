# zippydl

An unofficial Zippyshare CLI download script

[![Build Status](https://github.com/JrMasterModelBuilder/zippydl/workflows/main/badge.svg?branch=main)](https://github.com/JrMasterModelBuilder/zippydl/actions?query=workflow%3Amain+branch%3Amain)

# Overview

A bash script using node and wget to download from a Zippyshare link, using Node's VM functionality to safely solve the JavaScript challenge in a sandboxed environment.

# Usage

```
Usage: zippydl [options...] <url>
 -h, --help          Show help
 -V, --version       Show version

Env:
 ZIPPYDL_USER_AGENT=<string>        User agent string
 ZIPPYDL_CA_CERTIFICATE=<file>      CA cert bundle
 ZIPPYDL_NO_CHECK_CERTIFICATE=<0|1> Do not validate the server cert
```

# Bugs

If you find a bug or have compatibility issues, please open a ticket under issues section for this repository.

# License

Copyright (c) 2022-2023 JrMasterModelBuilder

Licensed under the Mozilla Public License, v. 2.0.

If this license does not work for you, feel free to contact me.
