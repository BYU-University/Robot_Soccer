; Auto-generated. Do not edit!


(cl:in-package robot_soccer-srv)


;//! \htmlinclude ballloc-request.msg.html

(cl:defclass <ballloc-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ballloc-request (<ballloc-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ballloc-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ballloc-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<ballloc-request> is deprecated: use robot_soccer-srv:ballloc-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ballloc-request>) ostream)
  "Serializes a message object of type '<ballloc-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ballloc-request>) istream)
  "Deserializes a message object of type '<ballloc-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ballloc-request>)))
  "Returns string type for a service object of type '<ballloc-request>"
  "robot_soccer/balllocRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ballloc-request)))
  "Returns string type for a service object of type 'ballloc-request"
  "robot_soccer/balllocRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ballloc-request>)))
  "Returns md5sum for a message object of type '<ballloc-request>"
  "bfeed3c65524b12e19690fcc175741f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ballloc-request)))
  "Returns md5sum for a message object of type 'ballloc-request"
  "bfeed3c65524b12e19690fcc175741f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ballloc-request>)))
  "Returns full string definition for message of type '<ballloc-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ballloc-request)))
  "Returns full string definition for message of type 'ballloc-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ballloc-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ballloc-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ballloc-request
))
;//! \htmlinclude ballloc-response.msg.html

(cl:defclass <ballloc-response> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass ballloc-response (<ballloc-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ballloc-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ballloc-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<ballloc-response> is deprecated: use robot_soccer-srv:ballloc-response instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <ballloc-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:timestamp-val is deprecated.  Use robot_soccer-srv:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ballloc-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:x-val is deprecated.  Use robot_soccer-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ballloc-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:y-val is deprecated.  Use robot_soccer-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ballloc-response>) ostream)
  "Serializes a message object of type '<ballloc-response>"
  (cl:let* ((signed (cl:slot-value msg 'timestamp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ballloc-response>) istream)
  "Deserializes a message object of type '<ballloc-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ballloc-response>)))
  "Returns string type for a service object of type '<ballloc-response>"
  "robot_soccer/balllocResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ballloc-response)))
  "Returns string type for a service object of type 'ballloc-response"
  "robot_soccer/balllocResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ballloc-response>)))
  "Returns md5sum for a message object of type '<ballloc-response>"
  "bfeed3c65524b12e19690fcc175741f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ballloc-response)))
  "Returns md5sum for a message object of type 'ballloc-response"
  "bfeed3c65524b12e19690fcc175741f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ballloc-response>)))
  "Returns full string definition for message of type '<ballloc-response>"
  (cl:format cl:nil "int32 timestamp~%float64 x~%float64 y~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ballloc-response)))
  "Returns full string definition for message of type 'ballloc-response"
  (cl:format cl:nil "int32 timestamp~%float64 x~%float64 y~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ballloc-response>))
  (cl:+ 0
     4
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ballloc-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ballloc-response
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ballloc)))
  'ballloc-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ballloc)))
  'ballloc-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ballloc)))
  "Returns string type for a service object of type '<ballloc>"
  "robot_soccer/ballloc")