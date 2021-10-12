connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore: src_facebook_ad{
  persist_for: "8 hour"
  label: "Facebook Campaigns"
  description: "Ad"
  join: src_contactformsubmission {
    view_label: "Facebook Form Submission"
    type: left_outer
    relationship: one_to_many
    sql_on: (${src_facebook_ad.id} = ${src_contactformsubmission.fbadid} or (${src_contactformsubmission.fbadid} is null
            and ${src_facebook_ad.campaign_id} = ${src_contactformsubmission.fbcamapignid}))
            and ${src_contactformsubmission.submissiondate}=${src_facebook_adinsight.date_start_raw};;
    fields: []
  }
  join: src_facebook_adinsight {
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_facebook_ad.id} = ${src_facebook_adinsight.ad_id};;
    fields: []
  }
  join: src_facebook_campaign {
    view_label: "Campaign"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_facebook_ad.campaign_id} = ${src_facebook_campaign.id};;
    fields: []
  }
  join: src_contacts_id_fb {
    view_label: "Hubspot Contact"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_contacts_id_fb.vid} = ${src_contactformsubmission.vid};;
  }
  join: lt_contact_firsttouch {
    view_label: "First Touch"
    type: inner
    relationship: one_to_one
    sql_on: ${src_contacts_id_fb.vid} = ${lt_contact_firsttouch.vid};;
    fields: []
  }
  join: facebook_originated_contact_bv {
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_contacts_id_fb.vid} = ${facebook_originated_contact_bv.vid};;
    fields: []
  }
  join:src_oracle_contract_invoice {
    view_label: "Oracle Contract Invoices"
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_contacts_id_fb.email} = ${src_oracle_contract_invoice.customer_email};;
  }
  join: src_deals {
    view_label: "HS Deals"
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_deals.associated_vids} = to_char(${src_contacts_id_fb.vid});;
  }
  join: src_owners {
    view_label: "HS Owners"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_deals.deal_owner} = to_char(${src_owners.owner_id});;
  }

  join: src_stage {
    view_label: "HS Deal Stage"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_stage.stage_id}=${src_deals.deal_stageid};;
    fields: []
  }

  join: src_accountemails_hubspot {
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_accountemails_hubspot.email_address} = ${src_contacts_id_fb.email};;
    fields: []
  }

  join: ft_transactions_fb {
    type: left_outer
    relationship: many_to_one
    sql_on:${src_accountemails_hubspot.account_number}=${ft_transactions_fb.accountnumber_id};;
  }

  join: src_addtrandata {
    type: left_outer
    relationship: one_to_one
    sql_on:${src_addtrandata.document_number}=${ft_transactions_fb.documentnumber_id};;
    fields: []
  }

  join: transactions_lifetime_bv {
    type: inner
    relationship: many_to_many
    sql_on:${src_accountemails_hubspot.account_number}=${transactions_lifetime_bv.accountnumber_id};;
    fields: []
  }

  join: donor_first_transactiondate {
    from: donor_first_last_transactiondate_bv
    type: left_outer
    relationship: many_to_many
    sql_on: ${donor_first_transactiondate.accountnumber_id}=${ft_transactions_fb.accountnumber_id};;
    fields: []
  }
  join: ft_transactions_pre_after_bv {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ft_transactions_fb.documentnumber_id} = ${ft_transactions_pre_after_bv.documentnumber_id};;
    fields: []
  }
  join: src_forms {
    view_label: "Forms"
    type: inner
    relationship: many_to_one
    sql_on: ${src_forms.guid} = ${src_contactformsubmission.formid};;
    fields: []
  }
  join: src_contactlistmembers {
    view_label: "Contact List"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contacts_id_fb.vid} = ${src_contactlistmembers.vid};;
    fields: []
  }
  join: src_contactlists {
    view_label: "Contact List"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contactlists.list_id} = ${src_contactlistmembers.list_id};;
    fields: []
  }
}
