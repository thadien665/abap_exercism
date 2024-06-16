CLASS zcl_etl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_legacy_data,
        number TYPE i,
        string TYPE string,
      END OF ty_legacy_data,
      BEGIN OF ty_new_data,
        letter TYPE c LENGTH 1,
        number TYPE i,
      END OF ty_new_data,
      tty_legacy_data TYPE SORTED TABLE OF ty_legacy_data WITH UNIQUE KEY number,
      tty_new_data    TYPE SORTED TABLE OF ty_new_data WITH UNIQUE KEY letter.

    METHODS transform IMPORTING legacy_data     TYPE tty_legacy_data
                      RETURNING VALUE(new_data) TYPE tty_new_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_etl IMPLEMENTATION.
  METHOD transform.
    "Implement Solution.

     data index type i value 0.
     data letters type string value 'ABCDEFGHIJKLMNOPRSTQUWVXYZ'.
     data temporary_table type STANDARD TABLE OF ty_new_data.

        loop at legacy_data ASSIGNING FIELD-SYMBOL(<pointer>).
            while index NE strlen( <pointer>-string ).
            data(a) = <pointer>-string+index(1).
                if <pointer>-string+index(1) CA letters.
                    append VALUE #( letter = to_lower( <pointer>-string+index(1) ) number = <pointer>-number ) to temporary_table.

                endif.
                index = index + 1.
            ENDWHILE.
            index = 0.
        endloop.

        sort temporary_table ASCENDING.
        new_data = temporary_table.

  ENDMETHOD.
ENDCLASS.

