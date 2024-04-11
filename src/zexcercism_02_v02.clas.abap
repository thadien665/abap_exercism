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


    loop at initial_numbers ASSIGNING FIELD-SYMBOL(<fs_a>).
        if lines( aggregated_data ) > 0.
        data wa_agg like line of aggregated_data.
            loop at aggregated_data into data(temp).
             if temp-group = <fs_a>-group.
                temp-count = temp-count + 1.
                temp-sum = temp-sum + <fs_a>-number.
                temp-average = temp-sum / temp-count.
                if temp-min > <fs_a>-number.
                        temp-min = <fs_a>-number.
                   endif.
                if temp-max < <fs_a>-number.
                                temp-max = <fs_a>-number.
                   endif.
             elseif temp-group <> <fs_a>-group.
                    wa_agg-group = <fs_a>-group.
                    wa_agg-count = wa_agg-count + 1.
                    wa_agg-sum = wa_agg-sum + <fs_a>-number.
                    wa_agg-average = wa_agg-sum / wa_agg-count.
                    if wa_agg-min > <fs_a>-number.
                        wa_agg-min = <fs_a>-number.
                    endif.
                    if wa_agg-max < <fs_a>-number.
                                wa_agg-max = <fs_a>-number.
                    endif.
                    append wa_agg to aggregated_data.
              endif.
             endloop.
        else.

        data fs_c like LINE OF aggregated_data.

        fs_c-group = <fs_a>-group.
        fs_c-count = fs_c-count + 1.
        fs_c-sum = fs_c-sum + <fs_a>-number.
        fs_c-average = fs_c-sum / fs_c-count.
        fs_c-min = <fs_a>-number.
        fs_c-max = <fs_a>-number.
        append fs_c to aggregated_data.


        endif.
    endloop.

ENDMETHOD.
ENDCLASS.

