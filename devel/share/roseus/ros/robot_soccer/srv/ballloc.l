;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::ballloc)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'ballloc (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::BALLLOC")
  (make-package "ROBOT_SOCCER::BALLLOC"))
(unless (find-package "ROBOT_SOCCER::BALLLOCREQUEST")
  (make-package "ROBOT_SOCCER::BALLLOCREQUEST"))
(unless (find-package "ROBOT_SOCCER::BALLLOCRESPONSE")
  (make-package "ROBOT_SOCCER::BALLLOCRESPONSE"))

(in-package "ROS")





(defclass robot_soccer::balllocRequest
  :super ros::object
  :slots ())

(defmethod robot_soccer::balllocRequest
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

(defclass robot_soccer::balllocResponse
  :super ros::object
  :slots (_timestamp _x _y ))

(defmethod robot_soccer::balllocResponse
  (:init
   (&key
    ((:timestamp __timestamp) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _timestamp (round __timestamp))
   (setq _x (float __x))
   (setq _y (float __y))
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
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp
    4
    ;; float64 _x
    8
    ;; float64 _y
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
   ;;
   self)
  )

(defclass robot_soccer::ballloc
  :super ros::object
  :slots ())

(setf (get robot_soccer::ballloc :md5sum-) "bfeed3c65524b12e19690fcc175741f8")
(setf (get robot_soccer::ballloc :datatype-) "robot_soccer/ballloc")
(setf (get robot_soccer::ballloc :request) robot_soccer::balllocRequest)
(setf (get robot_soccer::ballloc :response) robot_soccer::balllocResponse)

(defmethod robot_soccer::balllocRequest
  (:response () (instance robot_soccer::balllocResponse :init)))

(setf (get robot_soccer::balllocRequest :md5sum-) "bfeed3c65524b12e19690fcc175741f8")
(setf (get robot_soccer::balllocRequest :datatype-) "robot_soccer/balllocRequest")
(setf (get robot_soccer::balllocRequest :definition-)
      "---
int32 timestamp
float64 x
float64 y


")

(setf (get robot_soccer::balllocResponse :md5sum-) "bfeed3c65524b12e19690fcc175741f8")
(setf (get robot_soccer::balllocResponse :datatype-) "robot_soccer/balllocResponse")
(setf (get robot_soccer::balllocResponse :definition-)
      "---
int32 timestamp
float64 x
float64 y


")



(provide :robot_soccer/ballloc "bfeed3c65524b12e19690fcc175741f8")


