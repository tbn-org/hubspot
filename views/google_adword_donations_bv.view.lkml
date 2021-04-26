view: google_adword_donations_bv {
  sql_table_name: "DONOR"."GOOGLE_ADWORD_DONATIONS_BV"
    ;;

  dimension: account_id {
    type: number
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: transaction_date {
    type: date
    sql: ${TABLE}."TRANSACTION_DATE" ;;
  }

  dimension: kv_name {
    type: string
    sql: ${TABLE}."KV_NAME" ;;
  }

  dimension: kv_value {
    type: string
    sql: ${TABLE}."KV_VALUE" ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}."TRANSACTION_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [kv_name]
  }
}
