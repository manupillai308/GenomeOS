docker run --rm \
  -v "$PWD/src:/work" \
  -w /work \
  ubuntu-gnu-toolchain-aarch64 \
  bash build.sh