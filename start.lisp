(in-package :cl-user)



#| workaround for the UFFI part of clsql-sqlite3 not loading properly
   (but seems to be working fine with this, though)
 |#
(ql:quickload "cffi-uffi-compat")
(handler-bind
    ((asdf:operation-error (lambda (c) (invoke-restart 'asdf:accept))))
  (ql:quickload "clsql-sqlite3"))


(ql:quickload "syrie")

(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 9999))
