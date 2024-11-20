connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore:ft_transactions_all
{
persist_for: "8 hour"
label: "Donations"
description: "Donations"

join: src_addtrandata {
  type: left_outer
  relationship: one_to_one
  sql_on:${src_addtrandata.document_number}=${ft_transactions_all.documentnumber_id};;
  fields: []
}
  join: ft_campaign {
    type: left_outer
    relationship: many_to_one
    sql_on:${src_addtrandata.campaign}=${ft_campaign.campaign_code};;
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
    fields: []
  }
  join: ft_transactions_pre_after_bv {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ft_transactions_all.documentnumber_id} = ${ft_transactions_pre_after_bv.documentnumber_id};;
    fields: []
  }
}
