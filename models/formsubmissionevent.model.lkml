connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore:src_contacts_id {
  persist_for: "8 hour"
  label: "Contacts"
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
    view_label: "Contact List"
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
}
