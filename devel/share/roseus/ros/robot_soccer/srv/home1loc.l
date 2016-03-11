;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::home1loc)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'home1loc (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::HOME1LOC")
  (make-package "ROBOT_SOCCER::HOME1LOC"))
(unless (find-package "ROBOT_SOCCER::HOME1LOCREQUEST")
  (make-package "ROBOT_SOCCER::HOME1LOCREQUEST"))
(unless (find-package "ROBOT_SOCCER::HOME1LOCRESPONSE")
  (make-package "ROBOT_SOCCER::HOME1LOCRESPONSE"))

(in-package "ROS")





(defclass robot_soccer::home1locRequest
  :super ros::object
  :slots ())

(defmethod robot_soccer::home1locRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass robot_soccer::home1locResponse
  :super ros::object
  :slots (_timestamp _x _y _theta _ball_x _ball_y ))

(defmethod robot_soccer::home1locResponse
  (:init
   (&key
    ((:timestamp __timestamp) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:ball_x __ball_x) 0.0)
    ((:ball_y __ball_y) 0.0)
    )
   (send-super :init)
   (setq _timestamp (round __timestamp))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _ball_x (float __ball_x))
   (setq _ball_y (float __ball_y))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:ball_x
   (&optional __ball_x)
   (if __ball_x (setq _ball_x __ball_x)) _ball_x)
  (:ball_y
   (&optional __ball_y)
   (if __ball_y (setq _ball_y __ball_y)) _ball_y)
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp
    4
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
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
     ;; int32 _timestamp
       (write-long _timestamp s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ball_x
       (sys::poke _ball_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ball_y
       (sys::poke _ball_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _timestamp
     (setq _timestamp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ball_x
     (setq _ball_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ball_y
     (setq _ball_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robot_soccer::home1loc
  :super ros::object
  :slots ())

(setf (get robot_soccer::home1loc :md5sum-) "41a50ba430024c1e7282b7e27d56017c")
(setf (get robot_soccer::home1loc :datatype-) "robot_soccer/home1loc")
(setf (get robot_soccer::home1loc :request) robot_soccer::home1locRequest)
(setf (get robot_soccer::home1loc :response) robot_soccer::home1locResponse)

(defmethod robot_soccer::home1locRequest
  (:response () (instance robot_soccer::home1locResponse :init)))

(setf (get robot_soccer::home1locRequest :md5sum-) "41a50ba430024c1e7282b7e27d56017c")
(setf (get robot_soccer::home1locRequest :datatype-) "robot_soccer/home1locRequest")
(setf (get robot_soccer::home1locRequest :definition-)
      "---
int32 timestamp
float64 x
float64 y
float64 theta
float64 ball_x
float64 ball_y

")

(setf (get robot_soccer::home1locResponse :md5sum-) "41a50ba430024c1e7282b7e27d56017c")
(setf (get robot_soccer::home1locResponse :datatype-) "robot_soccer/home1locResponse")
(setf (get robot_soccer::home1locResponse :definition-)
      "---
int32 timestamp
float64 x
float64 y
float64 theta
float64 ball_x
float64 ball_y

")



(provide :robot_soccer/home1loc "41a50ba430024c1e7282b7e27d56017c")


