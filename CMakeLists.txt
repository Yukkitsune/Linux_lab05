cmake_minimum_required(VERSION 3.13)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(bank_lib)

add_subdirectory(third-party/gtest)
enable_testing()

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/banking)

add_library(account_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/banking/Account.cpp)
add_library(transaction_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/banking/Transaction.cpp)

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
include_directories(${gmock_SOURCE_DIR}/include ${gmock_SOURCE_DIR}) 

target_link_libraries(transaction_lib account_lib)

file(GLOB SRC tests/*.cpp)

add_executable(test1 ${SRC})
target_link_libraries(test1 PRIVATE gtest gtest_main gmock account_lib transaction_lib)

add_test(NAME test1 COMMAND test1)

set_target_properties(gtest PROPERTIES COMPILE_FLAGS "-Wno-error=maybe-uninitialized")

if (ENABLE_COVERAGE)
    target_compile_options(test1 PRIVATE --coverage)
    target_link_libraries(test1 PRIVATE --coverage)
endif()

find_program(GCOVR gcovr)
if (GCOVR)
    add_custom_target(
        coverage
        COMMAND ${GCOVR} -r ${CMAKE_SOURCE_DIR} --exclude-directories='third-party' --branches --xml-pretty > coverage.xml
        DEPENDS test1
    )
endif()
