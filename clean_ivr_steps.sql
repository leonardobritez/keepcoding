CREATE OR REPLACE TABLE keepcoding.clean_ivr_steps AS
SELECT keepcoding.clean_integer(step_sequence) as step_sequence
     , keepcoding.fnc_cleaning_string(step_name) as step_name
	 , keepcoding.fnc_cleaning_string(step_result) as step_result
	 , keepcoding.fnc_cleaning_string(step_description_error) as step_description_error
	 , keepcoding.fnc_cleaning_string(document_type) as document_type
	 , keepcoding.fnc_cleaning_string(document_identification) as document_identification
	 , keepcoding.fnc_cleaning_string(customer_phone) as customer_phone
	 , keepcoding.fnc_cleaning_string(billing_account_id) as billing_account_id
  FROM `keepcoding.ivr_steps`
