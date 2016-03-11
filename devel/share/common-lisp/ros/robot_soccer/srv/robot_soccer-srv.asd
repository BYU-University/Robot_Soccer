
(cl:in-package :asdf)

(defsystem "robot_soccer-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "predictions" :depends-on ("_package_predictions"))
    (:file "_package_predictions" :depends-on ("_package"))
    (:file "home1loc" :depends-on ("_package_home1loc"))
    (:file "_package_home1loc" :depends-on ("_package"))
    (:file "ballloc" :depends-on ("_package_ballloc"))
    (:file "_package_ballloc" :depends-on ("_package"))
    (:file "commcenter" :depends-on ("_package_commcenter"))
    (:file "_package_commcenter" :depends-on ("_package"))
    (:file "curlocs" :depends-on ("_package_curlocs"))
    (:file "_package_curlocs" :depends-on ("_package"))
    (:file "commandsent" :depends-on ("_package_commandsent"))
    (:file "_package_commandsent" :depends-on ("_package"))
  ))