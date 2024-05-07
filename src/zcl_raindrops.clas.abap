CLASS zcl_raindrops DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS raindrops
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE string.
   PRIVATE SECTION.
ENDCLASS.

CLASS zcl_raindrops IMPLEMENTATION.

  METHOD raindrops.
* add solution here

  if input mod 3 = 0.
    result = result && 'Pling'.
  endif.

  if input mod 5 = 0.
    result = result && 'Plang'.
  endif.

  if input mod 7 = 0.
    result = result && 'Plong'.
  endif.

  if input mod 3 <> 0 and input mod 5 <> 0 and input mod 7 <> 0.
    result = input.
  endif.
  ENDMETHOD.

ENDCLASS.

