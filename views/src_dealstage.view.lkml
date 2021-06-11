view: src_dealstage {
  sql_table_name: "HUBSPOT"."SRC_DEALSTAGE"
    ;;

  dimension: pipeline_id {
    type: string
    sql: ${TABLE}."PipelineId" ;;
  }

  dimension: pipeline_is_active {
    type: yesno
    sql: ${TABLE}."PipelineIsActive" ;;
  }

  dimension: pipeline_name {
    type: string
    sql: ${TABLE}."PipelineName" ;;
  }

  dimension: stage_closed_won {
    type: yesno
    sql: ${TABLE}."StageClosedWon" ;;
  }

  dimension: stage_display_order {
    type: number
    sql: ${TABLE}."StageDisplayOrder" ;;
  }

  dimension: stage_id {
    type: string
    sql: ${TABLE}."StageId" ;;
  }

  dimension: stage_is_active {
    type: yesno
    sql: ${TABLE}."StageIsActive" ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}."StageName" ;;
  }

  dimension: stage_probability {
    type: number
    sql: ${TABLE}."StageProbability" ;;
  }

  measure: count {
    type: count
    drill_fields: [pipeline_name, stage_name]
  }
}
