;;; @queue.el --- queue prototype written in @

(require '@)

(defvar @queue (@extend :head nil :tail nil)
  "A queue, restricted to appending to the back and retrieving from the front.
This prototype can be mixed with @stack for pushing onto the front.")

(def@ @queue :emptyp ()
  "Return t if this queue is empty."
  (null @:head))

(def@ @queue :enqueue (element)
  "Add ELEMENT to the end of this queue. Return this queue."
  (prog1 @@
      (if (@:emptyp)
          (setf @:head (list element)
                @:tail @:head)
        (setf (cdr @:tail) (list element)
              @:tail (cdr @:tail)))))

(def@ @queue :dequeue ()
  "Remove and return element at the front of this queue."
  (pop @:head))

(def@ @queue :peek ()
  "Return the element at the front of the queue without returning it."
  (car @:head))

(def@ @queue :to-list ()
  "Return this entire queue as a list."
  (copy-list @:head))

(provide '@queue)

;;; @queue.el ends here
