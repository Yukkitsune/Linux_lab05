cmake_minimum_required(VERSION 3.13)
set(CMAKE_CXX_STANDARD 11)
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

file(GLOB SRC testing/*.cpp)

add_executable(testt ${SRC})
target_link_libraries(test PRIVATE gtest gtest_main gmock account_lib transaction_lib)

add_test(NAME testt COMMAND testt)

if (ENABLE_COVERAGE)
    target_compile_options(testt PRIVATE --coverage)
    target_link_libraries(testt PRIVATE --coverage)
endif()

find_program(GCOVR gcovr)
if (GCOVR)
    add_custom_target(
        coverage
        COMMAND ${GCOVR} -r ${CMAKE_SOURCE_DIR} --exclude-directories='third-party' --branches --xml-pretty > coverage.xml
        DEPENDS testt
    )
endif()
