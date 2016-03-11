;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::locations)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'locations (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::LOCATIONS")
  (make-package "ROBOT_SOCCER::LOCATIONS"))

(in-package "ROS")
;;//! \htmlinclude locations.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot_soccer::locations
  :super ros::object
  :slots (_header _home1_x _home1_y _home1_theta _ball_x _ball_y _field_width _field_height ))

(defmethod robot_soccer::locations
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:home1_x __home1_x) 0)
    ((:home1_y __home1_y) 0)
    ((:home1_theta __home1_theta) 0)
    ((:ball_x __ball_x) 0)
    ((:ball_y __ball_y) 0)
    ((:field_width __field_width) 0)
    ((:field_height __field_height) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _home1_x (round __home1_x))
   (setq _home1_y (round __home1_y))
   (setq _home1_theta (round __home1_theta))
   (setq _ball_x (round __ball_x))
   (setq _ball_y (round __ball_y))
   (setq _field_width (round __field_width))
   (setq _field_height (round __field_height))
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
  (:field_width
   (&optional __field_width)
   (if __field_width (setq _field_width __field_width)) _field_width)
  (:field_height
   (&optional __field_height)
   (if __field_height (setq _field_height __field_height)) _field_height)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _home1_x
    4
    ;; int32 _home1_y
    4
    ;; int32 _home1_theta
    4
    ;; int32 _ball_x
    4
    ;; int32 _ball_y
    4
    ;; int32 _field_width
    4
    ;; int32 _field_height
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _home1_x
       (write-long _home1_x s)
     ;; int32 _home1_y
       (write-long _home1_y s)
     ;; int32 _home1_theta
       (write-long _home1_theta s)
     ;; int32 _ball_x
       (write-long _ball_x s)
     ;; int32 _ball_y
       (write-long _ball_y s)
     ;; int32 _field_width
       (write-long _field_width s)
     ;; int32 _field_height
       (write-long _field_height s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _home1_x
     (setq _home1_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _home1_y
     (setq _home1_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _home1_theta
     (setq _home1_theta (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _ball_x
     (setq _ball_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _ball_y
     (setq _ball_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _field_width
     (setq _field_width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _field_height
     (setq _field_height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_soccer::locations :md5sum-) "48d9e5afdb93afb928ab25a7f406ab6f")
(setf (get robot_soccer::locations :datatype-) "robot_soccer/locations")
(setf (get robot_soccer::locations :definition-)
      "Header header
int32 home1_x
int32 home1_y
int32 home1_theta
int32 ball_x
int32 ball_y
int32 field_width
int32 field_height

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



(provide :robot_soccer/locations "48d9e5afdb93afb928ab25a7f406ab6f")


