CREATE OR REPLACE TABLE keepcoding.clean_ivr_calls AS
SELECT keepcoding.fnc_cleaning_string(phone_number) as phone_number
     , keepcoding.fnc_cleaning_string(ivr_result) as ivr_result
     , keepcoding.fnc_cleaning_string(vdn_label) as vdn_label
     , keepcoding.fnc_cleaning_timestamp(start_date) as start_date
	 , FORMAT_DATE('%Y%m%d', start_date) as start_date_id
     , keepcoding.fnc_cleaning_timestamp(end_date) as end_date
	 , FORMAT_DATE('%Y%m%d', end_date) as end_date_id
     , keepcoding.clean_integer(total_duration) as total_duration
     , keepcoding.fnc_cleaning_string(customer_segment) as customer_segment
     , keepcoding.fnc_cleaning_string(ivr_language) as ivr_language
     , keepcoding.clean_integer(steps_module) as steps_module
     , keepcoding.fnc_cleaning_string(module_aggregation) as module_aggregation
  FROM `keepcoding.ivr_calls`
