cmake_minimum_required (VERSION 2.8.11)
project(lin_alg_tools)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
  message("-- Build type: Release")
endif(NOT CMAKE_BUILD_TYPE)
set(CMAKE_CXX_FLAGS "-std=c++11")

find_package(Eigen3 REQUIRED)
find_package(LAPACK REQUIRED)

include_directories(
  include 
  ${GTEST_INCLUDE_DIRS} 
  ${EIGEN3_INCLUDE_DIRS}
)

add_library(lin_alg_tools INTERFACE)
target_link_libraries(lin_alg_tools INTERFACE ${LAPACK_LIBRARIES})

option (BUILD_TESTS "Build Tests" OFF)
if (BUILD_TESTS)
	find_package(GTest REQUIRED)
	add_executable(lin_alg_tools_test src/test.cpp)
	target_link_libraries(lin_alg_tools_test ${GTEST_LIBRARIES} gtest gtest_main pthread lin_alg_tools)
endif()

set(LIB_DEST lib/${PROJECT_NAME})
set(INCLUDE_DEST include)

install(TARGETS ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}-targets
  ARCHIVE DESTINATION ${LIB_DEST}
  LIBRARY DESTINATION ${LIB_DEST}
)
install(DIRECTORY include/${PROJECT_NAME}
    DESTINATION ${INCLUDE_DEST}
    FILES_MATCHING PATTERN "*.h"
)

# install CMake package configuration
install(EXPORT ${PROJECT_NAME}-targets DESTINATION ${LIB_DEST})
install(FILES ${PROJECT_NAME}-config.cmake DESTINATION ${LIB_DEST})
