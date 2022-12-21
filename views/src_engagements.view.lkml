view: src_engagements {
  sql_table_name: "HUBSPOT"."SRC_ENGAGEMENTS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."Id" ;;
  }

  dimension: activity_type {
    type: string
    sql: ${TABLE}."ActivityType" ;;
  }

  dimension: associated_companies {
    type: string
    sql: ${TABLE}."AssociatedCompanies" ;;
  }

  dimension: associated_contacts {
    type: string
    sql: ${TABLE}."AssociatedContacts" ;;
  }

  dimension: associated_deals {
    type: string
    sql: ${TABLE}."AssociatedDeals" ;;
  }

  dimension: associated_owners {
    type: string
    sql: ${TABLE}."AssociatedOwners" ;;
  }

  dimension: associated_tickets {
    type: string
    sql: ${TABLE}."AssociatedTickets" ;;
  }

  dimension: associated_workflows {
    type: string
    sql: ${TABLE}."AssociatedWorkflows" ;;
  }

  dimension: attachments {
    type: string
    sql: ${TABLE}."Attachments" ;;
  }

  dimension: bcc {
    type: string
    sql: ${TABLE}."Bcc" ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}."Body" ;;
  }

  dimension: campaign_guid {
    type: string
    sql: ${TABLE}."CampaignGuid" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."Category" ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}."CategoryId" ;;
  }

  dimension: cc {
    type: string
    sql: ${TABLE}."Cc" ;;
  }

  dimension: content_id {
    type: string
    sql: ${TABLE}."ContentId" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CreatedAt" ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}."CreatedBy" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."DateTime" ;;
  }

  dimension: disposition {
    type: string
    sql: ${TABLE}."Disposition" ;;
  }

  dimension: duration_milliseconds {
    type: number
    sql: ${TABLE}."DurationMilliseconds" ;;
  }

  dimension: email_html {
    type: string
    sql: ${TABLE}."EmailHtml" ;;
  }

  dimension: email_text {
    type: string
    sql: ${TABLE}."EmailText" ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}."EndTime" ;;
  }

  dimension: external_account_id {
    type: string
    sql: ${TABLE}."ExternalAccountId" ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."ExternalId" ;;
  }

  dimension: extra_url_parameters {
    type: string
    sql: ${TABLE}."ExtraUrlParameters" ;;
  }

  dimension: for_object_type {
    type: string
    sql: ${TABLE}."ForObjectType" ;;
  }

  dimension: from_email {
    type: string
    sql: ${TABLE}."FromEmail" ;;
  }

  dimension: from_first_name {
    type: string
    sql: ${TABLE}."FromFirstName" ;;
  }

  dimension: from_last_name {
    type: string
    sql: ${TABLE}."FromLastName" ;;
  }

  dimension: from_number {
    type: string
    sql: ${TABLE}."FromNumber" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."IsActive" ;;
  }

  dimension: meeting_outcome {
    type: string
    sql: ${TABLE}."MeetingOutcome" ;;
  }

  dimension: message_id {
    type: string
    sql: ${TABLE}."MessageId" ;;
  }

  dimension: modified_by {
    type: number
    sql: ${TABLE}."ModifiedBy" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}."OwnerId" ;;
  }

  dimension: portal_id {
    type: number
    sql: ${TABLE}."PortalId" ;;
  }

  dimension: recording_url {
    type: string
    sql: ${TABLE}."RecordingUrl" ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}."StartTime" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."State" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."Status" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."Subject" ;;
  }

  dimension: task_type {
    type: string
    sql: ${TABLE}."TaskType" ;;
  }

  dimension: thread_id {
    type: string
    sql: ${TABLE}."ThreadId" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."Title" ;;
  }

  dimension: to_email {
    type: string
    sql: ${TABLE}."ToEmail" ;;
  }

  dimension: to_number {
    type: string
    sql: ${TABLE}."ToNumber" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."Type" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."UpdatedAt" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, from_first_name, name, from_last_name]
  }
}
