; Auto-generated. Do not edit!


(cl:in-package robot_soccer-srv)


;//! \htmlinclude commcenter-request.msg.html

(cl:defclass <commcenter-request> (roslisp-msg-protocol:ros-message)
  ((comm
    :reader comm
    :initarg :comm
    :type cl:integer
    :initform 0))
)

(cl:defclass commcenter-request (<commcenter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <commcenter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'commcenter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<commcenter-request> is deprecated: use robot_soccer-srv:commcenter-request instead.")))

(cl:ensure-generic-function 'comm-val :lambda-list '(m))
(cl:defmethod comm-val ((m <commcenter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:comm-val is deprecated.  Use robot_soccer-srv:comm instead.")
  (comm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <commcenter-request>) ostream)
  "Serializes a message object of type '<commcenter-request>"
  (cl:let* ((signed (cl:slot-value msg 'comm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <commcenter-request>) istream)
  "Deserializes a message object of type '<commcenter-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'comm) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<commcenter-request>)))
  "Returns string type for a service object of type '<commcenter-request>"
  "robot_soccer/commcenterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'commcenter-request)))
  "Returns string type for a service object of type 'commcenter-request"
  "robot_soccer/commcenterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<commcenter-request>)))
  "Returns md5sum for a message object of type '<commcenter-request>"
  "f20d8de9800e6b15bcaa4586b124e5e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'commcenter-request)))
  "Returns md5sum for a message object of type 'commcenter-request"
  "f20d8de9800e6b15bcaa4586b124e5e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<commcenter-request>)))
  "Returns full string definition for message of type '<commcenter-request>"
  (cl:format cl:nil "int32 comm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'commcenter-request)))
  "Returns full string definition for message of type 'commcenter-request"
  (cl:format cl:nil "int32 comm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <commcenter-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <commcenter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'commcenter-request
    (cl:cons ':comm (comm msg))
))
;//! \htmlinclude commcenter-response.msg.html

(cl:defclass <commcenter-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass commcenter-response (<commcenter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <commcenter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'commcenter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<commcenter-response> is deprecated: use robot_soccer-srv:commcenter-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <commcenter-response>) ostream)
  "Serializes a message object of type '<commcenter-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <commcenter-response>) istream)
  "Deserializes a message object of type '<commcenter-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<commcenter-response>)))
  "Returns string type for a service object of type '<commcenter-response>"
  "robot_soccer/commcenterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'commcenter-response)))
  "Returns string type for a service object of type 'commcenter-response"
  "robot_soccer/commcenterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<commcenter-response>)))
  "Returns md5sum for a message object of type '<commcenter-response>"
  "f20d8de9800e6b15bcaa4586b124e5e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'commcenter-response)))
  "Returns md5sum for a message object of type 'commcenter-response"
  "f20d8de9800e6b15bcaa4586b124e5e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<commcenter-response>)))
  "Returns full string definition for message of type '<commcenter-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'commcenter-response)))
  "Returns full string definition for message of type 'commcenter-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <commcenter-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <commcenter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'commcenter-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'commcenter)))
  'commcenter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'commcenter)))
  'commcenter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'commcenter)))
  "Returns string type for a service object of type '<commcenter>"
  "robot_soccer/commcenter")