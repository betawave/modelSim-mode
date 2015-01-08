(require 'vhdl-mode)
(require 'comint)

(defvar *vsim-process-buffer* nil
  "Buffer used for communication with vsim subprocess")

;;; setup communication with vsim
(defun vsim-create-buffer ()
  (setq *vsim-process-buffer* (apply 'make-comint "vsim" "vsim" nil '())) 
  ;;; might need to add some switches to trigger batch_mode
  (delete-other-windows)
  (switch-to-buffer-other-window *spim-process-buffer*)
  (other-window -1)) 

(defun vsim-send-command (command)
  (comint-send-string (get-buffer-process *vsim-process-buffer*) command))

;;; create/modify emacs internal-mode
(defun vsim-mode ()
  (interactive)
  (vhdl-mode)
  (setq mode-name "VHDL+ModelSim")
  (use-local-map (nconc (make-sparse-keymap) asm-mode-map)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.vhd$" . vsim-mode))

(provide 'vsim-mode)


(message "EOF")