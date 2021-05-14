view: src_google_adwords_clicks {
  sql_table_name: "HUBSPOT"."SRC_GOOGLE_ADWORDS_CLICKS"
    ;;

  dimension: creative_id {
    type: number
    sql: ${TABLE}."CreativeId" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."Date" ;;
  }

  dimension: gcl_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."GclId" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
