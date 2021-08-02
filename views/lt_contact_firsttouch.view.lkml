view: lt_contact_firsttouch {
  sql_table_name: "HUBSPOT"."LT_CONTACT_FIRSTTOUCH"
    ;;

  dimension: ad {
    type: string
    sql: ${TABLE}."AD" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}."CAMPAIGN" ;;
  }

  dimension_group: firstcontactdate {
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
    sql: ${TABLE}."FIRSTCONTACTDATE" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: vid {
    type: number
    value_format_name: id
    sql: ${TABLE}."VID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
