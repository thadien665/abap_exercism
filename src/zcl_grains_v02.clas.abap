CLASS zcl_grains_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES type_result TYPE p LENGTH 16 DECIMALS 0.
    METHODS square
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
    METHODS total
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_grains_v02 IMPLEMENTATION.
  METHOD square.
    " add solution here
    data result_t type type_result value 1.
    if input <= 0 or input > 64.
        raise EXCEPTION type cx_parameter_invalid.
    elseif input = 1.
        result = 1.
    elseif input > 1.
        do input - 1 times.
        result_t = result_t * 2.
        enddo.
    result = result_t.
    endif.



  ENDMETHOD.

  METHOD total.
    " add solution here
    data result_n type type_result.
    data result_p type type_result.

    result_p = 1.
    result_n = result_p * 2.
    result = result_n + result_p.

    do 62 times.
    result_n = result_n * 2.
    result = result + result_n.
    enddo.

  ENDMETHOD.


ENDCLASS.

