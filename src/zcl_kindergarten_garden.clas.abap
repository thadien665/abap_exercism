CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.

ENDCLASS.


CLASS zcl_kindergarten_garden IMPLEMENTATION.


  METHOD plants.
    " add solution here
    data: row1 type string,
          row2 type string,
          value type c.
  split diagram at '\n' INTO row1 row2.
  data(i) = 0.
  case student.
    when 'Alice'.
    i = 0.
    when 'Bob'.
    i = 2.
    when 'Charlie'.
    i = 4.
    when 'David'.
    i = 6.
    when 'Eve'.
    i = 8.
    when 'Fred'.
    i = 10.
    when 'Ginny'.
    i = 12.
    when 'Harriet'.
    i = 14.
    when 'Ileana'.
    i = 16.
    when 'Joseph'.
    i = 18.
    when 'Kincaid'.
    i = 20.
    when 'Larry'.
    i = 22.
  endcase.
  data(k) = i.
  do 2 times.

   value = to_lower( row1+k(1) ).
      case value.
      WHEN 'v'.
        append 'violets' to results.
      when 'c'.
        append 'clover' to results.
      when 'r'.
       append 'radishes' to results.
      when 'g'.
       append 'grass' to results.
      endcase.
    k = k + 1.
  enddo.

  data(p) = i.
  do 2 times.
   value = to_lower( row2+p(1) ).
      case value.
      WHEN 'v'.
        append 'violets' to results.
      when 'c'.
        append 'clover' to results.
      when 'r'.
       append 'radishes' to results.
      when 'g'.
       append 'grass' to results.
      endcase.
    p = p + 1.
  enddo.

  ENDMETHOD.


ENDCLASS.

