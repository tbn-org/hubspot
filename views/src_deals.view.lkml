view: src_deals {
  sql_table_name: "HUBSPOT"."SRC_DEALS"
    ;;

  measure: count {
    type: count
    drill_fields: [deal_name,associated_vids,create.raw,deal_stage,amount,last_activity.raw]
  }

  measure: dealamount {
    label: "Deal Amount"
    type: sum
    sql: ${TABLE}."Amount" ;;
    drill_fields: [deal_name,associated_vids,create.raw,deal_stage,amount,last_activity.raw]
  }

  dimension: abandoned_cart_url {
    type: string
    sql: ${TABLE}."Abandoned Cart Url" ;;
  }

  dimension: all_accessible_team_ids {
    type: string
    sql: ${TABLE}."All accessible team ids" ;;
  }

  dimension: all_owner_ids {
    type: string
    sql: ${TABLE}."All owner ids" ;;
  }

  dimension: all_team_ids {
    type: string
    sql: ${TABLE}."All team ids" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."Amount" ;;
  }

  dimension: amount_in_company_currency {
    type: number
    sql: ${TABLE}."Amount in company currency" ;;
  }

  dimension: annual_contract_value {
    type: number
    sql: ${TABLE}."Annual contract value" ;;
  }

  dimension: annual_recurring_revenue {
    type: number
    sql: ${TABLE}."Annual recurring revenue" ;;
  }

  dimension: associated_company_ids {
    type: string
    sql: ${TABLE}."AssociatedCompanyIds" ;;
  }

  dimension: associated_deal_ids {
    type: string
    sql: ${TABLE}."AssociatedDealIds" ;;
  }

  dimension: associated_vids {
    label: "HS Contact ID"
    type: string
    sql: ${TABLE}."AssociatedVids" ;;
  }

  dimension: call_stages {
    type: string
    sql: ${TABLE}."Call Stages" ;;
  }

  dimension: campaign_of_last_booking_in_meetings_tool {
    type: string
    sql: ${TABLE}."Campaign of last booking in meetings tool" ;;
  }

  dimension_group: close {
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
    sql: ${TABLE}."Close Date" ;;
  }

  dimension: closed_deal_amount {
    type: number
    sql: ${TABLE}."Closed Deal Amount" ;;
  }

  dimension: closed_deal_amount_in_home_currency {
    type: number
    sql: ${TABLE}."Closed Deal Amount In Home Currency" ;;
  }

  dimension: closed_lost_reason {
    type: string
    sql: ${TABLE}."Closed Lost Reason" ;;
  }

  dimension: closed_lost_reason_trilogy {
    type: string
    sql: ${TABLE}."Closed Lost Reason (Trilogy)" ;;
  }

  dimension: closed_won_reason {
    type: string
    sql: ${TABLE}."Closed Won Reason" ;;
  }

  dimension_group: create {
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
    sql: ${TABLE}."Create Date" ;;
  }

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}."Created by user ID" ;;
  }

  dimension_group: date_of_last_meeting_booked_in_meetings_tool {
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
    sql: ${TABLE}."Date of last meeting booked in meetings tool" ;;
  }

  dimension: days_to_close {
    type: number
    sql: ${TABLE}."Days to close" ;;
  }

  dimension: deal {
    type: string
    sql: ${TABLE}."Deal" ;;
  }

  dimension: deal_amount_calculation_preference {
    type: string
    sql: ${TABLE}."Deal amount calculation preference" ;;
  }

  dimension: deal_city {
    type: string
    sql: ${TABLE}."Deal City" ;;
  }

  dimension: deal_country {
    type: string
    sql: ${TABLE}."Deal Country" ;;
  }

  dimension: deal_description {
    type: string
    sql: ${TABLE}."Deal Description" ;;
  }

  dimension: deal_email {
    type: string
    sql: ${TABLE}."Deal Email" ;;
  }

  dimension: deal_id {
    type: number
    sql: ${TABLE}."DealId" ;;
    primary_key: yes
  }

  dimension: deal_mobile_phone_number {
    type: string
    sql: ${TABLE}."Deal Mobile Phone Number" ;;
  }

  dimension: deal_name {
    type: string
    sql: ${TABLE}."Deal Name" ;;
  }

  dimension: deal_owner {
    type: string
    sql: ${TABLE}."Deal owner" ;;
    hidden: yes
  }

  dimension: deal_owner_name {
    label: "Deal Owner"
    type: string
    sql: CONCAT(${src_owners.first_name},' ',${src_owners.last_name}) ;;
  }

  dimension: deal_phone_number {
    type: string
    sql: ${TABLE}."Deal Phone Number" ;;
  }

  dimension: deal_postal_code {
    type: string
    sql: ${TABLE}."Deal Postal Code" ;;
  }

  dimension: deal_source_type {
    type: string
    sql: ${TABLE}."Deal Source Type" ;;
  }

  dimension: deal_stageid {
    label: "Stage ID"
    type: string
    sql: ${TABLE}."Deal Stage" ;;
    hidden: yes
  }

  dimension: deal_stage {
    label: "Deal Stage"
    type: string
    sql: ${src_stage.stage_name} ;;

  }

  dimension: deal_stage_probability {
    type: number
    sql: ${TABLE}."Deal Stage Probability" ;;
  }

  dimension: deal_state {
    type: string
    sql: ${TABLE}."Deal State" ;;
  }

  dimension: deal_street_address {
    type: string
    sql: ${TABLE}."Deal Street Address" ;;
  }

  dimension: deal_type {
    type: string
    sql: ${TABLE}."Deal Type" ;;
  }

  dimension: discount_savings {
    type: number
    sql: ${TABLE}."Discount savings" ;;
  }

  dimension: ecomm_synced {
    type: string
    sql: ${TABLE}."EComm Synced" ;;
  }

  dimension: extra_url_parameters {
    type: string
    sql: ${TABLE}."ExtraUrlParameters" ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}."Forecast category" ;;
  }

  dimension: global_term_line_item_discount_percentage {
    type: string
    sql: ${TABLE}."Global Term Line Item Discount Percentage" ;;
  }

  dimension: global_term_line_item_discount_percentage_enabled {
    type: yesno
    sql: ${TABLE}."Global Term Line Item Discount Percentage Enabled" ;;
  }

  dimension: global_term_line_item_recurring_billing_frequency {
    type: string
    sql: ${TABLE}."Global Term Line Item Recurring Billing Frequency" ;;
  }

  dimension: global_term_line_item_recurring_billing_frequency_enabled {
    type: yesno
    sql: ${TABLE}."Global Term Line Item Recurring Billing Frequency Enabled" ;;
  }

  dimension: global_term_line_item_recurring_billing_period {
    type: string
    sql: ${TABLE}."Global Term Line Item Recurring Billing Period" ;;
  }

  dimension: global_term_line_item_recurring_billing_period_enabled {
    type: yesno
    sql: ${TABLE}."Global Term Line Item Recurring Billing Period Enabled" ;;
  }

  dimension: global_term_line_item_recurring_billing_start_date {
    type: string
    sql: ${TABLE}."Global Term Line Item Recurring Billing Start Date" ;;
  }

  dimension: global_term_line_item_recurring_billing_start_date_enabled {
    type: yesno
    sql: ${TABLE}."Global Term Line Item Recurring Billing Start Date Enabled" ;;
  }

  dimension: hub_spot_campaign {
    type: string
    sql: ${TABLE}."HubSpot Campaign" ;;
  }

  dimension_group: hub_spot_create {
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
    sql: ${TABLE}."HubSpot Create Date" ;;
  }

  dimension: hub_spot_team {
    type: string
    sql: ${TABLE}."HubSpot Team" ;;
  }

  dimension: is_deal_closed {
    type: yesno
    sql: ${TABLE}."Is Deal Closed?" ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}."IsDeleted" ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}."Last Activity Date" ;;
  }

  dimension_group: last_contacted {
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
    sql: ${TABLE}."Last Contacted" ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}."Last Modified Date" ;;
  }

  dimension_group: latest_meeting_activity {
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
    sql: ${TABLE}."Latest meeting activity" ;;
  }

  dimension: likelihood_to_close_by_the_close_date {
    type: number
    sql: ${TABLE}."Likelihood to close by the close date" ;;
  }

  dimension: llar_brochure_sent {
    type: string
    sql: ${TABLE}."LLAR Brochure Sent" ;;
  }

  dimension: llbr_brochure_sent {
    type: string
    sql: ${TABLE}."LLBR Brochure Sent" ;;
  }

  dimension: llbrochure_sent {
    type: string
    sql: ${TABLE}."LLBrochure Sent" ;;
  }

  dimension: lldeal_source {
    type: string
    sql: ${TABLE}."LLDeal Source" ;;
  }

  dimension: llep_brochure_sent {
    type: string
    sql: ${TABLE}."LLEP Brochure Sent" ;;
  }

  dimension: llsource_type {
    type: string
    sql: ${TABLE}."LLSource Type" ;;
  }

  dimension: llsp_brochure_sent {
    type: string
    sql: ${TABLE}."LLSP Brochure Sent" ;;
  }

  dimension: medium_of_last_booking_in_meetings_tool {
    type: string
    sql: ${TABLE}."Medium of last booking in meetings tool" ;;
  }

  dimension: merged_object_ids {
    type: string
    sql: ${TABLE}."Merged object IDs" ;;
  }

  dimension: monthly_recurring_revenue {
    type: number
    sql: ${TABLE}."Monthly recurring revenue" ;;
  }

  dimension_group: next_activity {
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
    sql: ${TABLE}."Next Activity Date" ;;
  }

  dimension: number_of_contacts {
    type: number
    sql: ${TABLE}."Number of Contacts" ;;
  }

  dimension: number_of_sales_activities {
    type: number
    sql: ${TABLE}."Number of Sales Activities" ;;
  }

  dimension: number_of_times_contacted {
    type: number
    sql: ${TABLE}."Number of times contacted" ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}."Order number" ;;
  }

  dimension: original_source_data_1 {
    type: string
    sql: ${TABLE}."Original Source Data 1" ;;
  }

  dimension: original_source_data_2 {
    type: string
    sql: ${TABLE}."Original Source Data 2" ;;
  }

  dimension: original_source_type {
    type: string
    sql: ${TABLE}."Original Source Type" ;;
  }

  dimension_group: owner_assigned {
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
    sql: ${TABLE}."Owner Assigned Date" ;;
  }

  dimension: pipeline {
    type: string
    sql: ${TABLE}."Pipeline" ;;
  }

  dimension: projected_deal_amount {
    type: number
    sql: ${TABLE}."Projected Deal Amount" ;;
  }

  dimension: projected_deal_amount_in_home_currency {
    type: number
    sql: ${TABLE}."Projected Deal Amount in Home Currency" ;;
  }

  dimension_group: recent_sales_email_replied {
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
    sql: ${TABLE}."Recent Sales Email Replied Date" ;;
  }

  dimension: shipment_ids {
    type: string
    sql: ${TABLE}."Shipment IDs" ;;
  }

  dimension: source_account_id {
    type: string
    sql: ${TABLE}."Source account ID" ;;
  }

  dimension: source_app_id {
    type: string
    sql: ${TABLE}."Source app ID" ;;
  }

  dimension: source_app_id2 {
    type: string
    sql: ${TABLE}."Source App ID2" ;;
  }

  dimension: source_of_last_booking_in_meetings_tool {
    type: string
    sql: ${TABLE}."Source of last booking in meetings tool" ;;
  }

  dimension: source_store {
    type: string
    sql: ${TABLE}."Source Store" ;;
  }

  dimension: tax_price {
    type: number
    sql: ${TABLE}."Tax price" ;;
  }

  dimension: the_predicted_deal_amount {
    type: number
    sql: ${TABLE}."The predicted deal amount" ;;
  }

  dimension: the_predicted_deal_amount_in_your_companys_currency {
    type: number
    sql: ${TABLE}."The predicted deal amount in your company's currency" ;;
  }

  dimension: total_contract_value {
    type: number
    sql: ${TABLE}."Total contract value" ;;
  }

  dimension: updated_by_user_id {
    type: number
    sql: ${TABLE}."Updated by user ID" ;;
  }

  dimension: user_ids_of_all_owners {
    type: string
    sql: ${TABLE}."User IDs of all owners" ;;
  }
}
