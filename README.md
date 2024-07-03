### Requirements ###

- Required: neovim (0.10.0+), ripgrep (rg), fd
- Optional: Nerd Font (in my case "SauceCodePro"/"SourceCodePro")

Clone into the following directory:__
- ~/.config/nvim (Linux)
- C:\Users\user\Appdata\Local\nvim (Windows)

On Windows the undodir option requires the creation via: 

```bash
mkdir ~/.vim/undodir
```

This creates the folder C:\Users\User\.vim\undodir on Windows.__
On Linux the folder can be found in ~/.config/nvim/~/.vim/undodir

Windows versions of neovim may require additional tools (Such as a c compiler like gcc or zig)
