# pyjseisio SWIG interface file
# master interface file

%module pyjseisio

%{
#define SWIG_FILE_WITH_INIT
#include "../jseisIO/src/jsFileReader.h"
#include "../jseisIO/src/jsByteOrder.h"
#include "../jseisIO/src/catalogedHdrEntry.h"
using namespace jsIO;
%}


%include <std_string.i>
%include <std_vector.i>
%include <typemaps.i>
%include "numpy.i"

%init %{
import_array();
%}


# pyjseisio interface files
%include "vector_templates.i"
%include "ignore_methods.i"
%include "jsFileReader_typemaps.i"
%include "jsFileReader_pythonDefs.i"
%include "catalogedHdrEntry_typemaps.i"
%include "catalogedHdrEntry_pythonDefs.i"



%pythoncode %{

def open(filename):
    newReader = jsFileReader()
    newReader.Init(filename)
    newReader.makeHeaderDict()
    return newReader

def vectorToList(vector):
    return [vector[x] for x in xrange(vector.size())]
%}


%feature("autodoc", "1");
%include ../jseisIO/src/jsFileReader.h
%include "../jseisIO/src/catalogedHdrEntry.h"
%include "../jseisIO/src/jsByteOrder.h"



