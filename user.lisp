(in-package :nothos.net/2014.12.syrie)

(def-view-class user ()
  ((name
    :type string
    :db-constraints :not-null
    :initarg :name)
   (id
    :type string
    :db-constraints :not-null
    :initarg :id)
   (birthday
    :type string
    :db-constraints :not-null
    :initarg :birth)
   (alive
    :type integer
    :initarg :alive)))
 
(create-view-from-class 'user)
 
(defun create-user (name id alive birthday)
  (make-instance-in-db 'user :name name :id id
		       :alive alive :birthday birthday))
