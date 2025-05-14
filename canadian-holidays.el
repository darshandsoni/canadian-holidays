;; canadian-holidays.el - Canadian holidays for Emacs calendar

;; Author: Darshan Soni <darshan.dsoni@gmail.com>
;; URL: https://github.com/darshandsoni/canadian-holidays

;; Licence: GPL3.0

;; FIXME: bring into line with https://www.gnu.org/software/emacs/manual/html_node/elisp/Simple-Packages.html

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

cf. also the province/territory specific holidays in each of:

  `holiday-canadian--ab'
  `holiday-canadian--bc'
  `holiday-canadian--mb'
  `holiday-canadian--nb'
  `holiday-canadian--nl'
  `holiday-canadian--ns'
  `holiday-canadian--nt'
  `holiday-canadian--nu'
  `holiday-canadian--on'
  `holiday-canadian--pe'
  `holiday-canadian--qc'
  `holiday-canadian--sk'
  `holiday-canadian--yt'
")

;; https://www.canada.ca/en/revenue-agency/services/tax/public-holidays.html
;; https://canada-holidays.ca
;; https://www.timeanddate.com/holidays/canada/
;; https://www.statutoryholidays.com

;; FIXME: add primary sources into the package header block.

;; FIXME: add links to primary sources for when each holiday was first
;;   declared to be in force.

;; FIXME: add links in each of the provincial docstrings below back to
;;   holiday-canadian--federal-holidays so they all point back to the
;;   main source of info, without duplicating a long string everywhere
;;   in the source text.

(defvar holiday-canadian--bc
  '()
  "Canadian statutory holidays observed in British Columbia.")

(defvar holiday-canadian--ab
  '()
  "Canadian statutory holidays observed in Alberta.")

(defvar holiday-canadian--sk
  '()
  "Canadian statutory holidays observed in Saskatchewan.")

(defvar holiday-canadian--mb
  '((holiday-float  2  1  3 "Louis Riel Day"))
  "Canadian statutory holidays observed in Manitoba.")

(defvar holiday-canadian--on
  '((holiday-fixed 12 26 "Boxing Day"))
  "Canadian statutory holidays observed in Ontario.")

(defvar holiday-canadian--qc
  '((holiday-easter-etc 1 "Easter Monday")
    (holiday-fixed  6 24 "Fête Nationale (St. Jean Baptiste Day)"))
  "Canadian statutory holidays observed in Quebec.")

(defvar holiday-canadian--nl
  '((holiday-fixed  3 17 "St. Patrick's Day")
    (holiday-fixed  4 23 "St. George's Day")
    (holiday-fixed  6 24 "Discovery Day"))
  ;; FIXME: Orangemen's Day: what is the precise date specification?
  ;; The best I can find now is "the Monday closest to July 12".
  "Canadian statutory holidays observed in Newfoundland and Labrador.")

(defvar holiday-canadian--nb
  '()
  "Canadian statutory holidays observed in New Brunswick.")

(defvar holiday-canadian--ns
  '((holiday-float  2  1  3 "Heritage Day"))
  "Canadian statutory holidays observed in Nova Scotia.")

(defvar holiday-canadian--pe
  '((holiday-float  2  1  3 "Islander Day"))
  "Canadian statutory holidays observed in Prince Edward Island.")

(defvar holiday-canadian--yt
  '()
  "Canadian statutory holidays observed in Yukon.")

(defvar holiday-canadian--nt
  '((holiday-fixed  6 21 "National Aboriginal Day")
    (holiday-fixed  7  9 "Nunavut Day"))
  "Canadian statutory holidays observed in Northwest Territories.")

(defvar holiday-canadian--nu
  '()
  "Canadian statutory holidays observed in Nunavut.")

(seq-do
 (lambda (provhols)
   (let ((provinces (seq-filter
		     (lambda (candidate)
		       (not (string-equal "__" candidate)))
		     (car provhols)))
	 (holiday (cadr provhols)))
     (seq-do
      (lambda (province)
	(add-to-list (intern (concat "holiday-canadian--" (symbol-name province))) holiday))
      provinces)))
 '(((bc ab sk mb on __ nl nb ns pe nt nu) (holiday-easter-etc  -2 "Good Friday (Canadian statutory holiday)"))
   ((bc ab sk __ on __ __ nb __ __ __ __) (holiday-float  2  1  2 "Family Day"))
   ((bc ab sk mb on qc __ __ __ __ nt nu) (holiday-float  5  1 -1 "Victoria Day" 25))
   ((__ __ __ __ __ qc __ __ __ __ __ __) (holiday-float  5  1 -1 "National Patriotes Day" 25))
   ((bc ab sk mb on qc __ nb ns pe nt nu) (holiday-fixed  7  1    "Canada Day"))
   ((__ __ __ __ __ __ nl __ __ __ __ __) (holiday-fixed  7  1    "Memorial Day"))
   ((bc ab sk __ on __ __ nb __ __ __ nu) (holiday-float  8  1  1 "Civic Holiday"))
   ((bc ab sk mb on qc __ __ __ __ nt nu) (holiday-float 10  1  2 "Canadian Thanksgiving"))
   ((bc ab sk mb __ __ __ nb __ pe nt nu) (holiday-fixed 11 11    "Remembrance Day"))))
;; FIXME: there has to be a more idiomatic, less stringy way of
;; expressing this kind of table processing.  In particular I would
;; like to get rid of seq-do because I think that makes this very
;; simple code require emacs 25 or later, which seems unnecessary.

;; FIXME: also add a single customizable variable which can either be
;; a two-letter province/territory code or a list of such codes which
;; adds all those holidays to the calendar, to save users from having
;; to perform a bunch of list manipulation in their init file.
