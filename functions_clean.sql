CREATE OR REPLACE FUNCTION keepcoding.fnc_chk_length_string(p_string STRING) RETURNS STRING AS
(( SELECT CASE WHEN LENGTH(p_string)=0 THEN 'UNKNOWN' ELSE p_string END ))


CREATE OR REPLACE FUNCTION keepcoding.fnc_cleaning_string(p_string STRING) RETURNS STRING AS
((SELECT CASE
              WHEN REGEXP_CONTAINS(UPPER(TRIM(p_string)), r"[ÀÁÂÄÅÈÉÊËÌÍÎÏÒÓÔÖØÙÚÛÜ]") 
              THEN IFNULL( REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE( 
                           UPPER(TRIM( keepcoding.fnc_chk_length_string(p_string))) 
                         , r"[ÙÚÛÜ]", 'U'), r"[ÒÓÔÖØ]", 'O'), r"[ÌÍÎÏ]", 'I'), r"[ÈÉÊË]", 'E'), r"[ÀÁÂÄÅ]", 'A'),'UNKNOWN')
              WHEN UPPER(TRIM(keepcoding.fnc_chk_length_string(p_string))) = '?' THEN 'UNKNOWN'
              ELSE IFNULL(UPPER(TRIM(keepcoding.fnc_chk_length_string(p_string))),'UNKNOWN')
            END ))

CREATE OR REPLACE FUNCTION keepcoding.fnc_cleaning_timestamp(p_timestamp TIMESTAMP) RETURNS DATETIME AS
(( SELECT DATETIME(IFNULL(p_timestamp, '9999-12-31'), 'Europe/Madrid') ))

CREATE OR REPLACE FUNCTION keepcoding.clean_integer(p_value int64) RETURNS INT64 AS
(IFNULL(p_value,-999999))