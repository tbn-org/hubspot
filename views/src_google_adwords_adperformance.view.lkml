view: src_google_adwords_adperformance {
  label: "Google Adwords Ad"
  sql_table_name: "HUBSPOT"."GOOGLE_ADWORDS_ADPERFORMANCE_BV"
    ;;
  drill_fields: [id]

  dimension: id {
    label: "Ad ID"
    type: number
    sql: ${TABLE}."Id" ;;
  }

  dimension: prim_key {
    type: string
    primary_key: yes
    sql: ${TABLE}."Id"||${date_date} ;;
    hidden: yes
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}."AdGroupId" ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}."AdGroupName" ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}."AdType" ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."CampaignName" ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}."Clicks" ;;
  }

  measure: cost {
    value_format: "$#,##0.0"
    type: sum
    sql: ${TABLE}."Cost" ;;
  }

  measure: cpc {
    label: "CPC"
    type: number
    value_format: "#.000"
    sql: div0(${cost},${clicks}) ;;
  }

  measure: cpm {
    label: "CPM"
    type: number
    value_format: "#.000"
    sql: div0(${cost},${impressions}) ;;
  }

  measure: roi {
    label: "ROI"
    type: number
    value_format: "#.0%"
    sql: div0(${donation_amount}, ${cost}) ;;
  }

  dimension_group: date {
    label: "Ad Ran "
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."Date" ;;
  }

  dimension: addate {
    label: "Ad Date"
    type: string
    sql: ${TABLE}."Date" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."Description" ;;
  }

  dimension: headline_part1 {
    type: string
    sql: ${TABLE}."HeadlinePart1" ;;
  }

  dimension: headline_part2 {
    type: string
    sql: ${TABLE}."HeadlinePart2" ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}."Impressions" ;;
  }

  measure: donation_amount {
    label: "Donation Amount"
    type: sum
    sql: ${TABLE}."DONATION_AMOUNT" ;;
    drill_fields: [accountnumber_id,documentnumber_id,amount_amt,transactiondate_dt,txncategory_cd,sourcecode_cd]
  }

  measure: donation_count {
    label: "Donation Count"
    type: sum
    sql: ${TABLE}."DONATION_COUNT" ;;
    drill_fields: [accountnumber_id,documentnumber_id,amount_amt,transactiondate_dt,txncategory_cd,sourcecode_cd]
  }

  measure: contactcount {
    label: "Contact Count"
    type: sum
    sql: ${TABLE}."CONTACTCOUNT" ;;
    drill_fields: [vid,first_name,last_name,email,gcl_id]
  }

  measure: clickconversion {
    label: "Conversion %"
    type: number
    value_format: "#.0%"
    sql: ${contactcount}/${clicks} ;;
    drill_fields: [vid,first_name,last_name,email,gcl_id]
  }

  dimension: email {
    type: string
    sql: ${src_contacts_id_google.email} ;;
    hidden: yes
  }

  dimension: first_name {
    type: string
    sql: ${src_contacts_id_google.first_name} ;;
    hidden: yes
  }

  dimension: last_name {
    type: string
    sql: ${src_contacts_id_google.last_name} ;;
    hidden: yes
  }

  dimension: vid {
    label: "Contact ID"
    type: number
    value_format_name: id
    sql: ${src_contacts_id_google.vid} ;;
    hidden: yes
  }

  dimension: cellphone {
    label: "Phone Number"
    type: string
    sql: ${src_contacts_id_google.cellphone} ;;
    hidden: yes
  }

  dimension: gcl_id {
    type: string
    sql: ${src_contacts_id_google.gcl_id} ;;
    hidden: yes
  }

  dimension: accountnumber_id {
    label: "SE Account Number"
    type: number
    sql: ${ft_transactions_google.accountnumber_id} ;;
    hidden: yes
  }

  dimension: amount_amt {
    value_format: "$#,##0"
    label: "Donation Amount"
    type: number
    sql: ${ft_transactions_google.amount_amt} ;;
    hidden: yes
  }

  dimension: documentnumber_id {
    label: "Document Number"
    type: number
    sql: ${ft_transactions_google.documentnumber_id} ;;
    hidden: yes
  }

  dimension: txncategory_cd {
    label: "TXN Category"
    type: string
    sql: ${ft_transactions_google.txncategory_cd} ;;
    hidden: yes
  }

  dimension: sourcecode_cd {
    label: "Souce Code"
    type: string
    sql: ${ft_transactions_google.sourcecode_cd} ;;
    hidden: yes
  }

  dimension: transactiondate_dt {
    label: "Donation Date"
    type: date
    sql: ${ft_transactions_google.transactiondate_dt_raw} ;;
    hidden: yes
  }
}
