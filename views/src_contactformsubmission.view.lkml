view: src_contactformsubmission {
  label: "Form Submission"
  sql_table_name: "HUBSPOT"."SRC_CONTACTFORMSUBMISSION"
    ;;

  dimension: contenttype {
    type: string
    sql: ${TABLE}."CONTENTTYPE" ;;
  }

  dimension: conversionid {
    type: string
    sql: ${TABLE}."CONVERSIONID" ;;
  }

  dimension: formid {
    type: string
    sql: ${TABLE}."FORMID" ;;
  }

  dimension: formname {
    label: "Form Name"
    type: string
    sql: ${src_forms.name} ;;
  }

  dimension: formtype {
    type: string
    sql: ${TABLE}."FORMTYPE" ;;
  }

  dimension: pageid {
    type: string
    sql: ${TABLE}."PAGEID" ;;
  }

  dimension: pagetitle {
    type: string
    sql: ${TABLE}."PAGETITLE" ;;
  }

  dimension: pageurl {
    type: string
    sql: ${TABLE}."PAGEURL" ;;
  }

  dimension: portalid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PORTALID" ;;
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

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
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
