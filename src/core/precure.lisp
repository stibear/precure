(in-package :precure)

(cl-syntax:use-syntax :annot)

@export
(defgeneric transform (girl &key destination)
  (:documentation "girl transforms into precure."))

(defmethod update-instance-for-different-class :before ((old girl)
							(new transformed-girl)
							&key)
  (with-slots (name precure-name prologue) old
     (setf (slot-value new 'name) (car precure-name)
	   (slot-value new 'human-name) name
	   (slot-value new 'other-precure-name) (cdr precure-name)))
  (setf (slot-value new 'transformed) t))

(defmethod update-instance-for-different-class :before ((old transformed-girl)
							(new girl)
							&key)
  (with-slots (name human-name prologue other-precure-name) old
     (setf (slot-value new 'name) human-name
	   (slot-value new 'precure-name) (append other-precure-name (list name))))
  (setf (slot-value new 'transformed) nil))

(defmethod transform ((girl girl) &key (destination t))
  (declare (ignorable destination))
  (change-class girl 'transformed-girl))

(defmethod transform :after ((girl girl) &key (destination t))
  (format destination "~A~%" (prologue girl)))

(defmethod transform ((girl transformed-girl) &key (destination t))
  (declare (ignorable destination))
  (with-slots (count name other-precure-name) girl
     (if (= count (list-length other-precure-name))
	 (change-class girl 'girl)
	 (progn (incf count)
		(let ((tmp name))
		  (setf name (pop other-precure-name)
			other-precure-name (append other-precure-name (list tmp))))
		girl))))

(defmethod transform ((girl first-girl) &key (destination t))
  (declare (ignorable destination))
  (if (slot-boundp girl 'partner)
      (prog1 (change-class girl 'transformed-first-girl)
	     (change-class (slot-value girl 'partner)
			   'transformed-first-girl))
      (error "~S has no partner." girl)))

(defmethod transform ((girl transformed-first-girl) &key (destination t))
  (declare (ignorable destination))
  (prog1 (change-class girl 'first-girl)
	 (change-class (slot-value girl 'partner) 'first-girl)))

(defun add-precure (key title term-list)
  (setf (gethash key *precure-table*)
	(make-instance 'precure
	   :title title
	   :key key
	   :term (mapcar #'local-time:parse-timestring term-list)
	   :now (local-time:timestamp<
		 (local-time:parse-timestring (car term-list))
		 (local-time:now)
		 (local-time:parse-timestring (cadr term-list))))))

(defun add-girls (key name p-name prologue)
  (push (make-instance 'girl
	   :name name
	   :precure-name p-name
	   :prologue prologue)
	(slot-value (gethash key *precure-table*) 'girls)))

(defun add-first-girls (key name p-name prologue)
  (push (make-instance 'first-girl
	   :name name
	   :precure-name p-name
	   :prologue prologue)
	(slot-value (gethash key *precure-table*) 'girls)))

@export
(defun init ()
  (declare (optimize (debug 3)))
  (mapc (lambda (args) (apply #'add-precure args)) *precures*)

  (mapc (lambda (args) (apply #'add-first-girls args)) *first-girls*)
  (mapc (lambda (args) (apply #'add-girls args)) *girls*)
  
  (with-slots (girls) (gethash "" *precure-table*)
     (let ((nagisa (car girls))
	   (honoka (cadr girls)))
       (setf (slot-value nagisa 'partner) honoka)
       (setf (slot-value honoka 'partner) nagisa))

     (with-slots ((mh-girls girls)) (gethash "maxheart" *precure-table*)
	(setf mh-girls (append mh-girls girls))))

  (with-slots ((gogo-girls girls)) (gethash "gogo" *precure-table*)
     (setf gogo-girls
	   (append gogo-girls
		   (slot-value (gethash "yes" *precure-table*) 'girls))))

  (maphash (lambda (key value)
	     (declare (ignorable key))
	     (setf (slot-value value 'girls)
		   (reverse (girls value))))
	   *precure-table*))

@export
(defun current (&optional (hash-table *precure-table*))
  (let ((tmp))
    (maphash (lambda (key value)
	       (when (slot-value value 'now) (setf tmp key)))
	     hash-table)
    tmp))

@export
(defun onairp (precure date-string)
  (let ((term (term precure)))
    (local-time:timestamp<
     (car term)
     (local-time:parse-timestring date-string)
     (cadr term))))

@export
(defun (setf precure) (key &optional (hash-table *precure-table*))
  (gethash key hash-table))

@export
(defun all-stars (&optional (hash-table *precure-table*))
  (let (tmp)
    (maphash (lambda (key value)
	       (setf tmp (nconc (girls value) tmp)))
	     hash-table)
    tmp))
