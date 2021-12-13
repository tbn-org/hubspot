connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore:daily_spend_allsources_bv
{
  persist_for: "8 hour"
  label: "Marketing Daily Spend"
  description: "Marketing Daily Spend"
}
