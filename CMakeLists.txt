cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project(f_test)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

enable_language(Fortran)
get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)

file(GLOB sources ${PROJECT_SOURCE_DIR}/*.cc ${PROJECT_SOURCE_DIR}/*.f95)

#----------------------------------------------------------------------------
# Add the executable, and link it to the Geant4 libraries
#
add_executable(f_test ${sources})

