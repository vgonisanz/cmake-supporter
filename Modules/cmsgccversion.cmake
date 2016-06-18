MESSAGE( "   · Adding: cmsgccversion macros" )

# 5º Support C++11 crossplatform
# ------------------------------------------------------------------------------------------------------
 MACRO(ADD_CPP11)
   PRINT("Adding C++11 flags, NEEDED to be supported by compiler")
   IF(TARGET_PLATFORM STREQUAL TARGET_APPLE)
     SET(CMAKE_CXX_FLAGS "-std=c++11 -stdlib=libc++ ${CMAKE_CXX_FLAGS} ")
   ELSE()
     SET(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS} -fPIC")
   ENDIF()
ENDMACRO()

# Sets the appropriate flag to enable C++11 support
MACRO(ENABLE_CXX11)
    # Compiler-specific C++11 activation.
	IF("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU")
		SET(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS} ")
		IF(NOT (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 4.7 OR
			CMAKE_CXX_COMPILER_VERSION VERSION_EQUAL 4.7 OR
			DEFINED CMAKE_TOOLCHAIN_FILE))
			PRINT("${PROJECT_NAME} requires g++ 4.7 or greater, your version is ${CMAKE_CXX_COMPILER_VERSION}")
		ELSE()
			PRINT("${PROJECT_NAME} GNU compiler use C++11")
		ENDIF()
	elseif ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
		SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
		find_package(LLVM REQUIRED CONFIG)
		PRINT("${PROJECT_NAME} Clang compiler use C++11")
	else ()
		PRINT("${PROJECT_NAME} c++11 works")
	endif ()
ENDMACRO()
