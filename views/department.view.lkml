view: department {
  sql_table_name: `dataset_in_us.department` ;;
  drill_fields: [department_id]

  dimension: department_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }
  dimension: department_name {
    type: string
    sql: ${TABLE}.DEPARTMENT_NAME ;;
  }
  dimension: location_id {
    type: number
    sql: ${TABLE}.LOCATION_ID ;;
  }
  dimension: manager_id {
    type: string
    sql: ${TABLE}.MANAGER_ID ;;
  }
  measure: count {
    type: count
    drill_fields: [department_id, department_name, department_data.count, employee.count]
  }
}
