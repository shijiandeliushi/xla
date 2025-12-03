# Manually install XLA dependencies

## Download the dependency tarball

[Download link - partitioned tarball on Huawei OBS](https://e-share.obs-website.cn-north-1.myhuaweicloud.com/?v2token=0emfX/TVrwHd66XQ0diYpDU9FmG+b9rFTeL4x76RsAx03YxDcaD5rNhM7E/33fowHkURuN6nBLKBbXcGJ+Yksrrm6gUJxS3X8cxl/T2675FfDZ3K5SVhAsr6h9qs+4BmE/SlUFgwiW/efHuDjresmFo7qGXcWv4SM1j9+0cIgIjoY926g1AGCaLQHiIYmcvzAy4qIco12hOvbWgDSSVHr7lKp2G6x2oZirmECnfQuOb4lECtWZL0gZvkbawxHIb/fE8MjP5l0sR7aZorjVQorkHZN+rhxN2CDl4rcD4COvd0tSMRQFKGM7D/3g+PpYjOQwfRDOwDq5VHt4zBtUU3gHLlwpJfhw8itrPIOdm6WVt74n9zbfPOLNW45NXMF9CEeOeUdir2fPc7AfKK79Csg8PlD9f0T3vQQsMBTSCuxhATl5gmhSfI670vIqTnkKtj55ZxkqRxB5ZwH0Fqgri4bG8J+HXXcR6+8GJt0B3uAUscrOzuXNWt1/NIugWlOll3+PWckdAB2hzOV+5x82/wtQ==_y1+S9zrg6J6B0NYQXdohADlAdfhxAi0GckHOH2BnqUA=_MPvNC0bV12zXicGvprql3w==)

Visit the link above and enter extraction code `xlaxla123` to download the dependency tarball (partitioned) to your local machine.

Note that this link expires on 11/17/2025 at 23:24:28.

## Extract tarball

Use the following command to extract the split tarball.

```shell
cat xla_dependencies* | tar -zxf -
```

Now you should get a directory named `6272102f30b51f9486d7d469ae4e0fd7`.

## Copy dependencies to the cache directory

If you have run `bazel build` or `bazel fetch`, you should have a cache directory created by it.

In the bazel output, you will likely find a path similar to this:

```text
/home/.cache/bazel/_bazel_user/deadbeef1234567890/
                               ^
                               |
                               A hash string that varies on each machine.
```

this is your own cache directory of XLA build. 

Suppose your cache directory is `/home/.cache/bazel/_bazel_user/deadbeef1234567890/`, simply copy `6272102f30b51f9486d7d469ae4e0fd7/external` to overwrite `/home/.cache/bazel/_bazel_user/deadbeef1234567890/external` using the following command: 

```shell
cp -r 6272102f30b51f9486d7d469ae4e0fd7/external /home/.cache/bazel/_bazel_user/deadbeef1234567890/external
```

After that, you can build your XLA without worry about downloading dependencies from abroad.