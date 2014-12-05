(in-package :nothos.net/2014.12.syrie)

(push (create-folder-dispatcher-and-handler "/static/" "./static/") *dispatch-table*)

(define-easy-handler (fake-registration :uri "/fake/deadbeef") (name birth)
  (make-instance-in-db 'user :id (format nil "~a" (uuid:make-v4-uuid))
		       :name name :birth birth :alive 1)
  (with-html-output-to-string (out)
    (:html
     (:head
      (:title "Bienvenue"))
     (:body
      (:div "Vous avez bien été enregistré, " (str name) ".")))))

