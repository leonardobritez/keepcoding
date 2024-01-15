CREATE OR REPLACE TABLE keepcoding.clean_ivr_modules AS
SELECT keepcoding.clean_integer(module_sequece) as module_sequece
     , keepcoding.fnc_cleaning_string(module_name) as module_name
	 , keepcoding.clean_integer(module_duration) as module_duration
	 ,keepcoding.fnc_cleaning_string(module_result) as module_result
  FROM `keepcoding.ivr_modules`
