CLASS zcl_resistor_color_v02 DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS resistor_color
      IMPORTING
        color_code   TYPE string
      RETURNING
        VALUE(value) TYPE i.
   PROTECTED SECTION.
ENDCLASS.

CLASS zcl_resistor_color_v02 IMPLEMENTATION.

  METHOD resistor_color.
* add solution here
    types: begin of color_table,
           color_name type string,
           res type i,
           end of color_table.
    data table_1 type table of color_table.
    table_1 = value #( ( color_name = 'black' res = 0 )
                     ( color_name = 'brown' res = 1 )
                     ( color_name = 'red' res = 2 )
                     ( color_name = 'orange' res = 3 )
                     ( color_name = 'yellow' res = 4 )
                     ( color_name = 'green' res = 5 )
                     ( color_name = 'blue' res = 6 )
                     ( color_name = 'violet' res = 7 )
                     ( color_name = 'grey' res = 8 )
                     ( color_name = 'white' res = 9 ) ).

    loop at table_1 ASSIGNING FIELD-SYMBOL(<tb>).
        if <tb>-color_name = color_code.
           value = <tb>-res.
           else.
           CONTINUE.
        endif.
    endloop.


  ENDMETHOD.

ENDCLASS.

