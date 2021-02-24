view: src_contactlistmembers {
  sql_table_name: "HUBSPOT"."SRC_CONTACTLISTMEMBERS"
    ;;

  dimension: list_id {
    type: number
    sql: ${TABLE}."ListId" ;;
  }

  dimension_group: time_added_to_list {
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
    sql: ${TABLE}."TimeAddedToList" ;;
  }

  dimension_group: upload_timestamp {
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
    sql: ${TABLE}."UPLOAD_TIMESTAMP" ;;
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
