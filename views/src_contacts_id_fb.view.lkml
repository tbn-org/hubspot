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
    primary_key: yes
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

  dimension: fbformsubmission {
    label: "FB Submission Form"
    type: string
    sql: ${src_contactformsubmission.formtitle} ;;
  }

  dimension: fromFB {
    label: "Likely Originated from FB"
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

  measure: days_to_donation {
    label: "Days to First Donation"
    value_format: "#,##0.0"
    type: number
    sql: avg(datediff(day,${src_contactformsubmission.submissiontime},${donor_first_transactiondate.firsttransactiondate_raw})) ;;
  }

  measure: donation_frequency {
    label: "Donation Frequency (days)"
    value_format: "#,##0"
    type: number
    sql: sum(datediff(day,${donor_first_transactiondate.firsttransactiondate_raw},CURRENT_DATE()))/sum({ft_transactions_all.lifetimecount}) ;;
  }

  measure: count {
    label: "Contact Count"
    type: count_distinct
    sql: ${TABLE}."VID" ;;
    drill_fields: []
  }
}
