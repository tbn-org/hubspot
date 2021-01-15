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

  dimension: campaign_name_descr {
    label: "HS Email Campaign Name"
    type: string
    sql: ${TABLE}."CAMPAIGN_NAME_DESCR" ;;
  }

  measure: click_nbr {
    label: "Clicked"
    type: number
    sql: sum(${TABLE}."CLICK_NBR") ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show click event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=CLICK"
    }
  }

  measure: deferred_nbr {
    label: "Deferred"
    type: number
    sql: sum(${TABLE}."DEFERRED_NBR") ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show deferred event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=DEFERRED"
    }
  }

  measure: delivered_nbr {
    label: "Delivered"
    type: number
    sql: sum(${TABLE}."DELIVERED_NBR") ;;
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
    type: number
    sql: sum(${TABLE}."DROPPED_NBR") ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show dropped event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=DROPPED"
    }
  }

  measure: included_nbr {
    label: "Included"
    type: number
    sql: sum(${TABLE}."INCLUDED_NBR") ;;
  }

  measure: largest_donation_amt {
    value_format: "$#,##0"
    label: "Largest Donation"
    type: number
    sql: max(${TABLE}."LARGEST_DONATION_AMT") ;;
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
    type: number
    sql: sum(${TABLE}."MTA_DROPPED_NBR") ;;
  }

  measure: open_nbr {
    label: "Open"
    type: number
    sql: sum(${TABLE}."OPEN_NBR") ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show open event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=OPEN"
    }
  }

  measure: processed_nbr {
    label: "Processed"
    type: number
    sql: sum(${TABLE}."PROCESSED_NBR") ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show processed event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=PROCESSED"
    }
  }

  measure: queued_nbr {
    label: "Queued"
    type: number
    sql: sum(${TABLE}."QUEUED_NBR") ;;
  }

  measure: sent_nbr {
    label: "Sent"
    type: number
    sql: sum(${TABLE}."SENT_NBR") ;;
    drill_fields: [src_emailcampaignevent.recipient_email,src_emailcampaignevent.created,src_emailcampaignevent.type]
    link: {
      label: "Show sent event"
      url: "{{ link }}&f[src_emailcampaignevent.type]=SENT"
    }
  }

  measure: statuschanged_nbr {
    label: "Status Changed"
    type: number
    sql: sum(${TABLE}."STATUSCHANGED_NBR") ;;
  }

  measure: unsubscribed_nbr {
    label: "Unsubscribed"
    type: number
    sql: sum(${TABLE}."UNSUBSCRIBED_NBR") ;;
  }

  dimension: utm_campaign {
    label: "UTM Campaign"
    type: string
    sql: ${TABLE}."UTM_CAMPAIGN" ;;
  }
}
