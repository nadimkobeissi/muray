muray:
	@make -s clean
	luatex -ini latex.ini
	lualatex muray
	# bibtex muray
	lualatex muray
	lualatex muray
	@make -s clean

optimize:
	@du -hs muray.pdf
	@mv muray.pdf muray_temp.pdf
	@gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dEmbedAllFonts=true -dSubsetFonts=true -dNOPAUSE -dQUIET -dBATCH -sOutputFile=muray.pdf muray_temp.pdf
	@$(RM) muray_temp.pdf
	@du -hs muray.pdf

clean:
	@$(RM) *.aux
	@$(RM) *.bcf
	@$(RM) *.idx
	@$(RM) *.log
	@$(RM) *.out
	@$(RM) *.bbl
	@$(RM) *.blg
	@$(RM) *.xml
	@$(RM) *.toc
	@$(RM) *.fls
	@$(RM) *.fdb_latexmk
	@$(RM) *.lot
	@$(RM) *.lof
	@$(RM) *.ind
	@$(RM) *.ilg
	@$(RM) *.xdv
	@$(RM) *.fmt
	@$(RM) __latex*
	@$(RM) *synctex*
	@$(RM) *.listing

.PHONY: muray optimize clean chapters
