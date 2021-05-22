SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
rm -rf $SHELL_FOLDER/build
mkdir $SHELL_FOLDER/build
podman run -it --rm -v $SHELL_FOLDER/build:/opt/output ubuntu /bin/bash -c \
"export DEBIAN_FRONTEND=noninteractive \
&& cd /opt \
&& apt update \
&& apt install git wget nano python3 python-is-python3 python3-pip build-essential cmake libusb-1.0-0 -y \
&& git clone -b v4.2 https://github.com/espressif/esp-idf.git --recursive \
&& bash esp-idf/install.sh \
&& git clone https://github.com/Icy-Rime/Play32-micropython.git \
&& cd Play32-micropython \
&& make -C mpy-cross \
&& cp /opt/Play32-micropython/mpy-cross/mpy-cross /opt/output/mpy-cross \
&& cd ports/esp32/ \
&& source /opt/esp-idf/export.sh \
&& make submodules \
&& make \
&& cp /opt/Play32-micropython/ports/esp32/build-GENERIC_SPIRAM/firmware.bin /opt/output/firmware.bin"
