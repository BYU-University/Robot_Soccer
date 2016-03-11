; Auto-generated. Do not edit!


(cl:in-package robot_soccer-srv)


;//! \htmlinclude commandsent-request.msg.html

(cl:defclass <commandsent-request> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (vel_x
    :reader vel_x
    :initarg :vel_x
    :type cl:float
    :initform 0.0)
   (vel_y
    :reader vel_y
    :initarg :vel_y
    :type cl:float
    :initform 0.0)
   (omega
    :reader omega
    :initarg :omega
    :type cl:float
    :initform 0.0))
)

(cl:defclass commandsent-request (<commandsent-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <commandsent-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'commandsent-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<commandsent-request> is deprecated: use robot_soccer-srv:commandsent-request instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <commandsent-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:timestamp-val is deprecated.  Use robot_soccer-srv:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'vel_x-val :lambda-list '(m))
(cl:defmethod vel_x-val ((m <commandsent-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:vel_x-val is deprecated.  Use robot_soccer-srv:vel_x instead.")
  (vel_x m))

(cl:ensure-generic-function 'vel_y-val :lambda-list '(m))
(cl:defmethod vel_y-val ((m <commandsent-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:vel_y-val is deprecated.  Use robot_soccer-srv:vel_y instead.")
  (vel_y m))

(cl:ensure-generic-function 'omega-val :lambda-list '(m))
(cl:defmethod omega-val ((m <commandsent-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:omega-val is deprecated.  Use robot_soccer-srv:omega instead.")
  (omega m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <commandsent-request>) ostream)
  "Serializes a message object of type '<commandsent-request>"
  (cl:let* ((signed (cl:slot-value msg 'timestamp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'omega))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <commandsent-request>) istream)
  "Deserializes a message object of type '<commandsent-request>"
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
    (cl:setf (cl:slot-value msg 'vel_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'omega) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<commandsent-request>)))
  "Returns string type for a service object of type '<commandsent-request>"
  "robot_soccer/commandsentRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'commandsent-request)))
  "Returns string type for a service object of type 'commandsent-request"
  "robot_soccer/commandsentRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<commandsent-request>)))
  "Returns md5sum for a message object of type '<commandsent-request>"
  "2090a5a3e1241f8cc8576da8a833f62d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'commandsent-request)))
  "Returns md5sum for a message object of type 'commandsent-request"
  "2090a5a3e1241f8cc8576da8a833f62d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<commandsent-request>)))
  "Returns full string definition for message of type '<commandsent-request>"
  (cl:format cl:nil "int32 timestamp~%float64 vel_x~%float64 vel_y~%float64 omega~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'commandsent-request)))
  "Returns full string definition for message of type 'commandsent-request"
  (cl:format cl:nil "int32 timestamp~%float64 vel_x~%float64 vel_y~%float64 omega~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <commandsent-request>))
  (cl:+ 0
     4
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <commandsent-request>))
  "Converts a ROS message object to a list"
  (cl:list 'commandsent-request
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':vel_x (vel_x msg))
    (cl:cons ':vel_y (vel_y msg))
    (cl:cons ':omega (omega msg))
))
;//! \htmlinclude commandsent-response.msg.html

(cl:defclass <commandsent-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass commandsent-response (<commandsent-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <commandsent-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'commandsent-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<commandsent-response> is deprecated: use robot_soccer-srv:commandsent-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <commandsent-response>) ostream)
  "Serializes a message object of type '<commandsent-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <commandsent-response>) istream)
  "Deserializes a message object of type '<commandsent-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<commandsent-response>)))
  "Returns string type for a service object of type '<commandsent-response>"
  "robot_soccer/commandsentResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'commandsent-response)))
  "Returns string type for a service object of type 'commandsent-response"
  "robot_soccer/commandsentResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<commandsent-response>)))
  "Returns md5sum for a message object of type '<commandsent-response>"
  "2090a5a3e1241f8cc8576da8a833f62d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'commandsent-response)))
  "Returns md5sum for a message object of type 'commandsent-response"
  "2090a5a3e1241f8cc8576da8a833f62d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<commandsent-response>)))
  "Returns full string definition for message of type '<commandsent-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'commandsent-response)))
  "Returns full string definition for message of type 'commandsent-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <commandsent-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <commandsent-response>))
  "Converts a ROS message object to a list"
  (cl:list 'commandsent-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'commandsent)))
  'commandsent-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'commandsent)))
  'commandsent-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'commandsent)))
  "Returns string type for a service object of type '<commandsent>"
  "robot_soccer/commandsent")