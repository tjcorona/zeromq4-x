
file(READ "${PROJECT_SOURCE_DIR}/include/zmq.h" _ZMQ_H_CONTENTS)
string(REGEX REPLACE ".*#define ZMQ_VERSION_MAJOR ([0-9]+).*" "\\1" ZMQ_VERSION_MAJOR "${_ZMQ_H_CONTENTS}")
string(REGEX REPLACE ".*#define ZMQ_VERSION_MINOR ([0-9]+).*" "\\1" ZMQ_VERSION_MINOR "${_ZMQ_H_CONTENTS}")
string(REGEX REPLACE ".*#define ZMQ_VERSION_PATCH ([0-9]+).*" "\\1" ZMQ_VERSION_PATCH "${_ZMQ_H_CONTENTS}")
set(ZMQ_VERSION "${ZMQ_VERSION_MAJOR}.${ZMQ_VERSION_MINOR}.${ZMQ_VERSION_PATCH}")

message(STATUS "Detected ZMQ Version - ${ZMQ_VERSION}")

if(MSVC14)
  set(_zmq_COMPILER "-v140")
elseif(MSVC12)
  set(_zmq_COMPILER "-v120")
elseif(MSVC11)
  set(_zmq_COMPILER "-v110")
elseif(MSVC10)
  set(_zmq_COMPILER "-v100")
elseif(MSVC90)
  set(_zmq_COMPILER "-v90")
elseif(NOT _zmq_COMPILER)
  #only clear if the user hasn't manually specified these
  set(_zmq_COMPILER "")
endif()
