MESSAGE( "   · Adding: cmsprint macros" )

# If you have no a signature macro, create it empty
IF(COMMAND PRINTSIGNATURE)
  MESSAGE( " * Using predefined signature ")
ELSE()
  MESSAGE( " * Generating empty signature ...")
    MACRO(PRINTSIGNATURE)
      MESSAGE("   ") # No signature
    ENDMACRO()
ENDIF()

# Print a Title formatted message Always
MACRO(PRINTTITLE MESSAGE)
  MESSAGE("  ")
  MESSAGE("  * ${MESSAGE}" )
  MESSAGE("  *-----------------------------------------------------------------------------------*" )
ENDMACRO()

# Print a Subtitle formatted message Always
MACRO(PRINTSUBTITLE MESSAGE)
  MESSAGE(STATUS "  ")
  MESSAGE(STATUS "  | ${MESSAGE}")
  MESSAGE(STATUS "  -------------------------------------------------------------------------------")
ENDMACRO()

# Print a message Always
MACRO(PRINT MESSAGE)
  MESSAGE(STATUS "  · ${MESSAGE}")
ENDMACRO()

# Print a message only if value is TRUE or ON
MACRO(PRINTIF VALUE MESSAGE)
  IF(${VALUE})
    MESSAGE(STATUS "  · ${MESSAGE}")
  ENDIF()
ENDMACRO()

