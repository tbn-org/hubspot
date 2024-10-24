view: ft_campaign {
  view_label: "Campaign"
  sql_table_name: "HUBSPOT"."FT_CAMPAIGN";;

  measure: avg_donation_amt {
    value_format: "$#,##0"
    label: "Avg Donation Amount"
    type: number
    sql: ${donation_amt}/${donationcnt_nbr} ;;
  }

  measure: bounced_nbr {
    label: "Bounced"
    type: number
    sql: sum(${TABLE}."BOUNCED_NBR") ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show bounce event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=BOUNCE"
    }
  }

  dimension: uniquekey {
    primary_key: yes
    label: "Unique Key"
    type: string
    sql: ${TABLE}."UNIQUEKEY" ;;
  }

  dimension: campaign_year {
    label: "Campaign Year"
    type: number
    sql: ${TABLE}."CAMPAIGN_YEAR" ;;
  }

  dimension: campaign_month {
    label: "Campaign Month"
    type: number
    sql: ${TABLE}."CAMPAIGN_MONTH" ;;
  }

  dimension: campaign_type {
    label: "Campaign Type"
    type: string
    sql: ${TABLE}."CAMPAIGN_TYPE" ;;
  }

  dimension: campaign_code {
    label: "Campaign Code"
    type: string
    sql: ${TABLE}."CAMPAIGN_CODE" ;;
  }

  dimension: campaign_id {
    label: "HS Email Campaign ID"
    type: number
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: utm_source {
    label: "UTM Source"
    type: string
    sql: ${TABLE}."UTM_SOURCE" ;;
  }

  dimension: utm_medium {
    label: "UTM Medium"
    type: string
    sql: ${TABLE}."UTM_MEDIUM" ;;
  }

  dimension: campaign_name_descr {
    label: "HS Email Campaign Name"
    type: string
    sql: ${TABLE}."CAMPAIGN_NAME_DESCR" ;;
  }

  measure: click_nbr {
    label: "Clicked"
    type: sum
    sql: ${TABLE}."CLICK_NBR" ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show click event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=CLICK"
    }
  }

  measure: deferred_nbr {
    label: "Deferred"
    type: sum
    sql: ${TABLE}."DEFERRED_NBR" ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show deferred event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=DEFERRED"
    }
  }

  measure: delivered_nbr {
    label: "Delivered"
    type: sum
    sql: ${TABLE}."DELIVERED_NBR" ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show delivered event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=DELIVERED"
    }
  }

  measure: donation_amt {
    value_format: "$#,##0"
    label: "Donation Amount"
    type: sum
    sql: ${ft_transactions.amount_amt} ;;
    drill_fields: [ft_transactions.accountnumber_id,ft_transactions.documentnumber_id,ft_transactions.email,ft_transactions.sourcecode_cd,ft_transactions.amount_amt,ft_transactions.transactiondate_dt,ft_transactions.first_transaction_flag,ft_transactions.lifetimevalue,ft_transactions.lifetimecount]
  }

  measure: donationcnt_nbr {
    label: "Donation Count"
    type: count_distinct
    sql: ${ft_transactions.documentnumber_id} ;;
    drill_fields: [ft_transactions.accountnumber_id,ft_transactions.documentnumber_id,ft_transactions.email,ft_transactions.sourcecode_cd,ft_transactions.amount_amt,ft_transactions.transactiondate_dt,ft_transactions.first_transaction_flag,ft_transactions.lifetimevalue,ft_transactions.lifetimecount]
  }

  measure: donorcnt_nbr {
    label: "Donor Count"
    type: count_distinct
    sql: ${ft_transactions.accountnumber_id} ;;
    drill_fields: [ft_transactions.accountnumber_id,ft_transactions.documentnumber_id,ft_transactions.email,ft_transactions.sourcecode_cd,ft_transactions.amount_amt,ft_transactions.transactiondate_dt,ft_transactions.first_transaction_flag,ft_transactions.lifetimevalue,ft_transactions.lifetimecount]
  }

  measure: dropped_nbr {
    label: "Dropped"
    type: sum
    sql: ${TABLE}."DROPPED_NBR" ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show dropped event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=DROPPED"
    }
  }

  measure: included_nbr {
    label: "Included"
    type: sum
    sql: ${TABLE}."INCLUDED_NBR" ;;
  }

  measure: largest_donation_amt {
    value_format: "$#,##0"
    label: "Largest Donation"
    type: max
    sql: ${TABLE}."LARGEST_DONATION_AMT" ;;
  }

  dimension_group: last_processing_start {
    label: "Last Processing"
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
    sql: ${TABLE}."LASTPROCESSINGSTART_TIMESTAMP" ;;
  }

  measure: mta_dropped_nbr {
    label: "MTA Dropped"
    type: sum
    sql: ${TABLE}."MTA_DROPPED_NBR" ;;
  }

  measure: open_nbr {
    label: "Open"
    type: sum
    sql: ${TABLE}."OPEN_NBR" ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show open event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=OPEN"
    }
  }

  measure: processed_nbr {
    label: "Processed"
    type: sum
    sql: ${TABLE}."PROCESSED_NBR" ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show processed event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=PROCESSED"
    }
  }

  measure: queued_nbr {
    label: "Queued"
    type: sum
    sql: ${TABLE}."QUEUED_NBR" ;;
  }

  measure: sent_nbr {
    label: "Sent"
    type: sum
    sql: ${TABLE}."SENT_NBR" ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show sent event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=SENT"
    }
  }

  measure: statuschanged_nbr {
    label: "Status Changed"
    type: sum
    sql: ${TABLE}."STATUSCHANGED_NBR" ;;
  }

  measure: unsubscribed_nbr {
    label: "Unsubscribed"
    type: sum
    sql: ${TABLE}."UNSUBSCRIBED_NBR" ;;
  }

  dimension: utm_campaign {
    label: "UTM Campaign"
    type: string
    sql: ${TABLE}."UTM_CAMPAIGN" ;;
  }

  filter: huckabeehat{
    label: "Huckabee Hat"
    type: yesno
    sql:  case when ${TABLE}."CAMPAIGN_ID" in (select distinct "CampaignId" from "HUBSPOT"."SRC_EMAILCAMPAIGNEVENT" where
          "Url" LIKE '%https://www.tbn.org/huckabeehat%') then true else false end;;
  }

  filter: huckabeemub{
    label: "Huckabee Mug"
    type: yesno
    sql:  case when ${TABLE}."CAMPAIGN_ID" in (select distinct "CampaignId" from "HUBSPOT"."SRC_EMAILCAMPAIGNEVENT" where
      "Url" LIKE '%https://www.tbn.org/huckabeemug%') then true else false end;;
  }

  filter: huckabeesimple{
    label: "Huckabee Simple"
    type: yesno
    sql:  case when ${TABLE}."CAMPAIGN_ID" in (select distinct "CampaignId" from "HUBSPOT"."SRC_EMAILCAMPAIGNEVENT" where
      "Url" LIKE '%https://www.tbn.org/simple%') then true else false end;;
  }
}
