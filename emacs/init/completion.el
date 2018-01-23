;; (use-package company-flx)
;; (use-package company-racer)

;; http://qiita.com/sune2/items/b73037f9e85962f5afb7
(use-package company
  :ensure t
  :init
  (setq company-auto-complete nil
        company-idle-delay 0
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-dabbrev-downcase nil)
  :config
  (global-company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . nil)
        ("C-n" . 'company-select-next)
        ("C-p" . 'company-select-previous)))

(use-package company-statistics
  :ensure t
  :init
  (setq company-transformers '(company-sort-by-statistics company-sort-by-backend-importance))
  :config
  ;; 候補のソート順
  (add-hook 'after-init-hook 'company-statistics-mode)
  (company-statistics-mode))