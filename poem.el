;;; poem.el --- Emulate latest MULE features

;; Copyright (C) 1998,1999 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <morioka@jaist.ac.jp>
;; Keywords: emulation, compatibility, Mule

;; This file is part of APEL (A Portable Emacs Library).

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'pces)
(require 'poem-e20)


;;; @ XEmacs-mule emulation
;;;

(defalias-maybe 'char-int 'identity)

(defalias-maybe 'int-char 'identity)

(defalias-maybe 'char-or-char-int-p
  (cond
   ((fboundp 'char-valid-p) 'char-valid-p)
   (t 'integerp)))

(defun-maybe char-octet (ch &optional n)
  "Return the octet numbered N (should be 0 or 1) of char CH.
N defaults to 0 if omitted. [XEmacs-mule emulating function]"
  (or (nth (if n
	       (1+ n)
	     1)
	   (split-char ch))
      0))


;;; @ end
;;;

(require 'product)
(product-provide (provide 'poem) (require 'apel-ver))

;;; poem.el ends here
