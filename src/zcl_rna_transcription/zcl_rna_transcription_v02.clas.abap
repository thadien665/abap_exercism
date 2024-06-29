CLASS zcl_rna_transcription_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS
      transcribe
        IMPORTING
          strand             TYPE string
        RETURNING
          VALUE(result)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_rna_transcription_v02 IMPLEMENTATION.

  METHOD transcribe.
    "Implement solution

    data index_in_strand type i value 0.

    while index_in_strand NE strlen( strand ).
        case strand+index_in_strand(1).
            when 'G'.
                result = result && 'C'.
            when 'C'.
                result = result && 'G'.
            when 'T'.
                result = result && 'A'.
            when 'A'.
                result = result && 'U'.
        endcase.
        index_in_strand += 1.
    endwhile.

  ENDMETHOD.

ENDCLASS.

