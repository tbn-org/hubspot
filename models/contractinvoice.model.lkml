connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore:src_oracle_contract_invoice
{
  persist_for: "8 hour"
  label: "Oracle Contract Invoices"
  description: "Oracle Contract Invoices"

    join: src_contacts_id {
      view_label: "HS Contact"
      type: left_outer
      relationship: one_to_many
      sql_on: ${src_contacts_id.email} = ${src_oracle_contract_invoice.customer_email};;
    }

  join: src_deals {
    view_label: "HS Deals"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_deals.associated_vids} = to_char(${src_contacts_id.vid});;
  }

  join: src_dealstage {
    view_label: "HS Deal Stage"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_deals.deal_stage} = ${src_dealstage.stage_id});;
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
  join: src_contactformsubmission {
    view_label: "Facebook Form Submission"
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_contacts_id.vid} = ${src_contactformsubmission.vid};;
    fields: []
  }
  join:src_facebook_ad{
  view_label: "Facebook Campaigns"
    type: left_outer
    relationship: one_to_many
    sql_on:${src_facebook_ad.id} = ${src_contactformsubmission.fbadid};;
  }
  join: src_facebook_campaign {
    view_label: "Campaign"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_facebook_ad.campaign_id} = ${src_facebook_campaign.id};;
    fields: []
  }
  join: src_facebook_adinsight {
    type: left_outer
    relationship: one_to_one
    sql_on: ${src_facebook_ad.id} = ${src_facebook_adinsight.ad_id};;
    fields: []
  }
}
