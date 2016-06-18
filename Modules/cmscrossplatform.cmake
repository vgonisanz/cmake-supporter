MESSAGE( "   · Adding: cmscrossplatform macros" )

# Description:
#   Set variable ${PREFIX}_TARGET_PLATFORM to set info
# Variables:
#   Prefix: Prefix variable name. Usually project's name
# ------------------------------------------------------------------
# Usage example:
#   CHECKCROSSPLATFORM("CoolProject")

FUNCTION(CHECKCROSSPLATFORM PREFIX)
  SET(${PREFIX}_TARGET_PLATFORM CACHE STRING "${PREFIX}_TARGET_NONE")
  SET_PROPERTY(CACHE ${PREFIX}_TARGET_PLATFORM PROPERTY STRINGS "${PREFIX}_TARGET_NONE" "${PREFIX}_TARGET_ANDROID" "${PREFIX}_TARGET_WIN32" "${PREFIX}_TARGET_GNULINUX" "${PREFIX}_TARGET_IOS" "${PREFIX}_TARGET_MACOS" "${PREFIX}_UNKNOWN")	# List with targets types

  PRINTTITLE("Autodetecting architecture . . .")

  IF(NOT CMAKE_TOOLCHAIN_FILE)
    PRINT("You are not using a toolchain")
    IF(WIN32)
      PRINT("Consider your target: Windows")
      SET(${PREFIX}_TARGET_PLATFORM ${PREFIX}_TARGET_WIN32 CACHE STRING "Target Platform" FORCE)
    ELSEIF(APPLE)
      PRINT("Consider your target: MAC")
      SET(${PREFIX}_TARGET_PLATFORM ${PREFIX}_TARGET_MACOS CACHE STRING "Target Platform" FORCE)
    ELSEIF(UNIX)
      PRINT("Consider your target: Linux")
      SET(${PREFIX}_TARGET_PLATFORM ${PREFIX}_TARGET_GNULINUX CACHE STRING "Target Platform" FORCE)
    ELSE()
      MESSAGE(WARNING "Unknown architecture without Toolchain file")
      SET(${PREFIX}_TARGET_PLATFORM ${PREFIX}_UNKNOWN CACHE STRING "Target Platform" FORCE)
    ENDIF(WIN32)
  ELSE()
    PRINT("You are using a toolchain")
    IF(APPLE)
      PRINT("Consider your target: iOS.")
      SET(${PREFIX}_TARGET_PLATFORM ${PREFIX}_TARGET_IOS CACHE STRING "Target Platform" FORCE)
    ELSE(APPLE)
      PRINT("Consider your target: Android.")
      SET(${PREFIX}_TARGET_PLATFORM ${PREFIX}_TARGET_ANDROID CACHE STRING "Target Platform" FORCE)
    ENDIF(APPLE)
  ENDIF()
  PRINT("Your target is: ${TARGET_PLATFORM}")
ENDFUNCTION()
