#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

/* doref is defined both in perl.h and nauty/nausparse.h.
   Undefining it is a quick-and-dirty fix, as something
   might be broken... */
#undef doref
#include <nauty/nausparse.h>

MODULE = Nausparse		PACKAGE = Nausparse

void
sparsenauty(sg, lab, ptn, orbits, options, OUT stats, sg2)
    sparsegraph &sg
    int * lab
    int * ptn
    int * orbits
    optionblk &options
    statsblk stats = NO_INIT
    sparsegraph &sg2
