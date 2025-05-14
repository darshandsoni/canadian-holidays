;; canadian-holidays.el - Canadian holidays for Emacs calendar

;; Author: Darshan Soni <darshan.dsoni@gmail.com>
;; URL: https://github.com/darshandsoni/canadian-holidays

;; Licence: GPL3.0

(eval-when-compile
  (require 'calendar)
  (require 'holidays))

(defvar holiday-canadian--federal-holidays
  '((holiday-fixed  1  1   "New Years Day")
    (holiday-fixed  9 30   "National Day for Truth and Reconciliation")
    (holiday-fixed 25 12   "Christmas Day")
    ;; Variable dates
    (holiday-float  9  1 1 "Labour Day"))
  "Canadian federal holidays observed nationwide.

Holidays are expressed with the syntax described by the documentation for
`calendar-holidays', and can be made to appear in the emacs calendar by
adding this list to `holiday-local-holidays' or `holiday-other-holidays'.

If the goal is to make these holidays appear in your org-mode agenda view
please consult the documentation for `org-agenda-include-diary' (it should
be set to `t') and also the Info node `(org)Weekly/daily agenda'.

(NB. if you try to use the %%(org-calendar-holiday) form in an org-mode
file to display holidays with the performance bump it promises, it seems
that some `holiday-float' entries like Victoria Day will not appear, for
reasons I do not currently understand.)

")

;; https://www.canada.ca/en/revenue-agency/services/tax/public-holidays.html
;; https://canada-holidays.ca
;; https://www.timeanddate.com/holidays/canada/
;; https://www.statutoryholidays.com
