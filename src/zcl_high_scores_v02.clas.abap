CLASS zcl_high_scores_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zcl_high_scores_v02 IMPLEMENTATION.

  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.
    " add solution here
    result = scores_list.
  ENDMETHOD.

  METHOD latest.
    " add solution here
    result = scores_list[ lines( scores_list ) ].
  ENDMETHOD.

  METHOD personalbest.
    " add solution here
    if scores_list[ 1 ] > scores_list[ lines( scores_list ) ].
        result = scores_list[ 1 ].
        else.
        result = scores_list[ lines( scores_list ) ].
        endif.
    loop at scores_list assigning FIELD-SYMBOL(<pb>).
        if <pb> > result.
            result = <pb>.
            else.
              continue.
         endif.
     endloop.
  ENDMETHOD.

  METHOD personaltopthree.
    " add solution here
    DATA: top_atm      TYPE i,
          index_atm    TYPE i,
          top_atm_indx TYPE i.
    index_atm = lines( scores_list ).
    LOOP AT scores_list ASSIGNING FIELD-SYMBOL(<abc>).
      WHILE lines( scores_list ) >= 1 AND lines( result ) < 3.
        LOOP AT scores_list ASSIGNING FIELD-SYMBOL(<test>).
          IF lines( scores_list ) > 1.
            LOOP AT scores_list ASSIGNING FIELD-SYMBOL(<max>).
              IF lines( result ) = 3.
                EXIT.
              ELSE.
                top_atm = scores_list[ index_atm ].
                top_atm_indx = index_atm.
                LOOP AT scores_list ASSIGNING FIELD-SYMBOL(<pb>).
                  IF sy-tabix >= 1.
                    IF <pb> < top_atm.
                      CONTINUE.
                    ELSE.
                      top_atm = <pb>.
                      top_atm_indx = sy-tabix.
                    ENDIF.
                  ENDIF.
                ENDLOOP.
                APPEND top_atm TO result.
                DELETE scores_list INDEX top_atm_indx.
                CLEAR: top_atm,
                       top_atm_indx.
                index_atm = lines( scores_list ).

              ENDIF.
            ENDLOOP.

          ELSEIF lines( scores_list ) = 1 AND lines( result ) < 3.
            APPEND scores_list[ 1 ] TO result.
            DELETE scores_list INDEX 1.
          ENDIF.
        ENDLOOP.
      ENDWHILE.
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.

