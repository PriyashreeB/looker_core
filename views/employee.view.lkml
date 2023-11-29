view: employee {
  sql_table_name: `dataset_in_us.employee` ;;
  drill_fields: [employee_id]

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.EMPLOYEE_ID ;;
  }
  dimension: commission_pct {
    type: string
    sql: ${TABLE}.COMMISSION_PCT ;;
  }
  dimension: department_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }
  dimension_group: hire {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.HIRE_DATE ;;
  }
  dimension: job_id {
    type: string
    sql: ${TABLE}.JOB_ID ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }
  dimension: manager_id {
    type: string
    sql: ${TABLE}.MANAGER_ID ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}.PHONE_NUMBER ;;
  }
  dimension: salary {
    type: number
    sql: ${TABLE}.SALARY ;;
  }
  measure: count {
    type: count
    drill_fields: [employee_id, last_name, first_name, department.department_name, department.department_id]
  }
}
