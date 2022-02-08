connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore:src_contacts_id {
  persist_for: "8 hour"
  label: "Hubspot Contacts"
  view_label: "Contacts"
  description: "Contacts"
  join: src_contactformsubmission {
    view_label: "Form Submission"
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_contacts_id.vid} = ${src_contactformsubmission.vid};;
  }
  join: src_forms {
    view_label: "Forms"
    type: inner
    relationship: many_to_one
    sql_on: ${src_forms.guid} = ${src_contactformsubmission.formid};;
    fields: []
  }
  join: src_contactlistmembers {
    view_label: "Contact List Member"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contacts_id.vid} = ${src_contactlistmembers.vid};;
    fields: []
  }
  join: src_contactlists {
    view_label: "Contact List"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contactlists.list_id} = ${src_contactlistmembers.list_id};;
    fields: []
  }
  join: src_google_adwords_clicks {
    view_label: "Adwords Clicks"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_contacts_id.gcl_id} = ${src_google_adwords_clicks.gcl_id};;
    fields: []
  }
  join: src_google_adwords_adperformance_contactlist {
    view_label: "Adwords Ads"
    type: left_outer
    relationship: one_to_one
    sql_on: ${src_google_adwords_adperformance_contactlist.id} = ${src_google_adwords_clicks.creative_id} and ${src_google_adwords_adperformance_contactlist.date_raw}=${src_google_adwords_clicks.date_raw};;
  }

  join: src_accountemails_hubspot {
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_accountemails_hubspot.email_address} = ${src_contacts_id.email};;
    fields: []
  }

  join: ft_transactions_all {
    type: left_outer
    relationship: many_to_one
    sql_on:${src_accountemails_hubspot.account_number}=${ft_transactions_all.accountnumber_id};;
  }

  join: src_addtrandata {
    type: left_outer
    relationship: one_to_one
    sql_on:${src_addtrandata.document_number}=${ft_transactions_all.documentnumber_id};;
    fields: []
  }

  join: transactions_lifetime_bv {
    type: inner
    relationship: many_to_many
    sql_on:${ft_transactions_all.accountnumber_id}=${transactions_lifetime_bv.accountnumber_id};;
    fields: []
  }

  join: donor_first_transactiondate {
    from: donor_first_last_transactiondate_bv
    type: left_outer
    relationship: many_to_many
    sql_on: ${donor_first_transactiondate.accountnumber_id}=${ft_transactions_all.accountnumber_id};;
  }
  join: ft_transactions_pre_after_bv {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ft_transactions_all.documentnumber_id} = ${ft_transactions_pre_after_bv.documentnumber_id};;
    fields: []
  }
  join: lt_contact_firsttouch {
    view_label: "First Touch"
    type: left_outer
    relationship: one_to_one
    sql_on: ${src_contacts_id.vid} = ${lt_contact_firsttouch.vid};;
  }
  join: recurring_add_lost_details_bv {
    type: left_outer
    relationship: many_to_many
    sql_on:${src_accountemails_hubspot.account_number}=${recurring_add_lost_details_bv.accountnumber_id};;
    fields: []
  }
  join: recurring_accounts_bv {
    type: left_outer
    relationship: many_to_one
    sql_on:${src_accountemails_hubspot.account_number}=${recurring_accounts_bv.accountnumber_id};;
  }
  join: src_owners {
    type: left_outer
    relationship: many_to_one
    sql_on:${src_owners.owner_id}=${src_contacts_id.owner};;
    fields: []
  }
}
