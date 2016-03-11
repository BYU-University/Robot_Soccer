; Auto-generated. Do not edit!


(cl:in-package robot_soccer-srv)


;//! \htmlinclude predictions-request.msg.html

(cl:defclass <predictions-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass predictions-request (<predictions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <predictions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'predictions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<predictions-request> is deprecated: use robot_soccer-srv:predictions-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <predictions-request>) ostream)
  "Serializes a message object of type '<predictions-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <predictions-request>) istream)
  "Deserializes a message object of type '<predictions-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<predictions-request>)))
  "Returns string type for a service object of type '<predictions-request>"
  "robot_soccer/predictionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'predictions-request)))
  "Returns string type for a service object of type 'predictions-request"
  "robot_soccer/predictionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<predictions-request>)))
  "Returns md5sum for a message object of type '<predictions-request>"
  "82822e65ac84105b380cffacbff834f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'predictions-request)))
  "Returns md5sum for a message object of type 'predictions-request"
  "82822e65ac84105b380cffacbff834f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<predictions-request>)))
  "Returns full string definition for message of type '<predictions-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'predictions-request)))
  "Returns full string definition for message of type 'predictions-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <predictions-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <predictions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'predictions-request
))
;//! \htmlinclude predictions-response.msg.html

(cl:defclass <predictions-response> (roslisp-msg-protocol:ros-message)
  ((home1_x
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
    :initform 0))
)

(cl:defclass predictions-response (<predictions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <predictions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'predictions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-srv:<predictions-response> is deprecated: use robot_soccer-srv:predictions-response instead.")))

(cl:ensure-generic-function 'home1_x-val :lambda-list '(m))
(cl:defmethod home1_x-val ((m <predictions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:home1_x-val is deprecated.  Use robot_soccer-srv:home1_x instead.")
  (home1_x m))

(cl:ensure-generic-function 'home1_y-val :lambda-list '(m))
(cl:defmethod home1_y-val ((m <predictions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:home1_y-val is deprecated.  Use robot_soccer-srv:home1_y instead.")
  (home1_y m))

(cl:ensure-generic-function 'home1_theta-val :lambda-list '(m))
(cl:defmethod home1_theta-val ((m <predictions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:home1_theta-val is deprecated.  Use robot_soccer-srv:home1_theta instead.")
  (home1_theta m))

(cl:ensure-generic-function 'ball_x-val :lambda-list '(m))
(cl:defmethod ball_x-val ((m <predictions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:ball_x-val is deprecated.  Use robot_soccer-srv:ball_x instead.")
  (ball_x m))

(cl:ensure-generic-function 'ball_y-val :lambda-list '(m))
(cl:defmethod ball_y-val ((m <predictions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-srv:ball_y-val is deprecated.  Use robot_soccer-srv:ball_y instead.")
  (ball_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <predictions-response>) ostream)
  "Serializes a message object of type '<predictions-response>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <predictions-response>) istream)
  "Deserializes a message object of type '<predictions-response>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<predictions-response>)))
  "Returns string type for a service object of type '<predictions-response>"
  "robot_soccer/predictionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'predictions-response)))
  "Returns string type for a service object of type 'predictions-response"
  "robot_soccer/predictionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<predictions-response>)))
  "Returns md5sum for a message object of type '<predictions-response>"
  "82822e65ac84105b380cffacbff834f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'predictions-response)))
  "Returns md5sum for a message object of type 'predictions-response"
  "82822e65ac84105b380cffacbff834f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<predictions-response>)))
  "Returns full string definition for message of type '<predictions-response>"
  (cl:format cl:nil "int32 home1_x~%int32 home1_y~%int32 home1_theta~%int32 ball_x~%int32 ball_y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'predictions-response)))
  "Returns full string definition for message of type 'predictions-response"
  (cl:format cl:nil "int32 home1_x~%int32 home1_y~%int32 home1_theta~%int32 ball_x~%int32 ball_y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <predictions-response>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <predictions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'predictions-response
    (cl:cons ':home1_x (home1_x msg))
    (cl:cons ':home1_y (home1_y msg))
    (cl:cons ':home1_theta (home1_theta msg))
    (cl:cons ':ball_x (ball_x msg))
    (cl:cons ':ball_y (ball_y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'predictions)))
  'predictions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'predictions)))
  'predictions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'predictions)))
  "Returns string type for a service object of type '<predictions>"
  "robot_soccer/predictions")