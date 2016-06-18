################################################################################
##
##  Provide Macro support for the CMake build system
##
##  Version: 0.9
##  Author: Victor Goñi Sanz (vgonisanz@gmail.com)
##  License: The MIT License (MIT)
##
##  Copyright (c) 2016 Víctor Goñi Sanz
##
##  Permission is hereby granted, free of charge, to any person obtaining a copy
##  of this software and associated documentation files (the "Software"), to deal
##  in the Software without restriction, including without limitation the rights
##  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
##  copies of the Software, and to permit persons to whom the Software is
##  furnished to do so, subject to the following conditions:
##
##  The above copyright notice and this permission notice shall be included in all
##  copies or substantial portions of the Software.
##
##  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
##  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
##  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
##  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
##  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
##  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
##  SOFTWARE.
##
###############################################################################

###############################################################################
# USAGE:
#   Append the folder in your main CMakeLists relative the position of the
#   submodule CMakeSupporter, and the include it, Example:
# LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/cmakesupport")
# INCLUDE( cms )
###############################################################################

###############################################################################
# Files:
# - cmsprint: Contain all print macros
# - cmsconfigureproject: Contain userful macros to generate vars and info
# - cmscrossplatform: Contain macro to control crosscompiling. Limited to 5 targets.
# - cmsgccversion: Contain some macros to work with GCC, experimental.
# - signature: Example of a personal signature. You can use this one if you want
###############################################################################

###############################################################################
# Declaration of all functions
###############################################################################
# cmsprint.cmake
###############################################################################
#   PRINT  ${MESSAGE}
#     Description: Print string common message
#     ${MESSAGE}   Message string
#   PRINTTITLE    ${MESSAGE}
#     Description: Print string message with title format
#     ${MESSAGE}   Message string
#   PRINTSUBTITLE ${MESSAGE}
#     Description: Print string message with subtitle format
#     ${MESSAGE}   Message string
#   PRINTIF       ${VALUE} ${MESSAGE}
#     Description: Print string message with VALUE is true
#     ${VALUE}     Boolean to check
#     ${MESSAGE}   Message string
#   PRINTBASICINFO ${PROJ_NAME}
#     Description: print userful, include directories, libraries path and libs to debug.
#     ${PROJ_NAME}   Project name string
#   PRINTADVANCEDINFO ${PROJ_NAME}
#     Description: Print userful FULL info with PROJ_NAME title, flags, etc
#     ${PROJ_NAME}   Project name string
###############################################################################
# cmscrossplatform.cmake
###############################################################################
#   CHECKCROSSPLATFORM  ${PREFIX}
#     Description: Autodetect Win32, MAC, Linux iOS or android. Android & iOS
#     based on Toolchain. If you use other toolchain, arm or similar, avoid use this
#     ${PREFIX} Prefix string to add to variable names
###############################################################################
# cmsconfigureproject.cmake
###############################################################################
#   CONFIGUREVARIABLESPROJECT  NAME VMajor VMinor VPatch PRINT
#     Description:    Configure userful variables
#     ${Name}          The main name of the project
#     ${Version}       Major, minor and patch
#     ${Print info}    Want to print flag
#     Example:  CONFIGUREVARIABLESPROJECT(CoolProject 0 2 9 TRUE)
###############################################################################
# signature.cmake
###############################################################################
#   PRINTSIGNATURE SIGNATURE DATE
#    Description: Print message with train with author and data
#    ${SIGNATURE}   Author string
#    ${DATE}        Date string
###############################################################################

# Include files with macros and functions
MESSAGE( " * You are including CMakeSupporter scripts" )

INCLUDE( Modules/signature )                # My own signature, comment it if you want to avoid
INCLUDE( Modules/cmsprint )                 # Userful macros to print logs
INCLUDE( Modules/cmscrossplatform )         # Autodetect target platform, compatible with: GNU/Linux, MAC, Windows, iOS and Android, comment with different toolchains
INCLUDE( Modules/cmsconfigureproject )      # Configure some userful variables with this macro
INCLUDE( Modules/cmsgccversion )            # Configure GCC Options, need to improve
