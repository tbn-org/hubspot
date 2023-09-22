view: src_wkt_customers {
  sql_table_name:  "TBN_DATA_DEV"."VOD"."SRC_WKT_CUSTOMERS"
    ;;

  dimension: customerid {
    type: string
    primary_key: yes
    sql: ${TABLE}."customerid" ;;
  }

  dimension: emailhashmd5 {
    type: string
    sql: ${TABLE}."emailhashmd5" ;;
  }

  dimension: emailhashsha2 {
    type: string
    sql: ${TABLE}."emailhashsha2" ;;
  }

  dimension_group: load_timestamp {
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
    sql: ${TABLE}."load_timestamp" ;;
  }

  dimension_group: registrationdate {
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
    sql: ${TABLE}."registrationdate" ;;
  }

  dimension_group: update_timestamp {
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
    sql: ${TABLE}."update_timestamp" ;;
  }

  measure: count {
    label: "Customer Count"
    type: count
    drill_fields: [customerid,registrationdate_date]
  }
}
