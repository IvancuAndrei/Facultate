cmake_minimum_required(VERSION 3.28.1)
project(proiectcpp)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} "-static")

add_executable(proiectcpp main.cpp)
