CLASS zcl_leap DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
   PROTECTED SECTION.
ENDCLASS.

CLASS zcl_leap IMPLEMENTATION.

  METHOD leap.
* add solution here

  if year mod 100 = 0 and year mod 400 = 0.
    result = abap_true.
  elseif year mod 100 <> 0 and year mod 4 = 0.
    result = abap_true.
  else. result = abap_false.
  endif.




  ENDMETHOD.

ENDCLASS.

