CLASS zcl_scrabble_score_v02 DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score_v02 IMPLEMENTATION.
  METHOD score.
  data: one_point type string value 'AEIOULNRST',
        two_points type string value 'DG',
        three_points type string value 'BCMP',
        four_points type string value 'FHVWY',
        five_points type string value 'K',
        eight_points type string value 'JX',
        ten_points type string value 'QZ',
        test type string VALUE is initial.

    test = to_upper( val = input ).


*    find ALL OCCURRENCES OF five_points in test ignoring case match count data(final_5).
    data(final_1) = count_any_of( val = test sub = one_point ).
    data(final_2) = count_any_of( val = test sub = two_points ).
    data(final_3) = count_any_of( val = test sub = three_points ).
    data(final_4) = count_any_of( val = test sub = four_points ).
    data(final_5) = count_any_of( val = test sub = five_points ).
    data(final_8) = count_any_of( val = test sub = eight_points ).
    data(final_10) = count_any_of( val = test sub = ten_points ).


    result = result + final_1 * 1 + final_2 * 2 + final_3 * 3 + final_4 * 4 + final_5 * 5 + final_8 * 8 + final_10 * 10.
    " add solution here
  ENDMETHOD.

ENDCLASS.

