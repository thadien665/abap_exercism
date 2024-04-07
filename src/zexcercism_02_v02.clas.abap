CLASS zexcercism_02_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zexcercism_02_v02 IMPLEMENTATION.

  METHOD perform_aggregation.
  data i_initial_numbers type initial_numbers.
  i_initial_numbers = Value #(
    ( group = 'A' number = 10 )
    ( group = 'B' number = 5 )
    ( group = 'A' number = 6 )
    ( group = 'C' number = 22 )
    ( group = 'A' number = 13 )
    ( group = 'C' number = 500 )
    ).

   data: a_numbers type table of i,
         b_numbers type table of i,
         c_numbers type table of i.
   data wa_a_numbers like line of a_numbers.

   data number_wa like line of i_initial_numbers.
   loop at i_initial_numbers into number_wa.
        if number_wa-group = 'A'.
        aggregated_data[ 1 ]-group = 'A'.
        aggregated_data[ 1 ]-count += 1.
        append number_wa-number to a_numbers.
        elseif number_wa-group = 'B'.
        aggregated_data[ 2 ]-group = 'B'.
        aggregated_data[ 2 ]-count += 1.
        append number_wa-number to b_numbers.
        else.
        aggregated_data[ 3 ]-group = 'C'.
        aggregated_data[ 3 ]-count += 1.
        append number_wa-number to c_numbers.
        endif.
   endloop.

   loop at a_numbers ASSIGNING field-symbol(<el_for_sum>).
        aggregated_data[ 1 ]-sum += <el_for_sum>.
   endloop.
   aggregated_data[ 1 ]-average = aggregated_data[ 1 ]-sum / lines( a_numbers ).

   sort a_numbers ASCENDING.
   aggregated_data[ 1 ]-min = a_numbers[ 1 ].
   aggregated_data[ 1 ]-max = a_numbers[ lines( a_numbers ) ].

   sort b_numbers ASCENDING.
   aggregated_data[ 2 ]-min = b_numbers[ 1 ].
   aggregated_data[ 2 ]-max = b_numbers[ lines( b_numbers ) ].

   sort c_numbers ASCENDING.
   aggregated_data[ 3 ]-min = c_numbers[ 1 ].
   aggregated_data[ 3 ]-max = c_numbers[ lines( c_numbers ) ].
      " add solution here
    ENDMETHOD.

ENDCLASS.

