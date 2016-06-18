# Project CXX template

This path contain a template to create in projects in C or CPP.

## Create your own repository with custom folders

Each folder must have proper files. In example:

- *modules*:  All repository libraries (Source code).
- *samples*:  All binaries to show how use modules (Source code)
- *test*:     All unit test to check proper behavoir (Source code)
- *3rdParty*: All external code or submodules needed by your repository.
- *cmake*:    All cmake scripts (Modules, etc)    

Main folder must content essential files.

- *CMakeLists.txt*  Main project configuration, used in all other sub projects.
- *LICENSE*         Project LICENSE
- *README.md*       Instruccions
- *.gitignore*      Exclude instruction for git
- *.gitsubmodule*   Info submodules
- *.git*            git data
- *other*           Add needed files that cannot be anywhere

## Instructions to use template

1. Copy CMakeLists_MAINPROJECT.txt into main path with CMakeLists.txt name
2. Create folders
3. For each library (module), copy CMakeLists_SUBPROJECT_LIB.txt into its
path with CMakeLists.txt name and edit variable PROJ_NAME.
4. For each library (module), copy CMakeLists_SUBPROJECT_EXE.txt into its
path with CMakeLists.txt name and edit variable PROJ_NAME.
5. With CMake choose  main path as source path, and choose a path to create build
Makefiles automatically.
6. Done!
