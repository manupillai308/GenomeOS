FROM ubuntu:24.04

ENV TOOLCHAIN_DIR=/opt/toolchain
WORKDIR /work

# https://armkeil.blob.core.windows.net/developer/files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
# ADD auto-extracts local tar archives
ADD arm-gnu-toolchain-15.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz ${TOOLCHAIN_DIR}/

ENV PATH="${TOOLCHAIN_DIR}/arm-gnu-toolchain-15.2.rel1-aarch64-aarch64-none-linux-gnu/bin:${PATH}"
RUN apt-get update && apt-get install -y mtools fdisk

CMD ["bash"]
