view: vod_signupdate_bv {
  sql_table_name: "DONOR"."VOD_SIGNUPDATE_BV" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }
  dimension: apptype {
    type: string
    sql: ${TABLE}."APPTYPE" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATED_DATE" ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
