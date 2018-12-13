# "make test" Compiles everything and runs the regression tests

.PHONY : test
test : all testall.sh
	./testall.sh

# "make all" builds the executable as well as the "printbig" library designed
# to test linking external code

.PHONY : all
all : ap_plusplus.native

# "make ap_plusplus.native" compiles the compiler
#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc

ap_plusplus.native :
	opam config exec -- \
	ocamlbuild -use-ocamlfind ap_plusplus.native

# "make clean" removes all generated files

.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff

printbig : printbig.c
	cc -o printbig -DBUILD_TEST printbig.c

# Building the tarball

TESTS = \
  helloworld

TESTFILES = $(TESTS:%=test-%.mc) $(TESTS:%=test-%.out)

TARFILES = scanner.mll parser.mly ast.ml sast.ml semant.ml codegen.ml Makefile ap_plusplus.ml testall.sh \
	_tags \
	printbig.c \
	$(TESTFILES:%=tests/%) 

ap++.tar.gz : $(TARFILES)
	cd .. && tar czf ap++/ap++.tar.gz \
		$(TARFILES:%=ap++/%)
