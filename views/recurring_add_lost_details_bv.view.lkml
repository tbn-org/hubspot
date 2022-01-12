view: recurring_add_lost_details_bv {
  sql_table_name: "DONOR"."RECURRING_ADD_LOST_DETAILS_BV"
    ;;

  dimension: accountnumber_id {
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  dimension: amount_amt {
    type: number
    sql: ${TABLE}."AMOUNT_AMT" ;;
  }

  dimension: category_cd {
    type: string
    sql: ${TABLE}."CATEGORY_CD" ;;
  }

  dimension: measure_cd {
    type: string
    sql: ${TABLE}."MEASURE_CD" ;;
  }

  dimension: month_cd {
    type: number
    sql: ${TABLE}."MONTH_CD" ;;
  }

  dimension: value_num {
    type: number
    sql: ${TABLE}."VALUE_NUM" ;;
  }

  dimension: year_cd {
    type: number
    sql: ${TABLE}."YEAR_CD" ;;
  }

  dimension_group: year_month {
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
    sql: ${TABLE}."YEAR_MONTH_DATE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
