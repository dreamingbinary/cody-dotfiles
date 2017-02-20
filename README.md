# Submodules

The `vim` plugins in `.vim/bundle` are simply submodules pointing to their respective repositories.

To use them:

```bash
$ git submodule update --init --recursive
```

# You Complete Me

The autocompleter requires installation before bootstrapping.

```bash
$ ./.vim/bundle/youcompleteme/install.py --gocode-completer --tern-complete
$ cd .vim/bundle/tern_for_vim/
$ npm install
```

# Bootstrap all the things

Once everything is said and done:

```bash
$ source bootstrap.sh
```

