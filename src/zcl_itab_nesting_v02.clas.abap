CLASS zcl_itab_nesting_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF artists_type,
             artist_id   TYPE string,
             artist_name TYPE string,
           END OF artists_type.
    TYPES artists TYPE STANDARD TABLE OF artists_type WITH KEY artist_id.
    TYPES: BEGIN OF albums_type,
             artist_id  TYPE string,
             album_id   TYPE string,
             album_name TYPE string,
           END OF albums_type.
    TYPES albums TYPE STANDARD TABLE OF albums_type WITH KEY artist_id album_id.
    TYPES: BEGIN OF songs_type,
             artist_id TYPE string,
             album_id  TYPE string,
             song_id   TYPE string,
             song_name TYPE string,
           END OF songs_type.
    TYPES songs TYPE STANDARD TABLE OF songs_type WITH KEY artist_id album_id song_id.


    TYPES: BEGIN OF song_nested_type,
             song_id   TYPE string,
             song_name TYPE string,
           END OF song_nested_type.
    TYPES: BEGIN OF album_song_nested_type,
             album_id   TYPE string,
             album_name TYPE string,
             songs      TYPE STANDARD TABLE OF song_nested_type WITH KEY song_id,
           END OF album_song_nested_type.
    TYPES: BEGIN OF artist_album_nested_type,
             artist_id   TYPE string,
             artist_name TYPE string,
             albums      TYPE STANDARD TABLE OF album_song_nested_type WITH KEY album_id,
           END OF artist_album_nested_type.
    TYPES nested_data TYPE STANDARD TABLE OF artist_album_nested_type WITH KEY artist_id.

    METHODS perform_nesting
      IMPORTING
        artists            TYPE artists
        albums             TYPE albums
        songs              TYPE songs
      RETURNING
        VALUE(nested_data) TYPE nested_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_itab_nesting_v02 IMPLEMENTATION.

  METHOD perform_nesting.

*data wa_albums like line of albums.
*
*loop at songs ASSIGNING FIELD-SYMBOL(<fs_song>).
*    loop at albums into wa_albums where artist_id = <fs_song>-artist_id
*                                                      and album_id = <fs_song>-album_id.
*         append value #( song_id = <fs_song>-song_id song_name = <fs_song>-song_name ) to
























loop at artists ASSIGNING FIELD-SYMBOL(<art>).
   loop at nested_data ASSIGNING FIELD-SYMBOL(<nest>) where artist_id = <art>-artist_id.
   endloop.
    if sy-subrc = 4.
   data wa_art like line of nested_data.
   wa_art-artist_id = <art>-artist_id.
   wa_art-artist_name = <art>-artist_name.
        loop at albums ASSIGNING FIELD-SYMBOL(<album>) where artist_id = <art>-artist_id.

            if <album>-artist_id = <art>-artist_id.
            append value #( album_id = <album>-album_id album_name = <album>-album_name ) to wa_art-albums.
                    endif.
        loop at nested_data assigning FIELD-SYMBOL(<nest_2>).
        data wa_ong like line of <nest_2>-albums.
        data wa_got like line of wa_ong-songs.

loop at <nest_2>-albums ASSIGNING FIELD-SYMBOL(<data>).
    loop at songs ASSIGNING FIELD-SYMBOL(<song>).
        if <nest_2>-artist_id = <song>-artist_id and <data>-album_id = <song>-album_id.
            wa_got = value #( song_id = <song>-song_id song_name = <song>-song_name ).
        endif.
        append wa_got TO wa_ong-songs.
    endloop.
endloop.
endloop.



         endloop.
    insert wa_art into TABLE nested_data.
   clear wa_art.
   elseif sy-subrc = 0.
        exit.
   endif.
endloop.





  ENDMETHOD.

ENDCLASS.

