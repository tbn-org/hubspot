view: src_contactformsubmission {
  label: "Form Submission"
  sql_table_name: "HUBSPOT"."SRC_CONTACTFORMSUBMISSION"
    ;;

  dimension: contenttype {
    label: "Content Type"
    type: string
    sql: ${TABLE}."CONTENTTYPE" ;;
  }

  dimension: conversionid {
    type: string
    sql: ${TABLE}."CONVERSIONID" ;;
    hidden: yes
  }

  dimension: formid {
    label: "Form ID"
    type: string
    sql: ${TABLE}."FORMID" ;;
  }

  dimension: formtype {
    label: "Form Type"
    type: string
    sql: ${TABLE}."FORMTYPE" ;;
  }

  dimension: pageid {
    label: "Page ID"
    type: string
    sql: ${TABLE}."PAGEID" ;;
  }

  dimension: pagetitle {
    label: "Page Title"
    type: string
    sql: ${TABLE}."PAGETITLE" ;;
  }

  dimension: pageurl {
    label: "Page URL"
    type: string
    sql: ${TABLE}."PAGEURL" ;;
  }

  dimension: portalid {
    label: "Portal ID"
    type: number
    value_format_name: id
    sql: ${TABLE}."PORTALID" ;;
  }

  dimension: submissiontime {
    label: "Submission Time"
    type: date_time
    sql: ${TABLE}."SUBMISSIONTIME" ;;
  }

  dimension: vid {
    label: "Contact ID"
    type: number
    value_format_name: id
    sql: ${TABLE}."VID" ;;
  }

  dimension: fbcamapignid {
    label: "FB Campaign ID"
    type: number
    value_format_name: id
    sql: ${TABLE}."FBCAMPAIGNID" ;;
  }

  dimension: fbadid {
    label: "FB Ad ID"
    type: number
    value_format_name: id
    sql: ${TABLE}."FBADID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
