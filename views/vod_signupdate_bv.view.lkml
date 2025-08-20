view: vod_signupdate_bv {
  sql_table_name: "DONOR"."VOD_SIGNUPDATE_BV" ;;
  drill_fields: [id]

  dimension: id {
    label: "Okta ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }
  dimension: apptype {
    label: "Subscription Type"
    type: string
    sql: ${TABLE}."APPTYPE" ;;
  }
  dimension_group: created {
    label: "Created Date"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATED_DATE" ;;
  }
  dimension: email {
    label: "Email"
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
