view: src_bing_adperformance {
  sql_table_name: "HUBSPOT"."SRC_BING_ADPERFORMANCE"
    ;;

  dimension: account_id {
    type: number
    sql: ${TABLE}."AccountId" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."AccountName" ;;
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}."AccountNumber" ;;
  }

  dimension: account_status {
    type: string
    sql: ${TABLE}."AccountStatus" ;;
  }

  dimension: ad_description {
    type: string
    sql: ${TABLE}."AdDescription" ;;
  }

  dimension: ad_description2 {
    type: string
    sql: ${TABLE}."AdDescription2" ;;
  }

  dimension: ad_distribution {
    type: string
    sql: ${TABLE}."AdDistribution" ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}."AdGroupId" ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}."AdGroupName" ;;
  }

  dimension: ad_group_status {
    type: string
    sql: ${TABLE}."AdGroupStatus" ;;
  }

  dimension: ad_id {
    type: number
    sql: ${TABLE}."AdId" ;;
  }

  dimension: ad_labels {
    type: string
    sql: ${TABLE}."AdLabels" ;;
  }

  dimension: ad_status {
    type: string
    sql: ${TABLE}."AdStatus" ;;
  }

  dimension: ad_title {
    type: string
    sql: ${TABLE}."AdTitle" ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}."AdType" ;;
  }

  dimension: assists {
    type: number
    sql: ${TABLE}."Assists" ;;
  }

  dimension: average_cpc {
    type: number
    sql: ${TABLE}."AverageCpc" ;;
  }

  dimension: average_position {
    type: number
    sql: ${TABLE}."AveragePosition" ;;
  }

  dimension: bid_match_type {
    type: string
    sql: ${TABLE}."BidMatchType" ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}."BusinessName" ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."CampaignName" ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}."CampaignStatus" ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}."Clicks" ;;
  }

  dimension: conversion_rate {
    type: number
    sql: ${TABLE}."ConversionRate" ;;
  }

  measure: conversions {
    type: sum
    sql: ${TABLE}."Conversions" ;;
  }

  dimension: cost_per_assist {
    type: number
    value_format: "$#,##0.00"
    sql: ${TABLE}."CostPerAssist" ;;
  }

  dimension: cost_per_conversion {
    type: number
    value_format: "$#,##0.00"
    sql: ${TABLE}."CostPerConversion" ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}."Ctr" ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}."CurrencyCode" ;;
  }

  dimension: custom_parameters {
    type: string
    sql: ${TABLE}."CustomParameters" ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CustomerId" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CustomerName" ;;
  }

  dimension_group: daily {
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
    sql: ${TABLE}."Daily" ;;
  }

  dimension: delivered_match_type {
    type: string
    sql: ${TABLE}."DeliveredMatchType" ;;
  }

  dimension: destination_url {
    type: string
    sql: ${TABLE}."DestinationUrl" ;;
  }

  dimension: device_os {
    type: string
    sql: ${TABLE}."DeviceOS" ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}."DeviceType" ;;
  }

  dimension: display_url {
    type: string
    sql: ${TABLE}."DisplayUrl" ;;
  }

  dimension: final_app_url {
    type: string
    sql: ${TABLE}."FinalAppUrl" ;;
  }

  dimension: final_mobile_url {
    type: string
    sql: ${TABLE}."FinalMobileUrl" ;;
  }

  dimension: final_url {
    type: string
    sql: ${TABLE}."FinalUrl" ;;
  }

  dimension: goal {
    type: string
    sql: ${TABLE}."Goal" ;;
  }

  dimension: goal_type {
    type: string
    sql: ${TABLE}."GoalType" ;;
  }

  dimension: headline {
    type: string
    sql: ${TABLE}."Headline" ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}."Impressions" ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}."Language" ;;
  }

  dimension: long_headline {
    type: string
    sql: ${TABLE}."LongHeadline" ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}."Network" ;;
  }

  dimension: path1 {
    type: string
    sql: ${TABLE}."Path1" ;;
  }

  dimension: path2 {
    type: string
    sql: ${TABLE}."Path2" ;;
  }

  dimension: return_on_ad_spend {
    type: number
    sql: ${TABLE}."ReturnOnAdSpend" ;;
  }

  measure: spend {
    type: sum
    value_format: "$#,##0.0"
    sql: ${TABLE}."Spend" ;;
  }

  dimension: title_part1 {
    type: string
    sql: ${TABLE}."TitlePart1" ;;
  }

  dimension: title_part2 {
    type: string
    sql: ${TABLE}."TitlePart2" ;;
  }

  dimension: title_part3 {
    type: string
    sql: ${TABLE}."TitlePart3" ;;
  }

  dimension: top_vs_other {
    type: string
    sql: ${TABLE}."TopVsOther" ;;
  }

  dimension: tracking_template {
    type: string
    sql: ${TABLE}."TrackingTemplate" ;;
  }
}
