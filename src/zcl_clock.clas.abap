CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PRIVATE SECTION.

* add solution here
  data clock type t VALUE IS INITIAL.

ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.

  METHOD add.
* add solution here
    clock = clock + minutes * 60.
  ENDMETHOD.


  METHOD constructor.
* add solution here
    clock = hours * 3600 + minutes * 60.
  ENDMETHOD.


  METHOD get.
* add solution here
    result = |{ substring( val = clock off = 0 len = 2 ) }:{ substring( val = clock off = 2 len = 2 ) }|.
  ENDMETHOD.


  METHOD sub.
* add solution here
    clock = clock - minutes * 60.
  ENDMETHOD.
ENDCLASS.