# Print basic info, include directories, link directories, and libs that current project has defined.
# Userful if you put variables but they are empty, to fast check all variables path are ok
MACRO(PRINTBASICINFO PROJ_NAME)
  PRINTTITLE("Project: ${PROJ_NAME} information ")
  PRINTSUBTITLE("Include directories:")
    # Include DIRECTORIES
    GET_PROPERTY(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
    FOREACH(dir ${dirs})
      PRINT("· '${dir}'")
    ENDFOREACH()

  PRINTSUBTITLE("Link directories:")
    # Link DIRECTORIES
    GET_PROPERTY(targetdirlinks DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY LINK_DIRECTORIES)
    FOREACH(linkdir ${targetdirlinks})
      PRINT("· '${linkdir}'")
    ENDFOREACH()

  PRINTSUBTITLE("Link libraries:")
    # Linking against
    GET_TARGET_PROPERTY(libtargets ${PROJ_NAME} LINK_LIBRARIES)
    FOREACH(libtarget ${libtargets})
      PRINT("·'${libtarget}'")
    ENDFOREACH()
ENDMACRO()

# Print advanced info, platform, crosscompiling, flags, and other...
MACRO(PRINTADVANCEDINFO PROJ_NAME DATE)
  # INFO
  #---------------------------------------------------
  PRINTTITLE("Project ${PROJ_NAME} configuration is:")
  PRINTSUBTITLE("Platform:")
  PRINT("Host: ${CMAKE_HOST_SYSTEM_NAME} v${CMAKE_HOST_SYSTEM_VERSION} arch: ${CMAKE_HOST_SYSTEM_PROCESSOR} ")
  PRINT("Crosscompiling: ${CMAKE_CROSSCOMPILING} ")
  PRINTIF(CMAKE_CROSSCOMPILING "Platform Target: ${CMAKE_SYSTEM_NAME} v${CMAKE_SYSTEM_VERSION} arch: ${CMAKE_SYSTEM_PROCESSOR} ")
  PRINTSUBTITLE("CMake Options:")
  PRINT("CMake: v${CMAKE_VERSION}")
  PRINT("Build mode: ${CMAKE_GENERATOR}")
  PRINT("Compiler:  ${CMAKE_BUILD_TOOL}")
  PRINTIF(MSVC "Visual Studio: ${MSVC_VERSION}")
  IF(NOT CMAKE_GENERATOR MATCHES "Xcode|Visual Studio")
    PRINT("Build type selected: ${CMAKE_BUILD_TYPE}")
    PRINT("Build Configurations: ${CMAKE_CONFIGURATION_TYPES} ")
  ENDIF()
  PRINT("Verbose mode: ${CMAKE_VERBOSE} ")
  PRINT("Target Name: ${TARGET_PLATFORM} ")
  PRINTSUBTITLE("Cmake Paths " )
  PRINT("Installation: ${CMAKE_BINARY_DIR}")
  PRINTSUBTITLE("Project Paths " )
  PRINT("Root: ${${PROJ_NAME}_PATH_MAIN} ")
  PRINT("Data: ${${PROJ_NAME}_PATH_DATA} ")
  PRINT("Libs: ${${PROJ_NAME}_PATH_LIBS} ")
  PRINT("Installation: ${${PROJ_NAME}_PATH_INSTALL} ")
  PRINT("Executable: ${EXECUTABLE_OUTPUT_PATH} ")
  PRINT("Binary: ${PROJECT_BINARY_DIR} ")
  PRINTSUBTITLE("Project options to built" )
  PRINT("Samples: ${${PROJECT_NAME}_BUILD_SAMPLES} ")
  PRINT("Tests: ${${PROJECT_NAME}_BUILD_TEST} ")
  PRINT("Documentation: ${${PROJECT_NAME}_BUILD_DOCS} ")
  PRINT("Profiling: ${${PROJECT_NAME}_BUILD_PROFILE} ")
  PRINT("")
  # ========================== C/C++ options ==========================
  PRINTSUBTITLE("C/C++:")
#MESSAGE("	Precompiled headers:"     PCHSupport_FOUND AND ENABLE_PRECOMPILED_HEADERS THEN YES ELSE NO)
  PRINT("Built as dynamic libs?: BUILD_SHARED_LIBS THEN YES ELSE NO")
# MESSAGE("	C++ Compiler:"           CMAKE_COMPILER_IS_GNUCXX THEN "${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_ARG1} (ver ${CMAKE_GCC_REGEX_VERSION})" ELSE "${CMAKE_CXX_COMPILER}" )  PRINT("C++ flags (Release):    ${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE}")
  PRINT("C++ flags (Debug): ${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG}")
  PRINT("C Compiler:  ${CMAKE_C_COMPILER} ${CMAKE_C_COMPILER_ARG1}")
  PRINT("C flags (Release): ${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_RELEASE}")
  PRINT("C flags (Debug): ${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_DEBUG}")
  PRINT("Linker flags exe (Release): ${CMAKE_EXE_LINKER_FLAGS} ${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
  PRINT("Linker flags exe (Debug):  ${CMAKE_EXE_LINKER_FLAGS} ${CMAKE_EXE_LINKER_FLAGS_DEBUG}")
  PRINT("Linker flags shared (Release): ${CMAKE_SHARED_LINKER_FLAGS} ${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
  PRINT("Linker flags shared (Debug): ${CMAKE_SHARED_LINKER_FLAGS} ${CMAKE_SHARED_LINKER_FLAGS_DEBUG}")
  PRINT("")

  # ========================== Android details ==========================
IF(TARGET_PLATFORM STREQUAL TARGET_ANDROID)
    PRINTSUBTITLE("Android:")
    PRINT("Android ABI: ${ANDROID_ABI}")
    PRINT("Native API level: android-${ANDROID_NATIVE_API_LEVEL}")
    PRINT("SDK target: ${ANDROID_SDK_TARGET}")
    PRINT("Android NDK: ${ANDROID_NDK} (toolchain: ${ANDROID_TOOLCHAIN_NAME})")
    PRINT("")
ENDIF(TARGET_PLATFORM STREQUAL TARGET_ANDROID)

  # ========================== iOS details ==========================
IF( TARGET_PLATFORM_NAME STREQUAL iOS )
  PRINTSUBTITLE("iOS: ")
  PRINT("Platform:  ${IOS_PLATFORM} ")
  PRINT("SDK Root:  ${CMAKE_IOS_SDK_ROOT} ")
  PRINT("Architectures: ${CMAKE_OSX_ARCHITECTURES} ")
  PRINT("Deployment Target: ${CMAKE_OSX_DEPLOYMENT_TARGET} ")
  PRINT("Framework Search Path: ${CMAKE_FRAMEWORK_PATH} ")
  PRINT("OSX SYSROOT: ${CMAKE_OSX_SYSROOT} ")
  PRINT("")
ENDIF()
  PRINTSIGNATURE( ${PROJ_NAME} ${DATE})
  PRINTSUBTITLE(" ")
ENDMACRO()
