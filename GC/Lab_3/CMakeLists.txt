cmake_minimum_required(VERSION 3.30)
project(Lab_3)

set(CMAKE_CXX_STANDARD 20)

add_executable(Lab_3 main.cpp glad.c)


target_link_libraries(Lab_3
        freeglut
        glew32
        glfw3
        opengl32
        glu32
)