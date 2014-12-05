(in-package :nothos.net/2014.12.syrie)

(defparameter *db-path* "./syrie.sqlite")
(setf *default-database-type* :sqlite3)

(defun open-db ()
  (connect (list *db-path*)))

(defun make-instance-in-db (&rest args)
  (let ((obj (apply #'make-instance args)))
    (update-records-from-instance obj)
    obj))
