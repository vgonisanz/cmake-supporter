# CMake Supporter

## Description

This repository contain a lot of userful macros to manage your C/C++ project. But
it can be adapted easily to other languages. Just adding *cms.cmake* to *CMAKE_MODULE_PATH*
variable and including *cms* you can use all macros.

A usage sample, and a description for all macros are contain in cms.cmake file.
An example of usage in a real project is available at GUCpp repository, go to
*TODO LINK GUCPP GITHUB*

## Quick start

- If Var CMAKE_SOURCE_DIR is the root path of the repository, copy or add as submodule this repository at path
```${CMAKE_SOURCE_DIR}/cmake/Modules/```

- To use C/Cpp macros, add on your CMakeLists.txt at the beggining as follow:

```cmake
LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/cmakesupport")
INCLUDE( cms )
```

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

## Authors

* [vgonisanz](https://github.com/vgonisanz) (Main Author)
* [RDCH106](https://github.com/RDCH106)

## Contribution guidelines

Please check the [contrubution guidelines](https://github.com/vgonisanz/cmake-supporter/blob/master/CONTRIBUTING.md).

## Git tips:

> Note:   
> - Edit variables $(var_name) assiming origin is the remote.
> - Terminal code prefix is $, remove if paste the command

- Clone with all submodules:              
```$ git clone --recursive $(url_repository)```
- Create new branch:                     
```$ git branch $(branch_name)```
- Change to branch:                       
```$ git checkout $(branch_name)```
- Remove a branch:                        
```$ git branch -d $(branch_name)```
- Remove branch from origin:              
```$ git push :$(branch_name)```
- Checkout a new branch from origin:      
```$ git checkout -b $(branch_name) origin/$(branch_name)```
- Add new file to repository:             
```$ git add $(file_or_macro)```
- Remove file from repository:            
```$ git rm $(file_or_macro)```
- Save edit changes in your PC:           
```$ git commit -a -m "$(description)"```
- Update your repository from origin:     
```$ git pull origin $(your_branch):$(their_branch)```
- Share your changes                      
```$ git push origin $(your_branch):$(their_branch)```
- Create a new tag in current branch:     
```$ git tag -a $(tag_name)```
- Add a submodule:                        
```$ git submodule add $(url_repository) $(relative_path)```

* How to merge:
  - ```$ git checkout master```
  - ```$ git merge --no-ff hotfix-1.2.1```
  - ```$ git tag -a 1.2.1```
  - ```$ git push origin master```


* [Git Methodology: A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)

## Tools tips:

- CMake-gui for compile scripts
- Eclipse as IDE
- Atom as text editor
- GNU/Linux as O.S :-D
- GNU Code style and libraries
- Telegram for chatting with friends
