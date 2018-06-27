;; canadian-holidays.el - Canadian holidays for Emacs calendar

;; Author: Darshan Soni <darshan.dsoni@gmail.com>
;; URL: https://github.com/darshandsoni/canadian-holidays

;; Licence: GPL3.0

(eval-when-compile
  (require 'calendar)
  (require 'holidays))

(defvar holiday-canadian--federal-holidays
  '((holiday-fixed 1 1 "New Years Day")
    (holiday-fixed 7 1 "Canada Day")
    (holiday-fixed 25 12 "Christmas Day")
    ;; Variable dates
    (holiday-easter-etc -1 "Good Friday")
    (holiday-float 9 1 1 "Labour Day"))
  "Federal holidays observed nationwide.")

(defvar holiday-canadian--holiday-alist
  '((family-bc-nb (holiday-float 2 1 2 "Family Day"))
    (louis-riel (holiday-float 2 1 3 "Louis Riel Day"))
    (islander (holiday-float 2 1 3 "Islander Day"))
    (heritage (holiday-float 2 1 3 "Heritage Day"))
    (st-patrick (holiday-fixed 3 17 "St Patricks Day"))
    (easter-monday (holiday-easter-etc 1 "Easter Monday"))
    (st-george (holiday-fixed 4 23 "St Georges Day"))
    ;; (victoria and patriots (holiday-float TO ADD
    (aboriginal (holiday-fixed 6 21 "National Aboriginal Day"))
    (discovery (holiday-fixed 6 24 "Discovery Day / National Holiday"))
    (canada (holiday-fixed 7 1 "Canada Day"))
    (orangemen (holiday-fixed 7 12 "Orangemens Day" ))
    (civic (holiday-float 8 1 1 "Civic Holiday"))
    (heritage (holiday-float 8 1 1 "Heritage Day"))
    ;; (
    ;; TO BE CONTINUED
