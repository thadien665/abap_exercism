CLASS zcl_hamming_v02 DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hamming_distance
      IMPORTING
        first_strand  TYPE string
        second_strand TYPE string
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
        PRIVATE SECTION.
ENDCLASS.

CLASS zcl_hamming_v02 IMPLEMENTATION.

  METHOD hamming_distance.
    " add solution here
    data index type i.
    if strlen( first_strand ) = strlen( second_strand ).
        do strlen( first_strand ) times.
            if first_strand+index(1) <> second_strand+index(1).
                result = result + 1.
                index = index + 1.
                else.
                index = index + 1.
            endif.

        enddo.
     else.
     raise EXCEPTION type cx_parameter_invalid.
     endif.



  ENDMETHOD.

ENDCLASS.

