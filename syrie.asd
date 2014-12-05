(defpackage :nothos.net/2014.12.syrie-system
  (:use :common-lisp :asdf))

(in-package :nothos.net/2014.12.syrie-system)

(defsystem "syrie"
  :description ""
  :version "0.1"
  :author "We GROKLC"
  :licence "MIT"
  :depends-on ("cl-who" "hunchentoot" "hu.dwim.stefil" "clsql-sqlite3")
  :components ((:file "package")
	       (:file "db")
	       (:file "user"))
  :serial t)
