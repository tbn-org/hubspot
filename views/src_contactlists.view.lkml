view: src_contactlists {
  sql_table_name: "HUBSPOT"."SRC_CONTACTLISTS"
    ;;

  dimension_group: created {
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
    sql: ${TABLE}."CreatedAt" ;;
  }

  dimension: extra_url_parameters {
    type: string
    sql: ${TABLE}."ExtraUrlParameters" ;;
  }

  dimension: filters_aggregate {
    type: string
    sql: ${TABLE}."FiltersAggregate" ;;
  }

  dimension: internal_list_id {
    type: number
    sql: ${TABLE}."InternalListId" ;;
  }

  dimension: is_dynamic {
    type: yesno
    sql: ${TABLE}."IsDynamic" ;;
  }

  dimension_group: last_processing_state_change {
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
    sql: ${TABLE}."LastProcessingStateChangeAt" ;;
  }

  dimension_group: last_size_change {
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
    sql: ${TABLE}."LastSizeChangeAt" ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}."ListId" ;;
  }

  dimension: list_size {
    type: number
    sql: ${TABLE}."ListSize" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: processing_state {
    type: string
    sql: ${TABLE}."ProcessingState" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."UpdatedAt" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
