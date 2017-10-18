# idiomfzf
dark shell idiom selector

# Install
```sh
# ~/.bashrc
export idiom_DO=1 #1 is do idiom automatically, 0 is output idiom to stdout
alias idiomfzf="history -a;/path/to/idiomfzf.sh"
```

# Usage
```
idiomfzf [add idiom]
```

if you want add shell idiom, you type
```
idiomfzf add "idiom"
```

ex)
```
idiomfzf add "echo abc"
```

if value "idiom" is empty or `[:last:]` , idiomfzf catch `~/.bash_history`'s last line




