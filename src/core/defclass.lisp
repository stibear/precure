(in-package :precure)

(defclass precure ()
  ((title :type 'string
	  :reader title
	  :initarg :title)
   (key :type 'string
	:accessor key
	:initarg :key)
   (broadcast-term :type 'list
		   :reader term
		   :initarg :term)
   (girls :type 'list
	  :reader girls
	  :initarg :girls
	  :initform nil)
   (now :type 'boolean
	:reader now
	:initarg :now)))

(defclass girl ()
  ((name :type 'string
	 :reader name
	 :initarg :name)
   (precure-name :type 'list
		 :initarg :precure-name)
   (transformed :type 'boolean
		:initform nil
		:reader transformed)
   (prologue :type 'string
	     :initarg :prologue)))

(defclass first-girl (girl)
  ((partner :type 'first-girl
	    :reader partner
	    :initarg :partner)))

(defclass transformed-girl ()
  ((name :type 'string
	 :reader name
	 :initarg :name)
   (human-name :type 'string
	       :initarg :human-name)
   (other-precure-name :type 'list
		       :initarg :other-name)
   (transformed :type 'boolean
		:initform t
		:reader transformed)
   (count :type 'integer
	  :initform 0)
   (prologue :type 'string
	     :reader prologue
	     :initarg :prologue)))

(defclass transformed-first-girl (transformed-girl)
  ((partner :type 'transformed-first-girl
	    :reader partner
	    :initarg :partner)))

(set-pprint-dispatch
 'precure
 (lambda (s p)
   (format s "#<~S ~S>" (type-of p) (title p))))

(set-pprint-dispatch
 'girl
 (lambda (s g)
   (format s "#<~S ~S>" (type-of g) (name g))))

(set-pprint-dispatch
 'transformed-girl
 (lambda (s g)
   (format s "#<~S ~S>" (type-of g) (name g))))
