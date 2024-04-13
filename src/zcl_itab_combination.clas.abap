CLASS zcl_itab_combination DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF alphatab_type,
             cola TYPE string,
             colb TYPE string,
             colc TYPE string,
           END OF alphatab_type.
    TYPES alphas TYPE STANDARD TABLE OF alphatab_type.

    TYPES: BEGIN OF numtab_type,
             col1 TYPE string,
             col2 TYPE string,
             col3 TYPE string,
           END OF numtab_type.
    TYPES nums TYPE STANDARD TABLE OF numtab_type.

    TYPES: BEGIN OF combined_data_type,
             colx TYPE string,
             coly TYPE string,
             colz TYPE string,
           END OF combined_data_type.
    TYPES combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

    METHODS perform_combination
      IMPORTING
        alphas             TYPE alphas
        nums               TYPE nums
      RETURNING
        VALUE(combined_data) TYPE combined_data.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_itab_combination IMPLEMENTATION.

  METHOD perform_combination.


data wa like line of combined_data.

loop at alphas ASSIGNING FIELD-SYMBOL(<p_1>).
    data(l_i) = sy-tabix.
     read table nums INDEX l_i  ASSIGNING FIELD-SYMBOL(<p_2>).

    wa-colx = <p_1>-cola && <p_2>-col1.
    wa-coly = <p_1>-colb && <p_2>-col2.
    wa-colz = <p_1>-colc && <p_2>-col3.
    append wa to combined_data.

endloop.
  ENDMETHOD.

ENDCLASS.

