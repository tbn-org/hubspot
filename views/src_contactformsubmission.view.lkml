view: src_contactformsubmission {
  label: "Form Submission"
  sql_table_name: "HUBSPOT"."SINGLE_CONTACTFORMSUBMISSION_BV"
    ;;

  dimension: contenttype {
    label: "Content Type"
    type: string
    sql: ${TABLE}."CONTENTTYPE" ;;
  }

  dimension: conversionid {
    type: string
    primary_key: yes
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

  dimension: formtitle {
    label: "Form Title"
    type: string
    sql: ${TABLE}."TITLE" ;;
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

  dimension: submissiondate {
    label: "Submission Date"
    type: date
    sql: ${TABLE}."SUBMISSIONTIME" ;;
  }

  dimension_group: submissiondate1 {
    label: "Submission Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
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
