view: src_contacts_id_fb {
  view_label: "HS Contact"
  sql_table_name: "HUBSPOT"."SRC_CONTACTS_ID" ;;

  dimension: email {
    type: string
    sql: ${TABLE}."Email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."First Name" ;;
  }

  dimension: form_submissions_aggregate {
    type: string
    sql: ${TABLE}."FormSubmissionsAggregate" ;;
    hidden: yes
  }

  dimension: identity_profiles_aggregate {
    type: string
    sql: ${TABLE}."IdentityProfilesAggregate" ;;
    hidden: yes
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."Last Name" ;;
  }

  dimension: list_name {
    label: "Contact List Name"
    type: string
    sql: ${src_contactlists.name} ;;
  }

  dimension: list_memberships_aggregate {
    type: string
    sql: ${TABLE}."ListMembershipsAggregate" ;;
    hidden: yes
  }

  dimension: vid {
    label: "Contact ID"
    type: number
    value_format_name: id
    sql: ${TABLE}."VID" ;;
  }

  dimension: cellphone {
    label: "Phone Number"
    type: string
    sql: ${TABLE}."CellPhone" ;;
  }

  dimension: fbformsubmissiondate {
    label: "FB Submission Date"
    type: string
    sql: ${src_contactformsubmission.submissiontime} ;;
  }

  dimension: fromFB {
    label: "Originated from FB"
    type: yesno
    sql: case when ${src_contactformsubmission.submissiontime}<=${ft_transactions_all.first_transactiondate_dt_date} then true else false end ;;
  }

  dimension_group: submissiontime {
    label: "Submission Time"
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
    sql: ${src_contactformsubmission.submissiontime} ;;
  }

  measure: count {
    label: "Contact Count"
    type: count_distinct
    sql: ${TABLE}."VID" ;;
    drill_fields: []
  }
}
