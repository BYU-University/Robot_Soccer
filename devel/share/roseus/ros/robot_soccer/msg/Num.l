;; Auto-generated. Do not edit!


(when (boundp 'robot_soccer::Num)
  (if (not (find-package "ROBOT_SOCCER"))
    (make-package "ROBOT_SOCCER"))
  (shadow 'Num (find-package "ROBOT_SOCCER")))
(unless (find-package "ROBOT_SOCCER::NUM")
  (make-package "ROBOT_SOCCER::NUM"))

(in-package "ROS")
;;//! \htmlinclude Num.msg.html


(defclass robot_soccer::Num
  :super ros::object
  :slots (_home1_x _home1_y _home1_theta _home2_x _home2_y _home2_theta _away1_x _away1_y _away1_theta _away2_x _away2_y _away2_theta _ball_x _ball_y _t _tsys ))

(defmethod robot_soccer::Num
  (:init
   (&key
    ((:home1_x __home1_x) 0.0)
    ((:home1_y __home1_y) 0.0)
    ((:home1_theta __home1_theta) 0.0)
    ((:home2_x __home2_x) 0.0)
    ((:home2_y __home2_y) 0.0)
    ((:home2_theta __home2_theta) 0.0)
    ((:away1_x __away1_x) 0.0)
    ((:away1_y __away1_y) 0.0)
    ((:away1_theta __away1_theta) 0.0)
    ((:away2_x __away2_x) 0.0)
    ((:away2_y __away2_y) 0.0)
    ((:away2_theta __away2_theta) 0.0)
    ((:ball_x __ball_x) 0.0)
    ((:ball_y __ball_y) 0.0)
    ((:t __t) 0.0)
    ((:tsys __tsys) 0.0)
    )
   (send-super :init)
   (setq _home1_x (float __home1_x))
   (setq _home1_y (float __home1_y))
   (setq _home1_theta (float __home1_theta))
   (setq _home2_x (float __home2_x))
   (setq _home2_y (float __home2_y))
   (setq _home2_theta (float __home2_theta))
   (setq _away1_x (float __away1_x))
   (setq _away1_y (float __away1_y))
   (setq _away1_theta (float __away1_theta))
   (setq _away2_x (float __away2_x))
   (setq _away2_y (float __away2_y))
   (setq _away2_theta (float __away2_theta))
   (setq _ball_x (float __ball_x))
   (setq _ball_y (float __ball_y))
   (setq _t (float __t))
   (setq _tsys (float __tsys))
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
  (:home2_x
   (&optional __home2_x)
   (if __home2_x (setq _home2_x __home2_x)) _home2_x)
  (:home2_y
   (&optional __home2_y)
   (if __home2_y (setq _home2_y __home2_y)) _home2_y)
  (:home2_theta
   (&optional __home2_theta)
   (if __home2_theta (setq _home2_theta __home2_theta)) _home2_theta)
  (:away1_x
   (&optional __away1_x)
   (if __away1_x (setq _away1_x __away1_x)) _away1_x)
  (:away1_y
   (&optional __away1_y)
   (if __away1_y (setq _away1_y __away1_y)) _away1_y)
  (:away1_theta
   (&optional __away1_theta)
   (if __away1_theta (setq _away1_theta __away1_theta)) _away1_theta)
  (:away2_x
   (&optional __away2_x)
   (if __away2_x (setq _away2_x __away2_x)) _away2_x)
  (:away2_y
   (&optional __away2_y)
   (if __away2_y (setq _away2_y __away2_y)) _away2_y)
  (:away2_theta
   (&optional __away2_theta)
   (if __away2_theta (setq _away2_theta __away2_theta)) _away2_theta)
  (:ball_x
   (&optional __ball_x)
   (if __ball_x (setq _ball_x __ball_x)) _ball_x)
  (:ball_y
   (&optional __ball_y)
   (if __ball_y (setq _ball_y __ball_y)) _ball_y)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:tsys
   (&optional __tsys)
   (if __tsys (setq _tsys __tsys)) _tsys)
  (:serialization-length
   ()
   (+
    ;; float32 _home1_x
    4
    ;; float32 _home1_y
    4
    ;; float32 _home1_theta
    4
    ;; float32 _home2_x
    4
    ;; float32 _home2_y
    4
    ;; float32 _home2_theta
    4
    ;; float32 _away1_x
    4
    ;; float32 _away1_y
    4
    ;; float32 _away1_theta
    4
    ;; float32 _away2_x
    4
    ;; float32 _away2_y
    4
    ;; float32 _away2_theta
    4
    ;; float32 _ball_x
    4
    ;; float32 _ball_y
    4
    ;; float32 _t
    4
    ;; float32 _tsys
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _home1_x
       (sys::poke _home1_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _home1_y
       (sys::poke _home1_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _home1_theta
       (sys::poke _home1_theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _home2_x
       (sys::poke _home2_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _home2_y
       (sys::poke _home2_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _home2_theta
       (sys::poke _home2_theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _away1_x
       (sys::poke _away1_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _away1_y
       (sys::poke _away1_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _away1_theta
       (sys::poke _away1_theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _away2_x
       (sys::poke _away2_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _away2_y
       (sys::poke _away2_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _away2_theta
       (sys::poke _away2_theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ball_x
       (sys::poke _ball_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ball_y
       (sys::poke _ball_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _t
       (sys::poke _t (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tsys
       (sys::poke _tsys (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _home1_x
     (setq _home1_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _home1_y
     (setq _home1_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _home1_theta
     (setq _home1_theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _home2_x
     (setq _home2_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _home2_y
     (setq _home2_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _home2_theta
     (setq _home2_theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _away1_x
     (setq _away1_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _away1_y
     (setq _away1_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _away1_theta
     (setq _away1_theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _away2_x
     (setq _away2_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _away2_y
     (setq _away2_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _away2_theta
     (setq _away2_theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ball_x
     (setq _ball_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ball_y
     (setq _ball_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _t
     (setq _t (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tsys
     (setq _tsys (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_soccer::Num :md5sum-) "ad34ec599372090ffe818e3fe887923d")
(setf (get robot_soccer::Num :datatype-) "robot_soccer/Num")
(setf (get robot_soccer::Num :definition-)
      "float32 home1_x
float32 home1_y
float32 home1_theta
float32 home2_x
float32 home2_y
float32 home2_theta
float32 away1_x
float32 away1_y
float32 away1_theta
float32 away2_x
float32 away2_y
float32 away2_theta
float32 ball_x
float32 ball_y
float32 t
float32 tsys

")



(provide :robot_soccer/Num "ad34ec599372090ffe818e3fe887923d")


