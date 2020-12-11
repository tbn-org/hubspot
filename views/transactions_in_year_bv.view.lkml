view: transactions_in_year_bv {
  sql_table_name: "DONOR"."TRANSACTIONS_IN_YEAR_BV"
    ;;

  dimension: accountnumber_id {
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  dimension: transactionamount {
    type: number
    sql: ${TABLE}."TRANSACTIONAMOUNT" ;;
  }

  dimension: transactioncount {
    type: number
    sql: ${TABLE}."TRANSACTIONCOUNT" ;;
  }

  dimension: transactionyear {
    type: number
    sql: ${TABLE}."TRANSACTIONYEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
