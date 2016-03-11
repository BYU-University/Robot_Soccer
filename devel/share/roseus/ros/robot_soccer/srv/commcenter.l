;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::commcenter)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'commcenter (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::COMMCENTER")
  (make-package "ROBOT_SOCCER::COMMCENTER"))
(unless (find-package "ROBOT_SOCCER::COMMCENTERREQUEST")
  (make-package "ROBOT_SOCCER::COMMCENTERREQUEST"))
(unless (find-package "ROBOT_SOCCER::COMMCENTERRESPONSE")
  (make-package "ROBOT_SOCCER::COMMCENTERRESPONSE"))

(in-package "ROS")





(defclass robot_soccer::commcenterRequest
  :super ros::object
  :slots (_comm ))

(defmethod robot_soccer::commcenterRequest
  (:init
   (&key
    ((:comm __comm) 0)
    )
   (send-super :init)
   (setq _comm (round __comm))
   self)
  (:comm
   (&optional __comm)
   (if __comm (setq _comm __comm)) _comm)
  (:serialization-length
   ()
   (+
    ;; int32 _comm
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _comm
       (write-long _comm s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _comm
     (setq _comm (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_soccer::commcenterResponse
  :super ros::object
  :slots ())

(defmethod robot_soccer::commcenterResponse
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

(defclass robot_soccer::commcenter
  :super ros::object
  :slots ())

(setf (get robot_soccer::commcenter :md5sum-) "f20d8de9800e6b15bcaa4586b124e5e2")
(setf (get robot_soccer::commcenter :datatype-) "robot_soccer/commcenter")
(setf (get robot_soccer::commcenter :request) robot_soccer::commcenterRequest)
(setf (get robot_soccer::commcenter :response) robot_soccer::commcenterResponse)

(defmethod robot_soccer::commcenterRequest
  (:response () (instance robot_soccer::commcenterResponse :init)))

(setf (get robot_soccer::commcenterRequest :md5sum-) "f20d8de9800e6b15bcaa4586b124e5e2")
(setf (get robot_soccer::commcenterRequest :datatype-) "robot_soccer/commcenterRequest")
(setf (get robot_soccer::commcenterRequest :definition-)
      "int32 comm
---

")

(setf (get robot_soccer::commcenterResponse :md5sum-) "f20d8de9800e6b15bcaa4586b124e5e2")
(setf (get robot_soccer::commcenterResponse :datatype-) "robot_soccer/commcenterResponse")
(setf (get robot_soccer::commcenterResponse :definition-)
      "int32 comm
---

")



(provide :robot_soccer/commcenter "f20d8de9800e6b15bcaa4586b124e5e2")


