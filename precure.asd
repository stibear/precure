#|
  This file is a part of precure project.
|#

(in-package :cl-user)
(defpackage precure-asd
  (:use :cl :asdf))
(in-package :precure-asd)

(defsystem precure
  :version "0.1"
  :author "stibear"
  :license "LLGPL"
  :depends-on (:local-time
	       :cl-syntax
	       :cl-syntax-annot)
  :components ((:module "src"
		:components
		((:file "defpackage")
		 (:module "core"
		  :components
		  ((:file "defclass")
		   (:file "data")
		   (:file "precure"
			  :depends-on ("defclass" "data")))
		  :depends-on ("defpackage")))))
  :description "Japanese amime \"PrettyCure\" library"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op precure-test))))
