;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::predictions)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'predictions (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::PREDICTIONS")
  (make-package "ROBOT_SOCCER::PREDICTIONS"))
(unless (find-package "ROBOT_SOCCER::PREDICTIONSREQUEST")
  (make-package "ROBOT_SOCCER::PREDICTIONSREQUEST"))
(unless (find-package "ROBOT_SOCCER::PREDICTIONSRESPONSE")
  (make-package "ROBOT_SOCCER::PREDICTIONSRESPONSE"))

(in-package "ROS")





(defclass robot_soccer::predictionsRequest
  :super ros::object
  :slots ())

(defmethod robot_soccer::predictionsRequest
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

(defclass robot_soccer::predictionsResponse
  :super ros::object
  :slots (_home1_x _home1_y _home1_theta _ball_x _ball_y ))

(defmethod robot_soccer::predictionsResponse
  (:init
   (&key
    ((:home1_x __home1_x) 0)
    ((:home1_y __home1_y) 0)
    ((:home1_theta __home1_theta) 0)
    ((:ball_x __ball_x) 0)
    ((:ball_y __ball_y) 0)
    )
   (send-super :init)
   (setq _home1_x (round __home1_x))
   (setq _home1_y (round __home1_y))
   (setq _home1_theta (round __home1_theta))
   (setq _ball_x (round __ball_x))
   (setq _ball_y (round __ball_y))
   self)
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
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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
   ;;
   self)
  )

(defclass robot_soccer::predictions
  :super ros::object
  :slots ())

(setf (get robot_soccer::predictions :md5sum-) "82822e65ac84105b380cffacbff834f8")
(setf (get robot_soccer::predictions :datatype-) "robot_soccer/predictions")
(setf (get robot_soccer::predictions :request) robot_soccer::predictionsRequest)
(setf (get robot_soccer::predictions :response) robot_soccer::predictionsResponse)

(defmethod robot_soccer::predictionsRequest
  (:response () (instance robot_soccer::predictionsResponse :init)))

(setf (get robot_soccer::predictionsRequest :md5sum-) "82822e65ac84105b380cffacbff834f8")
(setf (get robot_soccer::predictionsRequest :datatype-) "robot_soccer/predictionsRequest")
(setf (get robot_soccer::predictionsRequest :definition-)
      "---
int32 home1_x
int32 home1_y
int32 home1_theta
int32 ball_x
int32 ball_y

")

(setf (get robot_soccer::predictionsResponse :md5sum-) "82822e65ac84105b380cffacbff834f8")
(setf (get robot_soccer::predictionsResponse :datatype-) "robot_soccer/predictionsResponse")
(setf (get robot_soccer::predictionsResponse :definition-)
      "---
int32 home1_x
int32 home1_y
int32 home1_theta
int32 ball_x
int32 ball_y

")



(provide :robot_soccer/predictions "82822e65ac84105b380cffacbff834f8")


