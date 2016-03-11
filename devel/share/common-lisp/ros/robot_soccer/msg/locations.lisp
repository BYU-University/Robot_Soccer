; Auto-generated. Do not edit!


(cl:in-package robot_soccer-msg)


;//! \htmlinclude locations.msg.html

(cl:defclass <locations> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (home1_x
    :reader home1_x
    :initarg :home1_x
    :type cl:integer
    :initform 0)
   (home1_y
    :reader home1_y
    :initarg :home1_y
    :type cl:integer
    :initform 0)
   (home1_theta
    :reader home1_theta
    :initarg :home1_theta
    :type cl:integer
    :initform 0)
   (ball_x
    :reader ball_x
    :initarg :ball_x
    :type cl:integer
    :initform 0)
   (ball_y
    :reader ball_y
    :initarg :ball_y
    :type cl:integer
    :initform 0)
   (field_width
    :reader field_width
    :initarg :field_width
    :type cl:integer
    :initform 0)
   (field_height
    :reader field_height
    :initarg :field_height
    :type cl:integer
    :initform 0))
)

(cl:defclass locations (<locations>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <locations>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'locations)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-msg:<locations> is deprecated: use robot_soccer-msg:locations instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:header-val is deprecated.  Use robot_soccer-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'home1_x-val :lambda-list '(m))
(cl:defmethod home1_x-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:home1_x-val is deprecated.  Use robot_soccer-msg:home1_x instead.")
  (home1_x m))

(cl:ensure-generic-function 'home1_y-val :lambda-list '(m))
(cl:defmethod home1_y-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:home1_y-val is deprecated.  Use robot_soccer-msg:home1_y instead.")
  (home1_y m))

(cl:ensure-generic-function 'home1_theta-val :lambda-list '(m))
(cl:defmethod home1_theta-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:home1_theta-val is deprecated.  Use robot_soccer-msg:home1_theta instead.")
  (home1_theta m))

(cl:ensure-generic-function 'ball_x-val :lambda-list '(m))
(cl:defmethod ball_x-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:ball_x-val is deprecated.  Use robot_soccer-msg:ball_x instead.")
  (ball_x m))

(cl:ensure-generic-function 'ball_y-val :lambda-list '(m))
(cl:defmethod ball_y-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:ball_y-val is deprecated.  Use robot_soccer-msg:ball_y instead.")
  (ball_y m))

(cl:ensure-generic-function 'field_width-val :lambda-list '(m))
(cl:defmethod field_width-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:field_width-val is deprecated.  Use robot_soccer-msg:field_width instead.")
  (field_width m))

(cl:ensure-generic-function 'field_height-val :lambda-list '(m))
(cl:defmethod field_height-val ((m <locations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:field_height-val is deprecated.  Use robot_soccer-msg:field_height instead.")
  (field_height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <locations>) ostream)
  "Serializes a message object of type '<locations>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'home1_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'home1_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'home1_theta)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ball_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ball_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'field_width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'field_height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <locations>) istream)
  "Deserializes a message object of type '<locations>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'home1_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'home1_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'home1_theta) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ball_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ball_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'field_width) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'field_height) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<locations>)))
  "Returns string type for a message object of type '<locations>"
  "robot_soccer/locations")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'locations)))
  "Returns string type for a message object of type 'locations"
  "robot_soccer/locations")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<locations>)))
  "Returns md5sum for a message object of type '<locations>"
  "48d9e5afdb93afb928ab25a7f406ab6f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'locations)))
  "Returns md5sum for a message object of type 'locations"
  "48d9e5afdb93afb928ab25a7f406ab6f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<locations>)))
  "Returns full string definition for message of type '<locations>"
  (cl:format cl:nil "Header header~%int32 home1_x~%int32 home1_y~%int32 home1_theta~%int32 ball_x~%int32 ball_y~%int32 field_width~%int32 field_height~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'locations)))
  "Returns full string definition for message of type 'locations"
  (cl:format cl:nil "Header header~%int32 home1_x~%int32 home1_y~%int32 home1_theta~%int32 ball_x~%int32 ball_y~%int32 field_width~%int32 field_height~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <locations>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <locations>))
  "Converts a ROS message object to a list"
  (cl:list 'locations
    (cl:cons ':header (header msg))
    (cl:cons ':home1_x (home1_x msg))
    (cl:cons ':home1_y (home1_y msg))
    (cl:cons ':home1_theta (home1_theta msg))
    (cl:cons ':ball_x (ball_x msg))
    (cl:cons ':ball_y (ball_y msg))
    (cl:cons ':field_width (field_width msg))
    (cl:cons ':field_height (field_height msg))
))
