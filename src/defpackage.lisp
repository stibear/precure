(in-package :cl-user)
(defpackage #:precure
  (:use :cl))
(in-package :precure)

(cl-syntax:use-syntax :annot)

@export
(defvar *precure-table* (make-hash-table :test #'equal))

