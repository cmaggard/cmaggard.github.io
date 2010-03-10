.SUFFIXES: .haml .html .css .sass
HAML = haml
SASS = sass
HAML_SRC = $(shell find . -name "*.haml")
HTML_SRC = $(HAML_SRC:.haml=.html)
SASS_SRC = $(shell find . -name "*.sass")
CSS_SRC  = $(SASS_SRC:.sass=.css)

all: $(HTML_SRC) $(CSS_SRC)
	jekyll

server: $(HTML_SRC) $(CSS_SRC)
	jekyll --server

clean:
	rm $(HTML_SRC) 
	rm $(CSS_SRC)

.haml.html:
	$(HAML) $< > $@

.sass.css:
	$(SASS) $< > $@

