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

  ENDMETHOD.


ENDCLASS.

