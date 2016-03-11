; Auto-generated. Do not edit!


(cl:in-package robot_soccer-msg)


;//! \htmlinclude convertedCoordinates.msg.html

(cl:defclass <convertedCoordinates> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (home1_x
    :reader home1_x
    :initarg :home1_x
    :type cl:float
    :initform 0.0)
   (home1_y
    :reader home1_y
    :initarg :home1_y
    :type cl:float
    :initform 0.0)
   (home1_theta
    :reader home1_theta
    :initarg :home1_theta
    :type cl:float
    :initform 0.0)
   (ball_x
    :reader ball_x
    :initarg :ball_x
    :type cl:float
    :initform 0.0)
   (ball_y
    :reader ball_y
    :initarg :ball_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass convertedCoordinates (<convertedCoordinates>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <convertedCoordinates>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'convertedCoordinates)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-msg:<convertedCoordinates> is deprecated: use robot_soccer-msg:convertedCoordinates instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <convertedCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:header-val is deprecated.  Use robot_soccer-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'home1_x-val :lambda-list '(m))
(cl:defmethod home1_x-val ((m <convertedCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:home1_x-val is deprecated.  Use robot_soccer-msg:home1_x instead.")
  (home1_x m))

(cl:ensure-generic-function 'home1_y-val :lambda-list '(m))
(cl:defmethod home1_y-val ((m <convertedCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:home1_y-val is deprecated.  Use robot_soccer-msg:home1_y instead.")
  (home1_y m))

(cl:ensure-generic-function 'home1_theta-val :lambda-list '(m))
(cl:defmethod home1_theta-val ((m <convertedCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:home1_theta-val is deprecated.  Use robot_soccer-msg:home1_theta instead.")
  (home1_theta m))

(cl:ensure-generic-function 'ball_x-val :lambda-list '(m))
(cl:defmethod ball_x-val ((m <convertedCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:ball_x-val is deprecated.  Use robot_soccer-msg:ball_x instead.")
  (ball_x m))

(cl:ensure-generic-function 'ball_y-val :lambda-list '(m))
(cl:defmethod ball_y-val ((m <convertedCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:ball_y-val is deprecated.  Use robot_soccer-msg:ball_y instead.")
  (ball_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <convertedCoordinates>) ostream)
  "Serializes a message object of type '<convertedCoordinates>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'home1_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'home1_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'home1_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ball_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ball_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <convertedCoordinates>) istream)
  "Deserializes a message object of type '<convertedCoordinates>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'home1_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'home1_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'home1_theta) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ball_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ball_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<convertedCoordinates>)))
  "Returns string type for a message object of type '<convertedCoordinates>"
  "robot_soccer/convertedCoordinates")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'convertedCoordinates)))
  "Returns string type for a message object of type 'convertedCoordinates"
  "robot_soccer/convertedCoordinates")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<convertedCoordinates>)))
  "Returns md5sum for a message object of type '<convertedCoordinates>"
  "d11bb9bc3a2bfab614d8fcc128cb2dfa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'convertedCoordinates)))
  "Returns md5sum for a message object of type 'convertedCoordinates"
  "d11bb9bc3a2bfab614d8fcc128cb2dfa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<convertedCoordinates>)))
  "Returns full string definition for message of type '<convertedCoordinates>"
  (cl:format cl:nil "Header header~%float64 home1_x~%float64 home1_y~%float64 home1_theta~%float64 ball_x~%float64 ball_y~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'convertedCoordinates)))
  "Returns full string definition for message of type 'convertedCoordinates"
  (cl:format cl:nil "Header header~%float64 home1_x~%float64 home1_y~%float64 home1_theta~%float64 ball_x~%float64 ball_y~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <convertedCoordinates>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <convertedCoordinates>))
  "Converts a ROS message object to a list"
  (cl:list 'convertedCoordinates
    (cl:cons ':header (header msg))
    (cl:cons ':home1_x (home1_x msg))
    (cl:cons ':home1_y (home1_y msg))
    (cl:cons ':home1_theta (home1_theta msg))
    (cl:cons ':ball_x (ball_x msg))
    (cl:cons ':ball_y (ball_y msg))
))
