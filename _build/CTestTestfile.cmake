# CMake generated Testfile for 
# Source directory: /home/kitsune/Yukkitsune/workspace/projects/lab05
# Build directory: /home/kitsune/Yukkitsune/workspace/projects/lab05/_build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(check "/home/kitsune/Yukkitsune/workspace/projects/lab05/_build/check")
set_tests_properties(check PROPERTIES  _BACKTRACE_TRIPLES "/home/kitsune/Yukkitsune/workspace/projects/lab05/CMakeLists.txt;35;add_test;/home/kitsune/Yukkitsune/workspace/projects/lab05/CMakeLists.txt;0;")
subdirs("formatter_ex_lib")
subdirs("formatter_lib")
subdirs("solver_lib")
subdirs("third-party/gtest")
