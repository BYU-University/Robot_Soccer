# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hadead: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ihadead:/home/odroid/catkin_ws/src/robot_soccer/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hadead_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg" NAME_WE)
add_custom_target(_hadead_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hadead" "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hadead
  "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hadead
)

### Generating Services

### Generating Module File
_generate_module_cpp(hadead
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hadead
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hadead_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hadead_generate_messages hadead_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg" NAME_WE)
add_dependencies(hadead_generate_messages_cpp _hadead_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hadead_gencpp)
add_dependencies(hadead_gencpp hadead_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hadead_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hadead
  "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hadead
)

### Generating Services

### Generating Module File
_generate_module_eus(hadead
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hadead
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hadead_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hadead_generate_messages hadead_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg" NAME_WE)
add_dependencies(hadead_generate_messages_eus _hadead_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hadead_geneus)
add_dependencies(hadead_geneus hadead_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hadead_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hadead
  "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hadead
)

### Generating Services

### Generating Module File
_generate_module_lisp(hadead
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hadead
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hadead_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hadead_generate_messages hadead_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg" NAME_WE)
add_dependencies(hadead_generate_messages_lisp _hadead_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hadead_genlisp)
add_dependencies(hadead_genlisp hadead_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hadead_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hadead
  "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hadead
)

### Generating Services

### Generating Module File
_generate_module_py(hadead
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hadead
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hadead_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hadead_generate_messages hadead_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/robot_soccer/msg/Num.msg" NAME_WE)
add_dependencies(hadead_generate_messages_py _hadead_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hadead_genpy)
add_dependencies(hadead_genpy hadead_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hadead_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hadead)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hadead
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(hadead_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hadead)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hadead
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(hadead_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hadead)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hadead
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(hadead_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hadead)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hadead\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hadead
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(hadead_generate_messages_py std_msgs_generate_messages_py)
