view: src_facebook_adinsight {
  sql_table_name: "HUBSPOT"."SRC_FACEBOOK_ADINSIGHT"
    ;;

  dimension: ad_account_id {
    type: string
    sql: ${TABLE}."AdAccountId" ;;
  }

  dimension: ad_account_name {
    type: string
    sql: ${TABLE}."AdAccountName" ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}."AdId" ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}."AdName" ;;
  }

  dimension: ad_set_id {
    type: string
    sql: ${TABLE}."AdSetId" ;;
  }

  dimension: ad_set_name {
    type: string
    sql: ${TABLE}."AdSetName" ;;
  }

  dimension: buying_type {
    type: string
    sql: ${TABLE}."BuyingType" ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."CampaignName" ;;
  }

  dimension: checkins {
    type: number
    sql: ${TABLE}."Checkins" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}."Clicks" ;;
  }

  dimension: conversion_rate_ranking {
    type: string
    sql: ${TABLE}."ConversionRateRanking" ;;
  }

  dimension: cost_per_estimated_ad_recallers {
    type: number
    sql: ${TABLE}."CostPerEstimatedAdRecallers" ;;
  }

  dimension: cost_per_inline_link_click {
    type: number
    sql: ${TABLE}."CostPerInlineLinkClick" ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    sql: ${TABLE}."CostPerInlinePostEngagement" ;;
  }

  dimension: cost_per_unique_click {
    type: number
    sql: ${TABLE}."CostPerUniqueClick" ;;
  }

  dimension: cost_per_unique_inline_link_click {
    type: number
    sql: ${TABLE}."CostPerUniqueInlineLinkClick" ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}."CPC" ;;
  }

  dimension: cpm {
    type: number
    sql: ${TABLE}."CPM" ;;
  }

  dimension: cpp {
    type: number
    sql: ${TABLE}."CPP" ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}."CTR" ;;
  }

  dimension_group: date_end {
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
    sql: ${TABLE}."DateEnd" ;;
  }

  dimension: date_preset {
    type: string
    sql: ${TABLE}."DatePreset" ;;
  }

  dimension_group: date_start {
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
    sql: ${TABLE}."DateStart" ;;
  }

  dimension: estimated_ad_recall_rate {
    type: number
    sql: ${TABLE}."EstimatedAdRecallRate" ;;
  }

  dimension: estimated_ad_recallers {
    type: number
    sql: ${TABLE}."EstimatedAdRecallers" ;;
  }

  dimension: event_responses {
    type: number
    sql: ${TABLE}."EventResponses" ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}."Frequency" ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}."Impressions" ;;
  }

  dimension: inline_link_clicks {
    type: number
    sql: ${TABLE}."InlineLinkClicks" ;;
  }

  dimension: inline_link_clicks_counter {
    type: number
    sql: ${TABLE}."InlineLinkClicksCounter" ;;
  }

  dimension: inline_post_engagement {
    type: number
    sql: ${TABLE}."InlinePostEngagement" ;;
  }

  dimension: link_clicks {
    type: number
    sql: ${TABLE}."LinkClicks" ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}."Objective" ;;
  }

  dimension: offer_saves {
    type: number
    sql: ${TABLE}."OfferSaves" ;;
  }

  dimension: outbound_clicks {
    type: number
    sql: ${TABLE}."OutboundClicks" ;;
  }

  dimension: page_engagements {
    type: number
    sql: ${TABLE}."PageEngagements" ;;
  }

  dimension: page_likes {
    type: number
    sql: ${TABLE}."PageLikes" ;;
  }

  dimension: page_mentions {
    type: number
    sql: ${TABLE}."PageMentions" ;;
  }

  dimension: page_photo_views {
    type: number
    sql: ${TABLE}."PagePhotoViews" ;;
  }

  dimension: page_tab_views {
    type: number
    sql: ${TABLE}."PageTabViews" ;;
  }

  dimension: post_comments {
    type: number
    sql: ${TABLE}."PostComments" ;;
  }

  dimension: post_engagements {
    type: number
    sql: ${TABLE}."PostEngagements" ;;
  }

  dimension: post_reactions {
    type: number
    sql: ${TABLE}."PostReactions" ;;
  }

  dimension: post_shares {
    type: number
    sql: ${TABLE}."PostShares" ;;
  }

  dimension: quality_ranking {
    type: string
    sql: ${TABLE}."QualityRanking" ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}."Reach" ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}."Spend" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: unique_clicks {
    type: number
    sql: ${TABLE}."UniqueClicks" ;;
  }

  dimension: unique_ctr {
    type: number
    sql: ${TABLE}."UniqueCTR" ;;
  }

  dimension: unique_inline_link_click_counter {
    type: number
    sql: ${TABLE}."UniqueInlineLinkClickCounter" ;;
  }

  dimension: unique_inline_link_clicks {
    type: number
    sql: ${TABLE}."UniqueInlineLinkClicks" ;;
  }

  dimension: unique_link_clicks_counter {
    type: number
    sql: ${TABLE}."UniqueLinkClicksCounter" ;;
  }
  measure: form_conversion {
    label: "Click-Form Submission Conversion"
    type: number
    sql:  ${src_contacts_id_fb.count}/${sum_clicks};;
  }
  measure: sum_clicks {
    type: sum
    sql:  ${TABLE}."Clicks";;
  }
  measure: count {
    type: count
    drill_fields: [ad_set_name, ad_name, campaign_name, ad_account_name]
  }
}
