view: rebrandly_links_bv {
  sql_table_name: "HUBSPOT"."REBRANDLY_LINKS_BV" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }
  dimension: clicks {
    type: number
    sql: ${TABLE}."CLICKS" ;;
  }
  dimension_group: createdat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."CREATEDAT" ;;
  }
  dimension: destination {
    type: string
    sql: ${TABLE}."DESTINATION" ;;
  }
  dimension: domainid {
    type: string
    sql: ${TABLE}."DOMAINID" ;;
  }
  dimension: domainname {
    type: string
    sql: ${TABLE}."DOMAINNAME" ;;
  }
  dimension_group: load_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LOAD_TIMESTAMP" ;;
  }
  dimension: shorturl {
    type: string
    sql: ${TABLE}."SHORTURL" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }
  dimension_group: updatedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."UPDATEDAT" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, domainname]
  }
}
