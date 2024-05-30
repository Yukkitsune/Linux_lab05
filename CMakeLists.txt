cmake_minimum_required(VERSION 3.13)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(bank_lib)


add_subdirectory(third-party/gtest)
enable_testing()


include_directories(${CMAKE_CURRENT_SOURCE_DIR}/banking)
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
include_directories(${gmock_SOURCE_DIR}/include ${gmock_SOURCE_DIR})


add_library(account_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/banking/Account.cpp)
add_library(transaction_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/banking/Transaction.cpp)

target_link_libraries(transaction_lib account_lib)


file(GLOB SRC tests/*.cpp)


add_executable(test1 ${SRC})
target_link_libraries(test1 PRIVATE gtest gtest_main gmock account_lib transaction_lib)
add_test(NAME test1 COMMAND test1)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/third-party/CMake-codecov/cmake" ${CMAKE_MODULE_PATH})
set(ENABLE_COVERAGE ON CACHE BOOL "Enable coverage build." FORCE)
find_package(codecov)
if (ENABLE_COVERAGE)
    add_coverage(test1)
    list(APPEND LCOV_REMOVE_PATTERNS "'${PROJECT_SOURCE_DIR}/tests/test*'")
    coverage_evaluate()
endif

set_target_properties(gtest PROPERTIES COMPILE_FLAGS "-Wno-error=maybe-uninitialized")
