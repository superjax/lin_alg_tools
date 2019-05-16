get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
include(${SELF_DIR}/lin_alg_tools-targets.cmake)
get_filename_component(lin_alg_tools_INCLUDE_DIRS "${SELF_DIR}/../../include/lin_alg_tools" ABSOLUTE)
