view: src_facebook_adcreative {
  sql_table_name: "HUBSPOT"."SRC_FACEBOOK_ADCREATIVE"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}."BODY" ;;
  }

  dimension:creative_set  {
    type: string
    sql: ${TABLE}."TITLE" ;;
    html:
        <table>
          <tr>
            <td><img src="{{src_facebook_adcreative.thumbnail_url}}"</td>
            <td>
              <table>
                <tr><td><b>{{src_facebook_adcreative.title}}</b></td></tr>
                <tr><td>{{src_facebook_adcreative.body}}</td></tr>
              </table>
            </td>
          </tr>
        </table>;;
  }
  dimension: thumbnail_url {
    label: "Thumbnail"
    type: string
    sql: ${TABLE}."THUMBNAIL_URL" ;;
    html:
      <img src="{{src_facebook_adcreative.thumbnail_url}}";;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }
}
