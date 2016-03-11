;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::curlocs)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'curlocs (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::CURLOCS")
  (make-package "ROBOT_SOCCER::CURLOCS"))
(unless (find-package "ROBOT_SOCCER::CURLOCSREQUEST")
  (make-package "ROBOT_SOCCER::CURLOCSREQUEST"))
(unless (find-package "ROBOT_SOCCER::CURLOCSRESPONSE")
  (make-package "ROBOT_SOCCER::CURLOCSRESPONSE"))

(in-package "ROS")





(defclass robot_soccer::curlocsRequest
  :super ros::object
  :slots ())

(defmethod robot_soccer::curlocsRequest
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

(defclass robot_soccer::curlocsResponse
  :super ros::object
  :slots (_pickle ))

(defmethod robot_soccer::curlocsResponse
  (:init
   (&key
    ((:pickle __pickle) "")
    )
   (send-super :init)
   (setq _pickle (string __pickle))
   self)
  (:pickle
   (&optional __pickle)
   (if __pickle (setq _pickle __pickle)) _pickle)
  (:serialization-length
   ()
   (+
    ;; string _pickle
    4 (length _pickle)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _pickle
       (write-long (length _pickle) s) (princ _pickle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _pickle
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _pickle (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_soccer::curlocs
  :super ros::object
  :slots ())

(setf (get robot_soccer::curlocs :md5sum-) "0c8e4620cde9c3b16d1cfbdddb8c721c")
(setf (get robot_soccer::curlocs :datatype-) "robot_soccer/curlocs")
(setf (get robot_soccer::curlocs :request) robot_soccer::curlocsRequest)
(setf (get robot_soccer::curlocs :response) robot_soccer::curlocsResponse)

(defmethod robot_soccer::curlocsRequest
  (:response () (instance robot_soccer::curlocsResponse :init)))

(setf (get robot_soccer::curlocsRequest :md5sum-) "0c8e4620cde9c3b16d1cfbdddb8c721c")
(setf (get robot_soccer::curlocsRequest :datatype-) "robot_soccer/curlocsRequest")
(setf (get robot_soccer::curlocsRequest :definition-)
      "---
string pickle
")

(setf (get robot_soccer::curlocsResponse :md5sum-) "0c8e4620cde9c3b16d1cfbdddb8c721c")
(setf (get robot_soccer::curlocsResponse :datatype-) "robot_soccer/curlocsResponse")
(setf (get robot_soccer::curlocsResponse :definition-)
      "---
string pickle
")



(provide :robot_soccer/curlocs "0c8e4620cde9c3b16d1cfbdddb8c721c")


