view: facebook_originated_contact_bv {
  sql_table_name: "HUBSPOT"."FACEBOOK_ORIGINATED_CONTACT_BV"
    ;;

  dimension: daystodonation {
    type: number
    sql: ${TABLE}."DAYSTODONATION" ;;
  }

  dimension_group: firstdonationdate {
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
    sql: ${TABLE}."FIRSTDONATIONDATE" ;;
  }

  dimension_group: submissiontime {
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
    sql: ${TABLE}."SUBMISSIONTIME" ;;
  }

  dimension: vid {
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}."VID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
