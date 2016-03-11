;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::velocities)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'velocities (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::VELOCITIES")
  (make-package "ROBOT_SOCCER::VELOCITIES"))

(in-package "ROS")
;;//! \htmlinclude velocities.msg.html


(defclass robot_soccer::velocities
  :super ros::object
  :slots (_wheel1 _wheel2 _wheel3 ))

(defmethod robot_soccer::velocities
  (:init
   (&key
    ((:wheel1 __wheel1) 0.0)
    ((:wheel2 __wheel2) 0.0)
    ((:wheel3 __wheel3) 0.0)
    )
   (send-super :init)
   (setq _wheel1 (float __wheel1))
   (setq _wheel2 (float __wheel2))
   (setq _wheel3 (float __wheel3))
   self)
  (:wheel1
   (&optional __wheel1)
   (if __wheel1 (setq _wheel1 __wheel1)) _wheel1)
  (:wheel2
   (&optional __wheel2)
   (if __wheel2 (setq _wheel2 __wheel2)) _wheel2)
  (:wheel3
   (&optional __wheel3)
   (if __wheel3 (setq _wheel3 __wheel3)) _wheel3)
  (:serialization-length
   ()
   (+
    ;; float32 _wheel1
    4
    ;; float32 _wheel2
    4
    ;; float32 _wheel3
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _wheel1
       (sys::poke _wheel1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wheel2
       (sys::poke _wheel2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wheel3
       (sys::poke _wheel3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _wheel1
     (setq _wheel1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wheel2
     (setq _wheel2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wheel3
     (setq _wheel3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_soccer::velocities :md5sum-) "3bf8a374f335f8b6c15a5fc63f832467")
(setf (get robot_soccer::velocities :datatype-) "robot_soccer/velocities")
(setf (get robot_soccer::velocities :definition-)
      "#Header header
float32 wheel1
float32 wheel2
float32 wheel3

")



(provide :robot_soccer/velocities "3bf8a374f335f8b6c15a5fc63f832467")


