cmake_minimum_required(VERSION 3.13)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(tests)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-maybe-uninitialized")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)

add_library(print_lib ${CMAKE_CURRENT_SOURCE_DIR}/include/print.cpp)
add_executable(hello_world ${CMAKE_CURRENT_SOURCE_DIR}/hello_world_application/hello_world.cpp)
add_executable(equation ${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)

target_link_libraries(formatter_ex formatter)
target_link_libraries(hello_world formatter_ex print_lib)
target_link_libraries(equation formatter_ex solver print_lib)

set(BUILD_TESTS ON)

if(BUILD_TESTS)
  enable_testing()
  add_subdirectory(third-party/gtest)
  file(GLOB TEST_SOURCES tests/*.cpp)
  add_executable(check ${TEST_SOURCES})
  target_link_libraries(check formatter_ex solver gtest_main print_lib)
  add_test(NAME check COMMAND check)
endif()
