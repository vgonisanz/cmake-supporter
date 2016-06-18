MESSAGE( "   · Adding: cmsconfigureproject macros" )

# Description:
#   Configure variables fro a basic CXX project. Optional.
# Variables:
#   Name: The main name of the project  Ej: CoolProject
#   Version: Major, minor and patch     Ej: 0.2.9
#   Print info: Want to print flag      Ej: TRUE
# ------------------------------------------------------------------
# Usage example:
#   CONFIGUREPROJECT("CoolProject" 0 2 9 TRUE)

FUNCTION(CONFIGUREVARIABLESPROJECT NAME VMajor VMinor VPatch PRINT)

  PRINTTITLE("Configuring your proyect with main name ${NAME}")

  # All variables use PARENT_SCOPE to add them in the caller SCOPE
  # You cannot use here MESSAGE to print this variables
  SET(PROJ_MAIN_NAME ${NAME} PARENT_SCOPE)
  OPTION(${NAME}_PRINT "Print main info from ${NAME} project" ${PRINT} )

  # Our custom Paths
  SET(${NAME}_PATH_MAIN 	     ${CMAKE_SOURCE_DIR} 					          CACHE PATH "This directory contains initial Path" )
  SET(${NAME}_PATH_LIBS 	     ${PROJECT_BINARY_DIR}/bin				      CACHE PATH "This directory contains all libs" )
  SET(${NAME}_PATH_EXE 		     ${PROJECT_BINARY_DIR}/bin				      CACHE PATH "This directory contains executables" )
  SET(${NAME}_PATH_3RDPARTY 	 ${CMAKE_SOURCE_DIR}/3rdParty 				  CACHE PATH "This directory contains 3rdparty libraries" )
  SET(${NAME}_PATH_INSTALL 	   ${PROJECT_BINARY_DIR}/install/${NAME} 	CACHE PATH "This directory to install prebuilt" )
  SET(${NAME}_PATH_DATA     	 ${CMAKE_SOURCE_DIR}/data 	            CACHE PATH "This directory to provide data to your programs using a relative path" )

  # Force Cmake variables
  SET(LIBRARY_OUTPUT_PATH 	     ${${NAME}_PATH_LIBS} 	CACHE PATH "Library output" FORCE )
  SET(EXECUTABLE_OUTPUT_PATH 	    ${${NAME}_PATH_EXE} 	CACHE PATH "Executable output" FORCE )
  SET(CMAKE_DEBUG_POSTFIX )                                   # No postfix
  SET(CMAKE_CONFIGURATION_TYPES "Debug;Release;Relwithdebinfo;Minsizerel" CACHE STRING "Configs" FORCE)
  SET(CMAKE_BUILD_TYPE Release CACHE STRING "documentation for this variable")

  # Build type
  SET(${NAME}_LIB_TYPE "STATIC" CACHE STRING "Variable to change static or shared automatically usable in projects")
  SET_PROPERTY(CACHE ${NAME}_LIB_TYPE PROPERTY STRINGS "SHARED" "STATIC")

ENDFUNCTION(CONFIGUREVARIABLESPROJECT)
