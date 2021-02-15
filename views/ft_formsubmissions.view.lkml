view: ft_formsubmissions {
  label: "Form Submission"
  sql_table_name: "HUBSPOT"."FT_FORMSUBMISSIONS"
    ;;

  dimension: address_cd {
    label: "Address"
    type: string
    sql: ${TABLE}."ADDRESS_CD" ;;
  }

  dimension: city_cd {
    label: "City"
    type: string
    sql: ${TABLE}."CITY_CD" ;;
  }

  dimension: email_cd {
    label: "Email"
    type: string
    sql: ${TABLE}."EMAIL_CD" ;;
  }

  dimension: firstname_cd {
    label: "First Name"
    type: string
    sql: ${TABLE}."FIRSTNAME_CD" ;;
  }

  dimension: formname_cd {
    label: "Form Name"
    type: string
    sql: ${TABLE}."FORMNAME_CD" ;;
  }

  dimension: lastname_cd {
    label: "Last Name"
    type: string
    sql: ${TABLE}."LASTNAME_CD" ;;
  }

  dimension: mobilephone_cd {
    label: "Mobile Phone"
    type: string
    sql: ${TABLE}."MOBILEPHONE_CD" ;;
  }

  dimension: ronumber_cd {
    label: "MRO"
    type: string
    sql: ${TABLE}."RONUMBER_CD" ;;
  }

  dimension: state_cd {
    label: "State"
    type: string
    sql: ${TABLE}."STATE_CD" ;;
  }

  dimension: country_cd {
    label: "Country"
    type: string
    sql: case when ${TABLE}."PASSVALIDATION" then 'USA' else '' END;;
  }

  dimension_group: submission_timestamp {
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
    sql: ${TABLE}."SUBMISSION_TIMESTAMP" ;;
  }

  dimension: zip_cd {
    label: "Zip Code"
    type: string
    sql: ${TABLE}."ZIP_CD" ;;
  }

  dimension: vid {
    label: "Contact ID"
    type: string
    sql: ${TABLE}."VID" ;;
  }

  dimension: smsconscent {
    label: "SMS Conscent"
    type: string
    sql: case when ${TABLE}."SMSCONSCENT"='t' then 'Yes'
              when ${TABLE}."SMSCONSCENT"='f' then 'No'
              else 'N/A' end;;
  }

  measure: count {
    label: "Submission Count"
    type: count
    drill_fields: []
  }
}
