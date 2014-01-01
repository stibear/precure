#|
  This file is a part of precure project.
|#

(in-package :cl-user)
(defpackage precure-test-asd
  (:use :cl :asdf))
(in-package :precure-test-asd)

(defsystem precure-test
  :author ""
  :license ""
  :depends-on (:precure
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "precure"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
