view: src_accountemails_hubspot {
  sql_table_name: "DONOR"."SRC_ACCOUNTEMAILS_HUBSPOT"
    ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."AccountNumber" ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}."Active" ;;
  }

  dimension: data_source {
    type: string
    sql: ${TABLE}."DataSource" ;;
  }

  dimension: Time_to_Action_donation {
    label: "Time to Action - Donate"
    type: number
    sql:to_date(${ft_transactions_all.transactiondate_dt_raw})-to_date(${src_contacts_id.create_date_raw});;
  }
  dimension: Time_to_Action_bucket_donation {
    label: "Time to Action Bucket- Donate"
    type: string
    sql:case when to_date(${ft_transactions_all.transactiondate_dt_raw})-to_date(${src_contacts_id.create_date_raw})<=30 then '0–30 Days'
             when to_date(${ft_transactions_all.transactiondate_dt_raw})-to_date(${src_contacts_id.create_date_raw})<=90 then '31–90 Days'
             when to_date(${ft_transactions_all.transactiondate_dt_raw})-to_date(${src_contacts_id.create_date_raw})<=180 then '91–180 Days'
             when to_date(${ft_transactions_all.transactiondate_dt_raw})-to_date(${src_contacts_id.create_date_raw})>180 then '180+ Days'
        end;;
  }

  dimension_group: date_last_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DateLastSynced" ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}."EmailAddress" ;;
  }

  dimension: email_type {
    type: string
    sql: ${TABLE}."EmailType" ;;
  }

  dimension: external_system {
    type: string
    sql: ${TABLE}."ExternalSystem" ;;
  }

  dimension: external_system_id {
    type: string
    sql: ${TABLE}."ExternalSystemId" ;;
  }

  dimension: functional_category {
    type: string
    sql: ${TABLE}."FunctionalCategory" ;;
  }

  dimension_group: load_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LOAD_TIMESTAMP" ;;
  }

  dimension_group: opt_out {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."OptOutDate" ;;
  }

  dimension: opt_out_indicator {
    type: yesno
    sql: ${TABLE}."OptOutIndicator" ;;
  }

  dimension: opt_out_reason_code {
    type: string
    sql: ${TABLE}."OptOutReasonCode" ;;
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}."RecordId" ;;
  }

  dimension_group: update_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UPDATE_TIMESTAMP" ;;
  }

  dimension: use_as_primary {
    type: yesno
    sql: ${TABLE}."UseAsPrimary" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
