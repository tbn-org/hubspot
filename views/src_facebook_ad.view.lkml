view: src_facebook_ad {
  label: "Facebook Ad"
  sql_table_name: "HUBSPOT"."SRC_FACEBOOK_AD"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: ad_creative_id {
    type: string
    sql: ${TABLE}."AdCreativeId" ;;
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

  dimension: checkins {
    type: number
    sql: ${src_facebook_adinsight.checkins} ;;
  }

  dimension: clicks {
    type: number
    sql: ${src_facebook_adinsight.clicks} ;;
  }

  dimension: conversion_rate_ranking {
    type: string
    sql: ${src_facebook_adinsight.conversion_rate_ranking} ;;
  }

  dimension: cost_per_estimated_ad_recallers {
    type: number
    sql: ${src_facebook_adinsight.cost_per_estimated_ad_recallers} ;;
  }

  dimension: cost_per_inline_link_click {
    type: number
    sql: ${src_facebook_adinsight.cost_per_inline_link_click} ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    sql: ${src_facebook_adinsight.cost_per_inline_post_engagement} ;;
  }

  dimension: cost_per_unique_click {
    type: number
    sql: ${src_facebook_adinsight.cost_per_unique_click} ;;
  }

  dimension: cost_per_unique_inline_link_click {
    type: number
    sql: ${src_facebook_adinsight.cost_per_unique_inline_link_click} ;;
  }

  dimension: cpc {
    type: number
    sql: ${src_facebook_adinsight.cpc} ;;
  }

  dimension: cpm {
    type: number
    sql: ${src_facebook_adinsight.cpm} ;;
  }

  dimension: cpp {
    type: number
    sql: ${src_facebook_adinsight.cpp} ;;
  }

  dimension: ctr {
    type: number
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

  dimension: estimated_ad_recallers {
    type: number
    sql: ${src_facebook_adinsight.estimated_ad_recallers} ;;
  }

  dimension: event_responses {
    type: number
    sql: ${src_facebook_adinsight.event_responses} ;;
  }

  dimension: frequency {
    type: number
    sql: ${src_facebook_adinsight.frequency} ;;
  }

  dimension: impressions {
    type: number
    sql: ${src_facebook_adinsight.impressions} ;;
  }

  dimension: inline_link_clicks {
    type: number
    sql: ${src_facebook_adinsight.inline_link_clicks} ;;
  }

  dimension: inline_link_clicks_counter {
    type: number
    sql: ${src_facebook_adinsight.inline_link_clicks_counter} ;;
  }

  dimension: inline_post_engagement {
    type: number
    sql: ${src_facebook_adinsight.inline_post_engagement} ;;
  }

  dimension: link_clicks {
    type: number
    sql: ${src_facebook_adinsight.link_clicks} ;;
  }

  dimension: objective {
    type: string
    sql: ${src_facebook_adinsight.objective} ;;
  }

  dimension: offer_saves {
    type: number
    sql: ${src_facebook_adinsight.offer_saves} ;;
  }

  dimension: outbound_clicks {
    type: number
    sql: ${src_facebook_adinsight.outbound_clicks} ;;
  }

  dimension: page_engagements {
    type: number
    sql: ${src_facebook_adinsight.page_engagements} ;;
  }

  dimension: page_likes {
    type: number
    sql: ${src_facebook_adinsight.page_likes} ;;
  }

  dimension: page_mentions {
    type: number
    sql: ${src_facebook_adinsight.page_mentions} ;;
  }

  dimension: page_photo_views {
    type: number
    sql: ${src_facebook_adinsight.page_photo_views} ;;
  }

  dimension: page_tab_views {
    type: number
    sql: ${src_facebook_adinsight.page_tab_views} ;;
  }

  dimension: post_comments {
    type: number
    sql: ${src_facebook_adinsight.post_comments} ;;
  }

  dimension: post_engagements {
    type: number
    sql: ${src_facebook_adinsight.post_engagements} ;;
  }

  dimension: post_reactions {
    type: number
    sql: ${src_facebook_adinsight.post_reactions} ;;
  }

  dimension: post_shares {
    type: number
    sql: ${src_facebook_adinsight.post_shares} ;;
  }

  dimension: quality_ranking {
    type: string
    sql: ${src_facebook_adinsight.quality_ranking} ;;
  }

  dimension: reach {
    type: number
    sql: ${src_facebook_adinsight.reach} ;;
  }

  dimension: spend {
    type: number
    sql: ${src_facebook_adinsight.spend} ;;
  }

  dimension: target {
    type: string
    sql: ${src_facebook_adinsight.target} ;;
  }

  dimension: unique_clicks {
    type: number
    sql: ${src_facebook_adinsight.unique_clicks} ;;
  }

  dimension: unique_ctr {
    type: number
    sql: ${src_facebook_adinsight.unique_ctr} ;;
  }

  dimension: unique_inline_link_click_counter {
    type: number
    sql: ${src_facebook_adinsight.unique_inline_link_click_counter} ;;
  }

  dimension: unique_inline_link_clicks {
    type: number
    sql: ${src_facebook_adinsight.unique_inline_link_clicks} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
