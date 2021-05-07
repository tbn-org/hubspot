view: src_google_adwords_adperformance_contactlist {
  label: "Google Adwords Ad"
  sql_table_name: "HUBSPOT"."SRC_GOOGLE_ADWORDS_ADPERFORMANCE"
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

  measure: gclidcount {
    label: "Gclid Count"
    type: count_distinct
    sql: ${src_google_adwords_clicks.gcl_id} ;;
  }
}
