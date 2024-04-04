CLASS ZEXCERCISM_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEXCERCISM_01 IMPLEMENTATION.
  METHOD fill_itab.
    data wa like line of initial_data.
     wa-group = 'A'. wa-number = '10'. wa-description = 'Group A-2'. insert wa into table initial_data.
     wa-group = 'B'. wa-number = '5'. wa-description = 'Group B'. insert wa into table initial_data.
     wa-group = 'A'. wa-number = '6'. wa-description = 'Group A-1'. insert wa into table initial_data.
     wa-group = 'C'. wa-number = '22'. wa-description = 'Group C-1'. insert wa into table initial_data.
     wa-group = 'A'. wa-number = '13'. wa-description = 'Group A-3'. insert wa into table initial_data.
     wa-group = 'C'. wa-number = '500'. wa-description = 'Group C-2'. insert wa into table initial_data.
    "add solution here
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.
    data wa like line of initial_data.
    wa-group = 'A'. wa-number = '19'. wa-description = 'Group A-4'. append wa to updated_data.
    "add solution here
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    sort updated_data BY group ASCENDING number DESCENDING.
    "add solution here
  ENDMETHOD.

  METHOD search_itab.
    DATA(temp_data) = initial_data.
    sort temp_data by group ASCENDING number DESCENDING.
    result_index = line_index( temp_data[ number = 6 ] ).
    "add solution here
  ENDMETHOD.

ENDCLASS.

