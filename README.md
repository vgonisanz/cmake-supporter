# CMake Supporter

## TODO

- Improve template projects.
- Publish on public github .

## Description

This repository contain a lot of userful macros to manage your C/C++ project. But
it can be adapted easily to other languages. Just adding *cms.cmake* to *CMAKE_MODULE_PATH*
variable and including *cms* you can use all macros.

A usage sample, and a description for all macros are contain in cms.cmake file.
An example of usage in a real project is available at GUCpp repository, go to
*TODO LINK GUCPP GITHUB*

## Quick start

- C/Cpp macros, add on your CMakeLists.txt

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/cmakesupport")
INCLUDE( cms )

## Folders in this repository

- Modules: Contain all cmake files with macros.
- Templates: Contain template to edit or use a script to autogenerate projects
- Toolchains: Contain some crosscompiling scripts to port your code to other architecture

## How to manage your project

- Check templates to see folder structures for each kind of project.
- Generate always build folder OUT of the source code when possible.
- To generate use CMake, and select source folder and build folder
- If you work with many platforms (x86, arm, android...) separate
each one in a folder inside build folder
- More info in Templates

## Contribution guidelines
-

Please check the [contrubution guidelines](https://github.com/vgonisanz/cmake-supporter/blob/master/CONTRIBUTING.md).

##### Authors

* [vgonisanz](https://github.com/vgonisanz) (Main Author)
* [RDCH106](https://github.com/RDCH106)