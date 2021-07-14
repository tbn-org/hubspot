view: src_owners {
  sql_table_name: "HUBSPOT"."SRC_OWNERS"
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

  dimension: email {
    type: string
    sql: ${TABLE}."Email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FirstName" ;;
  }

  dimension: include_inactive {
    type: yesno
    sql: ${TABLE}."IncludeInactive" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LastName" ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}."OwnerId" ;;
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}."PortalId" ;;
  }

  dimension: remote_list_aggregate {
    type: string
    sql: ${TABLE}."RemoteListAggregate" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."Type" ;;
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
    drill_fields: [last_name, first_name]
  }
}
