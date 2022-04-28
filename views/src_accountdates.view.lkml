view: src_accountdates {
  sql_table_name: "DONOR"."SRC_ACCOUNTDATES"
    ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."AccountNumber" ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}."Active" ;;
    hidden: yes
  }

  dimension: data_source {
    type: string
    sql: ${TABLE}."DataSource" ;;
    hidden: yes
  }

  dimension: date_type {
    type: string
    sql: ${TABLE}."DateType" ;;
    hidden: yes
  }

  dimension_group: date_value {
    label: "Created"
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
    sql: ${TABLE}."DateValue" ;;
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
    hidden: yes
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}."RecordId" ;;
    hidden: yes
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
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
