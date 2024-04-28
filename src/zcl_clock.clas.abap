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
    data clock type t.
    data final_clock type string.

ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.

  METHOD add.
* add solution here
  ENDMETHOD.


  METHOD constructor.
* add solution here
   data hours_t type string.
   data minutes_t type string.
   hours_t = !hours.
   condense hours_t.
   if !hours < 10.
    hours_t = |{ 0 }{ hours_t }|.
    else. endif.
   minutes_t = !minutes.
   condense minutes_t.
   if !minutes < 10.
    minutes_t = |{ 0 }{ minutes_t }|.
    else. endif.
   data(test) = strlen( hours_t ).
    clock = replace( val = clock off = 0 len = 2 with = hours_t  ).
    clock = replace( val = clock off = 2 len = 2 with = minutes_t ).
    final_clock = |{ substring( val = clock off = 0 len = 2 ) }:{ substring( val = clock off = 2 len = 2 ) }|.

  ENDMETHOD.


  METHOD get.
* add solution here
    result = final_clock.
  ENDMETHOD.


  METHOD sub.
* add solution here
  ENDMETHOD.
ENDCLASS.

