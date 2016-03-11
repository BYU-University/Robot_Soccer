; Auto-generated. Do not edit!


(cl:in-package robot_soccer-msg)


;//! \htmlinclude velocities.msg.html

(cl:defclass <velocities> (roslisp-msg-protocol:ros-message)
  ((wheel1
    :reader wheel1
    :initarg :wheel1
    :type cl:float
    :initform 0.0)
   (wheel2
    :reader wheel2
    :initarg :wheel2
    :type cl:float
    :initform 0.0)
   (wheel3
    :reader wheel3
    :initarg :wheel3
    :type cl:float
    :initform 0.0))
)

(cl:defclass velocities (<velocities>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <velocities>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'velocities)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_soccer-msg:<velocities> is deprecated: use robot_soccer-msg:velocities instead.")))

(cl:ensure-generic-function 'wheel1-val :lambda-list '(m))
(cl:defmethod wheel1-val ((m <velocities>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:wheel1-val is deprecated.  Use robot_soccer-msg:wheel1 instead.")
  (wheel1 m))

(cl:ensure-generic-function 'wheel2-val :lambda-list '(m))
(cl:defmethod wheel2-val ((m <velocities>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:wheel2-val is deprecated.  Use robot_soccer-msg:wheel2 instead.")
  (wheel2 m))

(cl:ensure-generic-function 'wheel3-val :lambda-list '(m))
(cl:defmethod wheel3-val ((m <velocities>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_soccer-msg:wheel3-val is deprecated.  Use robot_soccer-msg:wheel3 instead.")
  (wheel3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <velocities>) ostream)
  "Serializes a message object of type '<velocities>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wheel1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wheel2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wheel3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <velocities>) istream)
  "Deserializes a message object of type '<velocities>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheel3) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<velocities>)))
  "Returns string type for a message object of type '<velocities>"
  "robot_soccer/velocities")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'velocities)))
  "Returns string type for a message object of type 'velocities"
  "robot_soccer/velocities")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<velocities>)))
  "Returns md5sum for a message object of type '<velocities>"
  "3bf8a374f335f8b6c15a5fc63f832467")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'velocities)))
  "Returns md5sum for a message object of type 'velocities"
  "3bf8a374f335f8b6c15a5fc63f832467")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<velocities>)))
  "Returns full string definition for message of type '<velocities>"
  (cl:format cl:nil "#Header header~%float32 wheel1~%float32 wheel2~%float32 wheel3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'velocities)))
  "Returns full string definition for message of type 'velocities"
  (cl:format cl:nil "#Header header~%float32 wheel1~%float32 wheel2~%float32 wheel3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <velocities>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <velocities>))
  "Converts a ROS message object to a list"
  (cl:list 'velocities
    (cl:cons ':wheel1 (wheel1 msg))
    (cl:cons ':wheel2 (wheel2 msg))
    (cl:cons ':wheel3 (wheel3 msg))
))
