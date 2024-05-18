CLASS zcl_prime_factors_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS factors
      IMPORTING
        input         TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_prime_factors_v02 IMPLEMENTATION.
  METHOD factors.
    " add solution here

    data rest type int8.
    data divisor type i value 2.
    rest = input.

    while rest <> 1.
        if rest mod divisor = 0.
            append divisor to result.
            rest = rest / divisor.
        else.
            divisor = divisor + 1.
            CONTINUE.
        endif.


    ENDWHILE.

  ENDMETHOD.


ENDCLASS.
