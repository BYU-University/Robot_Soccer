;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::convertedCoordinates)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'convertedCoordinates (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::CONVERTEDCOORDINATES")
  (make-package "ROBOT_SOCCER::CONVERTEDCOORDINATES"))

(in-package "ROS")
;;//! \htmlinclude convertedCoordinates.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot_soccer::convertedCoordinates
  :super ros::object
  :slots (_header _home1_x _home1_y _home1_theta _ball_x _ball_y ))

(defmethod robot_soccer::convertedCoordinates
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:home1_x __home1_x) 0.0)
    ((:home1_y __home1_y) 0.0)
    ((:home1_theta __home1_theta) 0.0)
    ((:ball_x __ball_x) 0.0)
    ((:ball_y __ball_y) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _home1_x (float __home1_x))
   (setq _home1_y (float __home1_y))
   (setq _home1_theta (float __home1_theta))
   (setq _ball_x (float __ball_x))
   (setq _ball_y (float __ball_y))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:home1_x
   (&optional __home1_x)
   (if __home1_x (setq _home1_x __home1_x)) _home1_x)
  (:home1_y
   (&optional __home1_y)
   (if __home1_y (setq _home1_y __home1_y)) _home1_y)
  (:home1_theta
   (&optional __home1_theta)
   (if __home1_theta (setq _home1_theta __home1_theta)) _home1_theta)
  (:ball_x
   (&optional __ball_x)
   (if __ball_x (setq _ball_x __ball_x)) _ball_x)
  (:ball_y
   (&optional __ball_y)
   (if __ball_y (setq _ball_y __ball_y)) _ball_y)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _home1_x
    8
    ;; float64 _home1_y
    8
    ;; float64 _home1_theta
    8
    ;; float64 _ball_x
    8
    ;; float64 _ball_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _home1_x
       (sys::poke _home1_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _home1_y
       (sys::poke _home1_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _home1_theta
       (sys::poke _home1_theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ball_x
       (sys::poke _ball_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ball_y
       (sys::poke _ball_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _home1_x
     (setq _home1_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _home1_y
     (setq _home1_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _home1_theta
     (setq _home1_theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ball_x
     (setq _ball_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ball_y
     (setq _ball_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get robot_soccer::convertedCoordinates :md5sum-) "d11bb9bc3a2bfab614d8fcc128cb2dfa")
(setf (get robot_soccer::convertedCoordinates :datatype-) "robot_soccer/convertedCoordinates")
(setf (get robot_soccer::convertedCoordinates :definition-)
      "Header header
float64 home1_x
float64 home1_y
float64 home1_theta
float64 ball_x
float64 ball_y

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :robot_soccer/convertedCoordinates "d11bb9bc3a2bfab614d8fcc128cb2dfa")


