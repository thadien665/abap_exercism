CLASS zcl_darts DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        x             TYPE f
        y             TYPE f
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_darts IMPLEMENTATION.
  METHOD score.
    " add solution here
    data(shot) = sqrt( x * x + y * y ).

    if shot > 10.
        result = 0.
    elseif shot = 10 or shot > 5.
        result = 1.
    elseif shot = 5 or shot > 1.
        result = 5.
    elseif shot <= 1.
        result = 10.
    endif.



  ENDMETHOD.


ENDCLASS.

