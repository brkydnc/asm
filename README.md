# What is this?
This repository is a boilerplate for `x86_64` playgrounds on Apple Silicon
devices. If you need to practice `x86_64` (for some reason), and you are using
an Apple Silicon device, then you can use this repository for a quick start

# How do I debug the output?
You can simply load the final binary into LLDB and start debugging.
```sh
(lldb) file output
(lldb) process launch -s
```
