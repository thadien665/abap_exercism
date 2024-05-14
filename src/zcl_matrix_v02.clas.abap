CLASS zcl_matrix_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS matrix_row
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
    METHODS matrix_column
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_matrix_v02 IMPLEMENTATION.
  METHOD matrix_row.
    " add solution here

    split string at '\n' into table data(segments).

    split segments[ index ] at ` ` into table data(int_rows).

    loop at int_rows ASSIGNING FIELD-SYMBOL(<a>).
        append <a> to result.
    endloop.


  ENDMETHOD.

  METHOD matrix_column.
    " add solution here

    split string at '\n' into table data(segments).

    loop at segments ASSIGNING FIELD-SYMBOL(<b>).

        split <b> at ' ' into table data(int_cols).
        append int_cols[ index ] to result.


    endloop.


  ENDMETHOD.
ENDCLASS.

