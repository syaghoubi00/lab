> [!WARNING]
> This is a work in progress and may be out of date.

<https://github.com/osbuild/bootc-image-builder?tab=readme-ov-file#-image-types>

## Creating an ISO

```sh
sudo podman build -t bootc-ctr:latest .
```

```sh
sudo podman run --rm -it --privileged \
  --pull=newer \
  --security-opt label=type:unconfined_t \
  -v ./output:/output \
  -v /var/lib/containers/storage:/var/lib/containers/storage \
  quay.io/centos-bootc/bootc-image-builder:latest \
  --type anaconda-iso --local \
  localhost/bootc-ctr:latest
```
