view: src_facebook_adaction {
  sql_table_name: "HUBSPOT"."SRC_FACEBOOK_ADACTION"
    ;;

  dimension: action_type {
    type: string
    sql: ${TABLE}."ActionType" ;;
  }

  dimension: action_value {
    type: string
    sql: ${TABLE}."ActionValue" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
