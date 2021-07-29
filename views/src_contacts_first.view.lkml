view: src_contacts_first {
  sql_table_name: "HUBSPOT"."SRC_CONTACTS_FIRST"
    ;;

  dimension: first_conversion {
    type: string
    sql: ${TABLE}."First Conversion" ;;
  }

  dimension: first_page_seen {
    type: string
    sql: ${TABLE}."First Page Seen" ;;
  }

  dimension: first_referring_site {
    type: string
    sql: ${TABLE}."First Referring Site" ;;
  }

  dimension: first_touch_converting_campaign {
    type: string
    sql: ${TABLE}."First Touch Converting Campaign" ;;
  }

  dimension: last_page_seen {
    type: string
    sql: ${TABLE}."Last Page Seen" ;;
  }

  dimension: last_referring_site {
    type: string
    sql: ${TABLE}."Last Referring Site" ;;
  }

  dimension: last_touch_converting_campaign {
    type: string
    sql: ${TABLE}."Last Touch Converting Campaign" ;;
  }

  dimension_group: time_first_seen {
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
    sql: ${TABLE}."Time First Seen" ;;
  }

  dimension_group: time_last_seen {
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
    sql: ${TABLE}."Time Last Seen" ;;
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
