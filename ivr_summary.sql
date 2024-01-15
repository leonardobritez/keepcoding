CREATE OR REPLACE TABLE keepcoding.ivr_summary as
select  
calls_ivr_id as ivr_id
,calls_phone_number as phone_number
,calls_ivr_result as ivr_result
, CASE WHEN STARTS_WITH(calls_vdn_label, 'ATC') THEN 'FRONT'
      WHEN STARTS_WITH(calls_vdn_label, 'TECH') THEN 'TECH'
      WHEN STARTS_WITH(calls_vdn_label, 'ABSORPTION') THEN 'ABSORPTION'
           ELSE 'RESTO'
        END as vnd_aggregation
,calls_start_date as start_date
,calls_end_date as end_date
,calls_total_duration as total_duration
,calls_customer_segment as customent_segment
,calls_ivr_language as ivr_languaje
,calls_steps_module as steps_module
,calls_module_aggregation as module_aggregation
,document_type as docuement_type
,document_identification as document_identification
,customer_phone as customer_phone
,billing_account_id as billing_account_id
,IF(module_name = 'AVERIA_MASIVA',1,0) as masiva_lg
,IF(step_name = 'CUSTOMERINFOBYPHONE.TX' and step_description_error = 'UNKNOWN' ,1,0) as info_by_phone_lg
,IF(step_name = 'CUSTOMERINFOBYDNI.TX' and step_description_error = 'UNKNOWN' ,1,0) as info_by_dni_lg
,IF(DATETIME_DIFF(CURRENT_DATETIME('Europe/Madrid'), calls_end_date,  DAY) < 1, 1, 0) as repeated_phone_24H
,IF(DATETIME_DIFF(CURRENT_DATETIME('Europe/Madrid'), calls_end_date,  DAY) > 1, 1, 0) as cause_recall_phone_24H

from keepcoding.ivr_detail as details 