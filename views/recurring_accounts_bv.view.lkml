view: recurring_accounts_bv {
  sql_table_name: "DONOR"."RECURRING_ACCOUNTS_BV"
    ;;

  dimension: accountnumber_id {
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
