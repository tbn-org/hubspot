view: contact_firstdonation_bv {
  sql_table_name: "HUBSPOT"."CONTACT_FIRSTDONATION_BV" ;;

  dimension_group: create {
    label: "Create"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATE_DATE" ;;
  }
  dimension_group: first_donation {
    label: "First Donation"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."FIRST_DONATION_DATE" ;;
  }
  dimension: vid {
    label: "VID"
    type: number
    value_format_name: id
    primary_key: yes
    sql: ${TABLE}."VID" ;;
  }
  measure: contactcount {
    type: count_distinct
    sql: ${TABLE}."VID" ;;
  }
}
