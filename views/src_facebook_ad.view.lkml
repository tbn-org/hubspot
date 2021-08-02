view: src_facebook_ad {
  label: "Facebook Ad"
  sql_table_name: "HUBSPOT"."SRC_FACEBOOK_AD"
    ;;
  drill_fields: [id]

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}."ID" , ' ', ${src_facebook_adinsight.date_start_raw}) ;;
  }

  dimension: id {
    label: "Ad ID"
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: ad_set_id {
    type: string
    sql: ${TABLE}."AdSetId" ;;
  }

  dimension: ad_status {
    type: string
    sql: ${TABLE}."AdStatus" ;;
  }

  dimension: bid_info {
    type: string
    sql: ${TABLE}."BidInfo" ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}."BidType" ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: campaign_name {
    label: "Campaign Name"
    type: string
    sql: ${src_facebook_campaign.name} ;;
  }

  dimension: configured_status {
    type: string
    sql: ${TABLE}."ConfiguredStatus" ;;
  }

  dimension: conversion_specs {
    type: string
    sql: ${TABLE}."ConversionSpecs" ;;
  }

  dimension_group: created {
    type: time
    label: "Created"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CreatedTime" ;;
  }

  dimension_group: date_start {
    type: time
    label: "Ran"
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
    sql:${src_facebook_adinsight.date_start_raw} ;;
  }

  dimension_group: date_end {
    type: time
    label: "End"
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
    hidden: yes
    sql: ${src_facebook_adinsight.date_end_raw}  ;;
  }

  dimension: failed_delivery_checks {
    type: string
    sql: ${TABLE}."FailedDeliveryChecks" ;;
  }

  dimension: name {
    label: "Ad Name"
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: recommendations {
    type: string
    sql: ${TABLE}."Recommendations" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."UpdatedTime" ;;
  }

  dimension: buying_type {
    type: string
    sql: ${src_facebook_adinsight.buying_type} ;;
  }

  measure: clicks {
    type: sum
    sql: ${src_facebook_adinsight.clicks} ;;
  }

  dimension: conversion_rate_ranking {
    type: string
    sql: ${src_facebook_adinsight.conversion_rate_ranking} ;;
  }

  measure: cost_per_estimated_ad_recallers {
    type: number
    value_format: "#.000"
    sql: div0(${spend},${estimated_ad_recallers});;
  }

  measure: cost_per_inline_link_click {
    type: number
    value_format: "#.000"
    sql: div0(${spend},${inline_link_clicks});;
  }

  measure: cost_per_inline_post_engagement {
    type: number
    value_format: "#.000"
    sql: div0(${spend},${inline_post_engagement});;
  }

  measure: cost_per_unique_click {
    type: number
    value_format: "#.00"
    sql: div0(${spend},${unique_clicks}) ;;
  }

  measure: cost_per_unique_inline_link_click {
    type: number
    value_format: "#.000"
    sql: div0(${spend},${unique_inline_link_clicks}) ;;
  }

  measure: cpc {
    type: number
    value_format: "#.000"
    sql: div0(${spend},${clicks}) ;;
  }

  measure: cpm {
    type: number
    value_format: "#.000"
    sql: div0(${spend},${impressions})*1000 ;;
  }

  measure: cpp {
    type: number
    value_format: "#.000"
    sql: div0(${spend},${reach})*1000 ;;
  }
  measure: cpl {
    label: "cpl"
    type: number
    value_format: "#.00"
    sql:  div0(${spend},${src_contacts_id_fb.count});;
  }

  dimension: ctr {
    type: number
    value_format: "#.000"
    sql: ${src_facebook_adinsight.ctr} ;;
  }

  dimension: date_preset {
    type: string
    sql: ${src_facebook_adinsight.date_preset} ;;
  }

  dimension: estimated_ad_recall_rate {
    type: number
    sql: ${src_facebook_adinsight.estimated_ad_recall_rate} ;;
  }

  measure: estimated_ad_recallers {
    type: sum
    sql: ${src_facebook_adinsight.estimated_ad_recallers} ;;
  }

  dimension: frequency {
    type: number
    sql: ${src_facebook_adinsight.frequency} ;;
  }

  measure: impressions {
    type: sum
    sql: ${src_facebook_adinsight.impressions} ;;
  }

  measure: inline_link_clicks {
    type: sum
    sql: ${src_facebook_adinsight.inline_link_clicks} ;;
  }

  measure: inline_link_clicks_counter {
    type: sum
    sql: ${src_facebook_adinsight.inline_link_clicks_counter} ;;
  }

  measure: inline_post_engagement {
    type: sum
    sql: ${src_facebook_adinsight.inline_post_engagement} ;;
  }

  dimension: objective {
    type: string
    sql: ${src_facebook_adinsight.objective} ;;
  }

  dimension: quality_ranking {
    type: string
    sql: ${src_facebook_adinsight.quality_ranking} ;;
  }

  measure: reach {
    type: sum
    sql: ${src_facebook_adinsight.reach} ;;
  }

  measure: spend {
    type: sum
    sql: ${src_facebook_adinsight.spend} ;;
  }

  measure: target {
    type: sum
    sql: ${src_facebook_adinsight.target} ;;
  }

  measure: unique_clicks {
    type: sum
    sql: ${src_facebook_adinsight.unique_clicks} ;;
  }

  dimension: unique_ctr {
    type: number
    sql: ${src_facebook_adinsight.unique_ctr} ;;
  }

  measure: unique_inline_link_click_counter {
    type: sum
    sql: ${src_facebook_adinsight.unique_inline_link_click_counter} ;;
  }

  measure: unique_inline_link_clicks {
    type: sum
    sql: ${src_facebook_adinsight.unique_inline_link_clicks} ;;
  }
  measure: form_conversion {
    label: "Conversion Rate Goal 1"
    type: number
    value_format: "#.0%"
    sql:  ${src_facebook_adinsight.form_conversion};;
  }
  measure: ROI {
    label: "Sales ROI"
    type: number
    value_format: "#.0%"
    sql:  div0(${src_oracle_contract_invoice.invoice_amount},${spend});;
  }
  measure: DonationROI {
    label: "Donation ROI"
    type: number
    value_format: "$#.0"
    sql:  ${ft_transactions_all.amount_amt_sum}-${spend};;
  }
  measure: count {
    label: "Ad Count"
    type: count
    drill_fields: [id, name]
  }
}
