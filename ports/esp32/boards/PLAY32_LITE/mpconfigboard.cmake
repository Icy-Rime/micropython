set(IDF_TARGET esp32c3)

set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/sdkconfig.ble
    boards/PLAY32_LITE/sdkconfig.board
)

if(NOT MICROPY_FROZEN_MANIFEST)
    set(MICROPY_FROZEN_MANIFEST ${MICROPY_PORT_DIR}/boards/manifest_play32.py)
endif()