### Requirements ###

- Required: neovim (0.10.0+), ripgrep (rg), fd
- Optional: Nerd Font (in my case "SauceCodePro"/"SourceCodePro")

Clone into the following directory:
- ~/.config/nvim (Linux)
- C:\Users\User\Appdata\Local\nvim (Windows)

The undo directory option is enabled, so undos are persistent.  
On Linux the folder is located at: /home/user/.vim/undodir/

On Windows the undodir will cause problems. I recommend the creation of a folder with: 

```bash
mkdir ~/.vim/undodir
```

This creates the folder C:\Users\User\.vim\undodir on Windows.  
set.lua requires the change of the undodir variable to reflect this change (set to ~/.vim/undodir)

Windows versions of neovim may require additional tools (Such as a c compiler like gcc or zig)
