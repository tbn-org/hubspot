view: src_addtrandata {
  sql_table_name: "DONOR"."SRC_ADDTRANDATA"
    ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."AccountNumber" ;;
  }

  dimension: acct_number {
    type: number
    sql: ${TABLE}."AcctNumber" ;;
  }

  dimension: agent {
    type: string
    sql: ${TABLE}."Agent" ;;
  }

  dimension: billing_address_city {
    type: string
    sql: ${TABLE}."BillingAddressCity" ;;
  }

  dimension: billing_address_country {
    type: string
    sql: ${TABLE}."BillingAddressCountry" ;;
  }

  dimension: billing_address_line1 {
    type: string
    sql: ${TABLE}."BillingAddressLine1" ;;
  }

  dimension: billing_address_line2 {
    type: string
    sql: ${TABLE}."BillingAddressLine2" ;;
  }

  dimension: billing_address_state {
    type: string
    sql: ${TABLE}."BillingAddressState" ;;
  }

  dimension: billing_address_zip {
    type: string
    sql: ${TABLE}."BillingAddressZip" ;;
  }

  dimension: call_center_name {
    type: string
    sql: ${TABLE}."CallCenterName" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}."Campaign" ;;
  }

  dimension: emailname {
    label: "Email Name"
    type: string
    sql: ${ft_campaign.campaign_name_descr} ;;
  }

  dimension: consumer_id {
    type: string
    sql: ${TABLE}."ConsumerID" ;;
  }

  dimension: custom_field {
    type: string
    sql: ${TABLE}."CustomField" ;;
  }

  dimension: dc_bat_num {
    type: string
    sql: ${TABLE}."dcBatNum" ;;
  }

  dimension: dc_bat_seq {
    type: string
    sql: ${TABLE}."dcBatSeq" ;;
  }

  dimension: dc_prc_date {
    type: string
    sql: ${TABLE}."dcPrcDate" ;;
  }

  dimension: dc_scn_date {
    type: string
    sql: ${TABLE}."dcScnDate" ;;
  }

  dimension: dc_trn_date {
    type: string
    sql: ${TABLE}."dcTrnDate" ;;
  }

  dimension: dnis {
    type: string
    sql: ${TABLE}."DNIS" ;;
  }

  dimension: document_number {
    type: number
    sql: ${TABLE}."DocumentNumber" ;;
  }

  dimension: fair_market_value {
    type: string
    sql: ${TABLE}."FairMarketValue" ;;
  }

  dimension: gift {
    type: string
    sql: ${TABLE}."Gift" ;;
  }

  dimension: import_table_name {
    type: string
    sql: ${TABLE}."ImportTableName" ;;
  }

  dimension_group: load_timestamp {
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
    sql: ${TABLE}."LOAD_TIMESTAMP" ;;
  }

  dimension: offer_speaker {
    type: string
    sql: ${TABLE}."OfferSpeaker" ;;
  }

  dimension: original_speaker {
    type: string
    sql: ${TABLE}."OriginalSpeaker" ;;
  }

  dimension: pay_pal_reference_id {
    type: string
    sql: ${TABLE}."PayPalReferenceID" ;;
  }

  dimension: payers_account_id {
    type: string
    sql: ${TABLE}."PayersAccountID" ;;
  }

  dimension: rec_xmlfields {
    type: string
    sql: ${TABLE}."RecXMLFields" ;;
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}."RecordId" ;;
    primary_key: yes
  }

  dimension: run_id {
    type: string
    sql: ${TABLE}."RunID" ;;
  }

  dimension: shipping_name {
    type: string
    sql: ${TABLE}."ShippingName" ;;
  }

  dimension: source_url {
    type: string
    sql: ${TABLE}."SourceURL " ;;
  }

  dimension: trans_auth_id {
    type: string
    sql: ${TABLE}."TransAuthID" ;;
  }

  dimension: transaction_event_code {
    type: string
    sql: ${TABLE}."TransactionEventCode" ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}."TransactionID" ;;
  }

  dimension_group: update_timestamp {
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
    sql: ${TABLE}."UPDATE_TIMESTAMP" ;;
  }

  dimension: utmcampaign {
    type: string
    label: "UTM Campaign"
    sql: ${TABLE}."utm_campaign" ;;
  }

  dimension: utmcontent {
    type: string
    label: "UTM Content"
    sql: ${TABLE}."utm_content" ;;
  }

  dimension: utmmedia {
    type: string
    label: "UTM Media"
    sql: ${TABLE}."utm_medium" ;;
  }

  dimension: utmsource {
    type: string
    label: "UTM Source"
    sql: ${TABLE}."utm_source" ;;
  }

  dimension: utmterm {
    type: string
    label: "UTM Term"
    sql:substring(${TABLE}."XMLData",position('<utm_term>',${TABLE}."XMLData")+10,position('</utm_term>',${TABLE}."XMLData")-position('<utm_term>',${TABLE}."XMLData")-10);;
  }

  dimension: xmldata {
    type: string
    sql: ${TABLE}."XMLData" ;;
  }

  dimension: xmlfields {
    type: string
    sql: ${TABLE}."XMLFields" ;;
  }

  measure: count {
    type: count
    drill_fields: [call_center_name, shipping_name, import_table_name]
  }
}
