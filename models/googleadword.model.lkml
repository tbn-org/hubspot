connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore:src_google_adwords_adperformance
{
  persist_for: "8 hour"
  label: "Google Adwords"
  description: "Google Adwords"

  join: src_contacts_id_google {
    view_label: "HS Contact"
    type: left_outer
    relationship: one_to_one
    sql_on: ${src_contacts_id_google.gcl_id} = ${src_google_adwords_clicks.gcl_id};;
  }
  join: src_google_adwords_clicks {
    view_label: "Adwords Clicks"
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_google_adwords_adperformance.id} = ${src_google_adwords_clicks.creative_id} and ${src_google_adwords_adperformance.date_raw}=${src_google_adwords_clicks.date_raw};;
    fields: []
  }
  join: src_contactlistmembers {
    view_label: "Contact List"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contacts_id_google.vid} = ${src_contactlistmembers.vid};;
    fields: []
  }
  join: src_contactlists {
    view_label: "Contact List"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contactlists.list_id} = ${src_contactlistmembers.list_id};;
    fields: []
  }
  join: google_adword_donations_bv {
    type: left_outer
    relationship: one_to_many
    sql_on:${src_google_adwords_adperformance.id}=${google_adword_donations_bv.kv_value} and ${google_adword_donations_bv.kv_name}='hsa_ad' and ${src_google_adwords_adperformance.date_date}=${google_adword_donations_bv.transaction_date};;
    fields: []
  }
  join: src_addtrandata {
    type: left_outer
    relationship: one_to_one
    sql_on:${src_addtrandata.transaction_id}=to_char(${google_adword_donations_bv.transaction_id});;
    fields: []
  }
  join: ft_transactions_google {
    type: left_outer
    relationship: one_to_one
    sql_on:${src_addtrandata.document_number}=${ft_transactions_google.documentnumber_id} and ${ft_transactions_google.sourcecode_cd}!='T00REC';;
  }
  join: transactions_lifetime_bv {
    type: inner
    relationship: many_to_many
    sql_on:${ft_transactions_google.accountnumber_id}=${transactions_lifetime_bv.accountnumber_id};;
    fields: []
  }
  join: donor_first_transactiondate {
    from: donor_first_last_transactiondate_bv
    type: left_outer
    relationship: many_to_many
    sql_on: ${donor_first_transactiondate.accountnumber_id}=${ft_transactions_google.accountnumber_id};;
    fields: []
  }
  join: ft_transactions_pre_after_bv {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ft_transactions_google.documentnumber_id} = ${ft_transactions_pre_after_bv.documentnumber_id};;
    fields: []
  }
}
