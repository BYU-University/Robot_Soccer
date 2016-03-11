# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_soccer: 2 messages, 2 services")

set(MSG_I_FLAGS "-Irobot_soccer:/home/odroid/catkin_ws/src/robot_soccer/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_soccer_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg" NAME_WE)
add_custom_target(_robot_soccer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_soccer" "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv" NAME_WE)
add_custom_target(_robot_soccer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_soccer" "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv" ""
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv" NAME_WE)
add_custom_target(_robot_soccer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_soccer" "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv" ""
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg" NAME_WE)
add_custom_target(_robot_soccer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_soccer" "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_soccer
)
_generate_msg_cpp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_soccer
)

### Generating Services
_generate_srv_cpp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_soccer
)
_generate_srv_cpp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_soccer
)

### Generating Module File
_generate_module_cpp(robot_soccer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_soccer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_soccer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_soccer_generate_messages robot_soccer_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_cpp _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_cpp _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_cpp _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_cpp _robot_soccer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_soccer_gencpp)
add_dependencies(robot_soccer_gencpp robot_soccer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_soccer_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_soccer
)
_generate_msg_eus(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_soccer
)

### Generating Services
_generate_srv_eus(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_soccer
)
_generate_srv_eus(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_soccer
)

### Generating Module File
_generate_module_eus(robot_soccer
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_soccer
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_soccer_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_soccer_generate_messages robot_soccer_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_eus _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_eus _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_eus _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_eus _robot_soccer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_soccer_geneus)
add_dependencies(robot_soccer_geneus robot_soccer_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_soccer_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_soccer
)
_generate_msg_lisp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_soccer
)

### Generating Services
_generate_srv_lisp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_soccer
)
_generate_srv_lisp(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_soccer
)

### Generating Module File
_generate_module_lisp(robot_soccer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_soccer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_soccer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_soccer_generate_messages robot_soccer_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_lisp _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_lisp _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_lisp _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_lisp _robot_soccer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_soccer_genlisp)
add_dependencies(robot_soccer_genlisp robot_soccer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_soccer_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer
)
_generate_msg_py(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer
)

### Generating Services
_generate_srv_py(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer
)
_generate_srv_py(robot_soccer
  "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer
)

### Generating Module File
_generate_module_py(robot_soccer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_soccer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_soccer_generate_messages robot_soccer_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/convertedCoordinates.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_py _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/commcenter.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_py _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/srv/curlocs.srv" NAME_WE)
add_dependencies(robot_soccer_generate_messages_py _robot_soccer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/locations.msg" NAME_WE)
add_dependencies(robot_soccer_generate_messages_py _robot_soccer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_soccer_genpy)
add_dependencies(robot_soccer_genpy robot_soccer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_soccer_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_soccer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_soccer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(robot_soccer_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_soccer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_soccer
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(robot_soccer_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_soccer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_soccer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(robot_soccer_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_soccer
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(robot_soccer_generate_messages_py std_msgs_generate_messages_py)
