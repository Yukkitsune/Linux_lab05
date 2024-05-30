cmake_minimum_required(VERSION 3.13)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(tests)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-maybe-uninitialized")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/banking)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/banking)

add_library(print_lib ${CMAKE_CURRENT_SOURCE_DIR}/include/print.cpp)

add_executable(hello_world ${CMAKE_CURRENT_SOURCE_DIR}/hello_world_application/hello_world.cpp)
add_executable(equation ${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)

target_link_libraries(formatter_ex formatter)
target_link_libraries(hello_world formatter_ex print_lib)
target_link_libraries(equation formatter_ex solver print_lib)

if(BUILD_TESTS)
  enable_testing()
  include(FetchContent)
  FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/release-1.10.0.tar.gz
  )
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
  FetchContent_MakeAvailable(googletest)
  file(GLOB TEST_SOURCES tests/*.cpp)
  add_executable(check ${TEST_SOURCES})
  target_link_libraries(check formatter_ex solver gtest_main print_lib banking)
  target_compile_options(gtest PRIVATE -Wno-error=maybe-uninitialized)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-error=maybe-uninitialized")
  include(GoogleTest)
  gtest_discover_tests(check)
endif()
