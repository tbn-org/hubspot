view: vb_formsubmission_bv {
  sql_table_name: "HUBSPOT"."VB_FORMSUBMISSION_BV" ;;

  dimension: vid {
    label: "Vision Bible Submission VID"
    type: number
    value_format_name: id
    sql: ${TABLE}."VID" ;;
    primary_key: yes
  }
  measure: count {
    type: count
  }
}
