## Importing Yubikey GPG Keys to a New Machine

The public key will need to be imported.

To use the GPG Key associated with github, use:

```sh
GH_USERNAME=
curl https://github.com/${GH_USERNAME}.gpg | gpg --import
```

```sh
gpg --list-keys
```

```sh
gpg --card-status
```
