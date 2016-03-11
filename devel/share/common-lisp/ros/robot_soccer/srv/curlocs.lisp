; Auto-generated. Do not edit!


(cl:in-package robot_soccer-srv)


;//! \htmlinclude curlocs-request.msg.html

(cl:defclass <curlocs-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass curlocs-request (<curlocs-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <curlocs-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'curlocs-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<curlocs-request> is deprecated: use robot_soccer-srv:curlocs-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <curlocs-request>) ostream)
  "Serializes a message object of type '<curlocs-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <curlocs-request>) istream)
  "Deserializes a message object of type '<curlocs-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<curlocs-request>)))
  "Returns string type for a service object of type '<curlocs-request>"
  "robot_soccer/curlocsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'curlocs-request)))
  "Returns string type for a service object of type 'curlocs-request"
  "robot_soccer/curlocsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<curlocs-request>)))
  "Returns md5sum for a message object of type '<curlocs-request>"
  "0c8e4620cde9c3b16d1cfbdddb8c721c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'curlocs-request)))
  "Returns md5sum for a message object of type 'curlocs-request"
  "0c8e4620cde9c3b16d1cfbdddb8c721c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<curlocs-request>)))
  "Returns full string definition for message of type '<curlocs-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'curlocs-request)))
  "Returns full string definition for message of type 'curlocs-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <curlocs-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <curlocs-request>))
  "Converts a ROS message object to a list"
  (cl:list 'curlocs-request
))
;//! \htmlinclude curlocs-response.msg.html

(cl:defclass <curlocs-response> (roslisp-msg-protocol:ros-message)
  ((pickle
    :reader pickle
    :initarg :pickle
    :type cl:string
    :initform ""))
)

(cl:defclass curlocs-response (<curlocs-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <curlocs-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'curlocs-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<curlocs-response> is deprecated: use robot_soccer-srv:curlocs-response instead.")))

(cl:ensure-generic-function 'pickle-val :lambda-list '(m))
(cl:defmethod pickle-val ((m <curlocs-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:pickle-val is deprecated.  Use robot_soccer-srv:pickle instead.")
  (pickle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <curlocs-response>) ostream)
  "Serializes a message object of type '<curlocs-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'pickle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'pickle))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <curlocs-response>) istream)
  "Deserializes a message object of type '<curlocs-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pickle) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'pickle) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<curlocs-response>)))
  "Returns string type for a service object of type '<curlocs-response>"
  "robot_soccer/curlocsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'curlocs-response)))
  "Returns string type for a service object of type 'curlocs-response"
  "robot_soccer/curlocsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<curlocs-response>)))
  "Returns md5sum for a message object of type '<curlocs-response>"
  "0c8e4620cde9c3b16d1cfbdddb8c721c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'curlocs-response)))
  "Returns md5sum for a message object of type 'curlocs-response"
  "0c8e4620cde9c3b16d1cfbdddb8c721c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<curlocs-response>)))
  "Returns full string definition for message of type '<curlocs-response>"
  (cl:format cl:nil "string pickle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'curlocs-response)))
  "Returns full string definition for message of type 'curlocs-response"
  (cl:format cl:nil "string pickle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <curlocs-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'pickle))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <curlocs-response>))
  "Converts a ROS message object to a list"
  (cl:list 'curlocs-response
    (cl:cons ':pickle (pickle msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'curlocs)))
  'curlocs-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'curlocs)))
  'curlocs-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'curlocs)))
  "Returns string type for a service object of type '<curlocs>"
  "robot_soccer/curlocs")