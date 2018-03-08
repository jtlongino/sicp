Exercise 1.7. The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers.

An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?


(define (my-good-enough? guess old-guess)
 (> 0.00000000000001 (/ (abs(- guess old-guess)) old-guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (my-sqrt-iter guess old-guess x)
  (if (my-good-enough? guess old-guess x)
      guess
      (my-sqrt-iter (improve guess x) guess x)))
(define (my-sqrt x)
  (my-sqrt-iter 1.0 1.1 x)
)
