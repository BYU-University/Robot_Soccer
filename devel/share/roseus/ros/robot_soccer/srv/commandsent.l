;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::commandsent)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'commandsent (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::COMMANDSENT")
  (make-package "ROBOT_SOCCER::COMMANDSENT"))
(unless (find-package "ROBOT_SOCCER::COMMANDSENTREQUEST")
  (make-package "ROBOT_SOCCER::COMMANDSENTREQUEST"))
(unless (find-package "ROBOT_SOCCER::COMMANDSENTRESPONSE")
  (make-package "ROBOT_SOCCER::COMMANDSENTRESPONSE"))

(in-package "ROS")





(defclass robot_soccer::commandsentRequest
  :super ros::object
  :slots (_timestamp _vel_x _vel_y _omega ))

(defmethod robot_soccer::commandsentRequest
  (:init
   (&key
    ((:timestamp __timestamp) 0)
    ((:vel_x __vel_x) 0.0)
    ((:vel_y __vel_y) 0.0)
    ((:omega __omega) 0.0)
    )
   (send-super :init)
   (setq _timestamp (round __timestamp))
   (setq _vel_x (float __vel_x))
   (setq _vel_y (float __vel_y))
   (setq _omega (float __omega))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:vel_x
   (&optional __vel_x)
   (if __vel_x (setq _vel_x __vel_x)) _vel_x)
  (:vel_y
   (&optional __vel_y)
   (if __vel_y (setq _vel_y __vel_y)) _vel_y)
  (:omega
   (&optional __omega)
   (if __omega (setq _omega __omega)) _omega)
  (:serialization-length
   ()
   (+
    ;; int32 _timestamp
    4
    ;; float64 _vel_x
    8
    ;; float64 _vel_y
    8
    ;; float64 _omega
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _timestamp
       (write-long _timestamp s)
     ;; float64 _vel_x
       (sys::poke _vel_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vel_y
       (sys::poke _vel_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _omega
       (sys::poke _omega (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _timestamp
     (setq _timestamp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _vel_x
     (setq _vel_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vel_y
     (setq _vel_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _omega
     (setq _omega (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robot_soccer::commandsentResponse
  :super ros::object
  :slots ())

(defmethod robot_soccer::commandsentResponse
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

(defclass robot_soccer::commandsent
  :super ros::object
  :slots ())

(setf (get robot_soccer::commandsent :md5sum-) "2090a5a3e1241f8cc8576da8a833f62d")
(setf (get robot_soccer::commandsent :datatype-) "robot_soccer/commandsent")
(setf (get robot_soccer::commandsent :request) robot_soccer::commandsentRequest)
(setf (get robot_soccer::commandsent :response) robot_soccer::commandsentResponse)

(defmethod robot_soccer::commandsentRequest
  (:response () (instance robot_soccer::commandsentResponse :init)))

(setf (get robot_soccer::commandsentRequest :md5sum-) "2090a5a3e1241f8cc8576da8a833f62d")
(setf (get robot_soccer::commandsentRequest :datatype-) "robot_soccer/commandsentRequest")
(setf (get robot_soccer::commandsentRequest :definition-)
      "int32 timestamp
float64 vel_x
float64 vel_y
float64 omega
---

")

(setf (get robot_soccer::commandsentResponse :md5sum-) "2090a5a3e1241f8cc8576da8a833f62d")
(setf (get robot_soccer::commandsentResponse :datatype-) "robot_soccer/commandsentResponse")
(setf (get robot_soccer::commandsentResponse :definition-)
      "int32 timestamp
float64 vel_x
float64 vel_y
float64 omega
---

")



(provide :robot_soccer/commandsent "2090a5a3e1241f8cc8576da8a833f62d")


