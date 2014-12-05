(in-package :nothos.net/2014.12.syrie)


(def-view-class place ()
  ((id :type integer
       :db-constraints :not-null
       :initarg :id)
   (name :type string
	 :db-constraints :not-null
	 :initarg :name)
   (latitude :type float
	     :initarg :latitude)
   (longitude :type float
	      :initarg :longitude)
   (typeplace :type string
	      :initarg :typeplace)))

(create-view-from-class 'place)

(defun insert-place (name typeplace &optional latitude longitude)
  (make-instance-in-db 'place
		       :id 1 ;TODO
		       :name name
		       :latitude latitude
		       :longitude longitude
		       :typeplace typeplace))


#| Tables for departures and arrivals |#

(def-view-class travelFrom ()
  ((id :type integer
       :db-constraints :not-null
       :initarg :id)
   (date :type integer
	 :initarg :date)
   (placefromid :type integer)
   (placefrom
    :accessor access-placetravelFrom
    :db-kind :join
    :db-info (:join-class place
			  :home-key placefromid
			  :foreign-key id
			  :set nil))
   (placetoid :type integer)
   (placeto
    :accessor access-placetravelTo
    :db-kind :join
    :db-info (:join-class place
			  :home-key placetoid
			  :foreign-key id
			  :set nil))
   (personid :type integer)
   (person
    :accessor travelFrom-person
    :db-kind :join
    :db-info (:join-class user
			  :home-key personid
			  :foreign-key id
			  :set nil))))

(def-view-class travelTo ()
  ((id :type integer
       :db-constraints :not-null
       :initarg :id)
   (date :type date
	 :db-constraints :not-null
	 :initarg :date)
   (placeFromid :type integer)
   (placeFrom :accessor access-placeFrom
	      :db-kind :join
	      :db-info (:join-class place
				    :home-key placeFromid
				    :foreign-key id
				    :set nil))
   (placeToid :type integer)
   (placeTo :accessor access-placeTo
	    :db-kind :join
	    :db-info (:join-class place
				  :home-key placeToid
				  :foreign-key id
				  :set nil))
   (personid :type integer)
   (person 
    :accessor person-travelTo
    :db-kind :join
    :db-info (:join-class user
			  :home-key p
			  :foreign-key id
			  :set nil))))

(create-view-from-class 'travelFrom)
(create-view-from-class 'travelTo)

(defun insert-departure (date placeFrom person  &optional placeTo)
  (make-instance-in-db 'travelTo
		       :id 1 ;TODO
		       :date date
		       :placefromid placeFrom
		       :personid person
		       :placetoid placeTo))


(defun insert-arrival (date placeFrom person  &optional  placeTo)
  (make-instance-in-db 'travelFrom
		       :id 1 ;TODO
		       :date date
		       :placefromid placeFrom
		       :personid person
		       :placetoid placeTo))
