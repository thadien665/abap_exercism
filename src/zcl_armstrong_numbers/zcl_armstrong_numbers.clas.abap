CLASS zcl_armstrong_numbers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS is_armstrong_number IMPORTING num           TYPE i
                                RETURNING VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_armstrong_numbers IMPLEMENTATION.
  METHOD is_armstrong_number.
    "Implement solution

    data number_of_digits type i.
    data number type string.
    data pointer type i value 0.
    data sum type i.
    number = num.
    number_of_digits = strlen( number ) - 1.


    while pointer NE number_of_digits.
        if number+pointer(1) CA '1234567890'.
            data(a) = number+pointer(1).
            sum = sum + ipow( base = a exp = number_of_digits ).
        endif.
    pointer = pointer + 1.
    endwhile.

    if num = sum.
        result = 'X'.
    else.
        result = ''.
    endif.

  ENDMETHOD.
ENDCLASS.


