CREATE OR REPLACE TABLE keepcoding.ivr_detail as
select
calls.ivr_id as calls_ivr_id,
calls.phone_number as calls_phone_number,
calls.ivr_result calls_ivr_result,
calls.vdn_label as calls_vdn_label,
calls.start_date as calls_start_date,
calls.start_date_id as calls_start_date_id,
calls.end_date as  calls_end_date,
calls.end_date_id as calls_end_date_id,
calls.total_duration as calls_total_duration,
calls.customer_segment as calls_customer_segment,
calls.ivr_language as calls_ivr_language,
calls.steps_module as calls_steps_module,
calls.module_aggregation as calls_module_aggregation, 
modules.module_sequece as module_sequece,
modules.module_name as module_name,
modules.module_duration as module_duration,
modules.module_result as module_result,
steps.step_sequence as step_sequence,
steps.step_name as step_name,
steps.step_result as step_result,
steps.step_description_error as step_description_error,
steps.document_type as document_type,
steps.document_identification as document_identification,
steps.customer_phone as customer_phone,
steps.billing_account_id as billing_account_id

FROM `keepcoding.clean_ivr_calls` calls
  LEFT
  JOIN `keepcoding.clean_ivr_modules` modules
    ON  calls.ivr_id = modules.ivr_id
      LEFT
        JOIN `keepcoding.clean_ivr_steps` steps
           ON  steps.ivr_id = modules.ivr_id and
           steps.module_sequece = modules.module_sequece
    

