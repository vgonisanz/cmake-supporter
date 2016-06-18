#####################################################################################################################################################################################
# This is an Auto-compilable module configuration script.
# This CMakeLists user some macros to create executable and install following Pipero Style Project.
#     · This CMakeList is the reference .
#     · All headers (*.h, *.hcc) must be in ./include folder
#     · All source (*.c, *.cpp) must be in ./src folder
#
# The steps are:
#   1º  Assign temporal PROJ_NAME variable. Edit with a name and the sample will compile automatically.
#     · Notify start module with log and set flag to print debug info
#   2º  Assign INCLUDE_DIRECTORIES variable with all include paths needed by your code.
#   3º  Set linking directories (path to libraries needed)
#   4º  Macro to take all files, take all src and includes from their folders.
#   5º  Command ADD_LIBRARY create a library shared of static according with main configuration.
#   6º  Linked libraries with the module. Set the name of libraries needed by the project.
#   7º  Install: Where to install the library binary and the headers.
#   8º  Print debug info if configured option ${PROJ_NAME}_PRINT_DEBUG
#     · Notify left module
#
#   Warning: Variable ${PROJ_NAME} will be override out of this project.
#   Note: Use option to call macro PRINTBASICINFO if you have a problem with:
#         include or library path, or linking. It will print userful info in Cmake output.
#####################################################################################################################################################################################

# Module step I: Set a name (PROJ_NAME), version, and enable languages for the current project
# ------------------------------------------------------------------------------------------------------
SET(PROJ_NAME moduletemplate)
PROJECT(${PROJ_NAME})

# Notify start and option print
OPTION(${PROJ_MAIN_NAME}_${PROJ_NAME}_PRINT_DEBUG FALSE)
PRINT("+ Adding module ${PROJ_NAME} ")				# In info


# Module step II: Add the given directories to those the compiler uses to search for include files
# ------------------------------------------------------------------------------------------------------
INCLUDE_DIRECTORIES(  ${CMAKE_CURRENT_SOURCE_DIR}/include		                 # This projects' includes
                      ${${PROJ_MAIN_NAME}_INCLUDE_PATH}           # Main project includes
                      # ${DIR2}  # Commented dir2
                      )

# Module step III: Create variables with all includes and sources. You can add them manually in a VAR.
# ------------------------------------------------------------------------------------------------------
FILE(GLOB ${PROJ_NAME}_HEADERS
    "include/*.h"
    "include/*.hpp"
)
FILE(GLOB ${PROJ_NAME}_SRC
    "src/*.c"
    "src/*.cpp"
)

# Module step IV: List of linker search directories. Path to headers needed by the project.
# ------------------------------------------------------------------------------------------------------
#LINK_DIRECTORIES( ${DIR1} ${DIR2} ...)

# Module step V: Create a library using the specified source files and build type in current project.
# ------------------------------------------------------------------------------------------------------
ADD_LIBRARY(${PROJ_NAME} ${${PROJ_MAIN_NAME}_LIB_TYPE} ${${PROJ_NAME}_HEADERS} ${${PROJ_NAME}_SRC} )

# Module step VI: Link a target to given libraries. Set the name of libraries needed by the project.
# ------------------------------------------------------------------------------------------------------
#TARGET_LINK_LIBRARIES(${PROJ_NAME} project-dependency1)

# Module step VII: Specify rules to run at install time. Copy generated library and PUBLIC headers to a destination.
# ------------------------------------------------------------------------------------------------------
INSTALL(TARGETS ${PROJ_NAME}
        DESTINATION "${${PROJ_MAIN_NAME}_PATH_INSTALL}/lib"
        )
INSTALL(FILES ${${PROJ_NAME}_HEADERS}
        DESTINATION "${${PROJ_MAIN_NAME}_PATH_INSTALL}/include/${PROJ_MAIN_NAME}/${PROJ_NAME}"
        )

# Module step VIII (DEBUG ONLY): Use macro from cmakesupport to print userful info for free.
# ------------------------------------------------------------------------------------------------------
IF(${${PROJ_MAIN_NAME}_${PROJ_NAME}_PRINT_DEBUG})
  PRINTBASICINFO(${PROJ_NAME})						# Print absolute path to includes, libraries, and libs to link.
ENDIF()

# Notify end
PRINT("- Module ${PROJ_NAME} added!")					# Out info
