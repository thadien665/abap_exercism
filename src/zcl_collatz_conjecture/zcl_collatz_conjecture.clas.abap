CLASS zcl_collatz_conjecture DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS ret_steps IMPORTING num          TYPE i
                      RETURNING VALUE(steps) TYPE i
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_collatz_conjecture IMPLEMENTATION.
  METHOD ret_steps.
    "Implement Solution

    data(number) = num.

    if number > 0.
        while number NE 1.
            if number mod 2 = 0.
                number = number / 2.
                steps = steps + 1.
            else.
                number = 3 * number + 1.
                steps = steps + 1.
            endif.
        ENDWHILE.
    else.
        RAISE EXCEPTION type cx_parameter_invalid.
    endif.



  ENDMETHOD.
ENDCLASS.

