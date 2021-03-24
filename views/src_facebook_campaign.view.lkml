view: src_facebook_campaign {
  sql_table_name: "HUBSPOT"."SRC_FACEBOOK_CAMPAIGN"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}."OBJECTIVE" ;;
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

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
