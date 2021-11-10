view: daily_spend_allsources_bv {
  sql_table_name: "HUBSPOT"."DAILY_SPEND_ALLSOURCES_BV"
    ;;

  dimension: prim_key {
    type: string
    primary_key: yes
    sql: ${TABLE}."SOURCE"||${TABLE}."RANDATE" ;;
    hidden: yes
  }

  dimension_group: randate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RANDATE" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  measure: contactcount {
    type: sum
    sql: ${TABLE}."CONTACTCOUNT" ;;
  }

  measure: spend {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."SPEND" ;;
  }
  measure: cpl {
    type: number
    value_format: "$#,##0"
    sql: div0(${spend},${contactcount}) ;;
  }
}
