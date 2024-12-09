# Variables
LATEXMK = latexmk
MAIN = main
PDFVIEWER = xdg-open
IMGDIRS = images

# Build the PDF using latexmk
pdf:
	$(LATEXMK) -pdf -shell-escape $(MAIN).tex
	bibtex $(MAIN)
	$(LATEXMK) -pdf -shell-escape $(MAIN).tex

# Clean auxiliary files
clean:
	$(LATEXMK) -c

# Clean all generated files, including the PDF
cleanall:
	$(LATEXMK) -C

# Open the PDF in the default viewer
view: pdf
	$(PDFVIEWER) $(MAIN).pdf

# Force rebuild
rebuild:
	$(LATEXMK) -pdf -shell-escape -g $(MAIN).tex

# Check for missing images
check-images:
	@for dir in $(IMGDIRS); do \
		if [ ! -d $$dir ]; then \
			echo "Warning: Directory $$dir not found!"; \
		fi; \
	done

