(in-package :nothos.net/2014.12.syrie)

(def-view-class user ()
  ((name
    :type string
    :db-constraints :not-null
    :initarg :name)
   (id
    :type integer
    :db-constraints :not-null
    :initarg :id)
   (birthday
    :type string
    :db-constraints :not-null
    :initarg :name)
   (alive
    :type integer
    :initarg :alive)))
 
(create-view-from-class 'user)
 
(defun create-user (name id alive birthday)
  (update-records-from-instance (make-instance 'user
					       :name name
					       :id id
					       :alive alive
					       :birthday birthday)))
