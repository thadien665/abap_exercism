CLASS zcl_difference_of_squares DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      ret_difference_of_squares IMPORTING num         TYPE i
                                RETURNING VALUE(diff) TYPE i,
      ret_sum_of_squares        IMPORTING num                   TYPE i
                                RETURNING VALUE(sum_of_squares) TYPE i,
      ret_square_of_sum         IMPORTING num                  TYPE i
                                RETURNING VALUE(square_of_sum) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_difference_of_squares IMPLEMENTATION.
  METHOD ret_difference_of_squares.
    "Implement solution

    diff = abs( ret_sum_of_squares( num = num ) - ret_square_of_sum( num = num ) ).

  ENDMETHOD.

  METHOD ret_sum_of_squares.
    "Implement solution

    data number type i value 1.

    do num times.
        sum_of_squares = sum_of_squares + ipow( base = number exp = 2 ).
        number = number + 1.
    enddo.



  ENDMETHOD.

  METHOD ret_square_of_sum.
    "Implement solution

    data number type i value 1.
    data summ type i.

    do num times.
        summ = summ + number.
        number = number + 1.
    enddo.

    square_of_sum = ipow( base = summ exp = 2 ).

  ENDMETHOD.
ENDCLASS.

